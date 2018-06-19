#!/usr/bin/python

import argparse
import json
import io
import os
import re
import sys


re_import = re.compile(r"{-.*?-}|^import\s+([A-Z][\w\.]*)", re.DOTALL | re.MULTILINE)

# source text -> [modulename]
def extract_imports(text):
    return filter(lambda s: s != "", re_import.findall(text))


# source text -> modulename
def extract_modulename(text):
    match = re.match(r"(?:port )?module\s+([A-Z][\w\.]*)", text)
    return match.group(1) if match is not None else None


# repo path -> "<user>/<project>"
def extract_packagename(repository):
    match = re.search(r"([^\/]+\/[^\/]+?)(\.\w+)?$", repository)
    return match.group(1) if match is not None else None


# -> maybe filepath of nearest elm-package.json
def find_elmpackagejson(path):
    elmpackagejson = os.path.join(path, "elm-package.json")
    if not os.path.exists(path) or os.path.ismount(path):
        return None
    elif os.path.isfile(elmpackagejson):
        return elmpackagejson
    else:
        return find_elmpackagejson(os.path.dirname(path))


# -> [(sourcedir, packagename)]
def list_sourcedirs_package(packagedir, maybepackagename):
    packagedata = json.load(open(os.path.join(packagedir, "elm-package.json")))
    packagename = maybepackagename or extract_packagename(packagedata.get("repository", "")) or "user/project"
    return map(
        lambda dir: (os.path.normpath(os.path.join(packagedir, dir)), packagename),
        packagedata.get("source-directories", [])
    )


# -> [(sourcedir, packagename)]
def list_sourcedirs(packagedir):
    sourcedirs = list_sourcedirs_package(packagedir, None)
    exactdependencies = json.load(open(os.path.join(packagedir, "elm-stuff", "exact-dependencies.json")))
    dependencysourcedirs = concatmap(
        lambda (packagename, version): list_sourcedirs_package(os.path.join(packagedir, "elm-stuff", "packages", packagename, version), packagename),
        exactdependencies.items()
    )
    return sourcedirs + dependencysourcedirs


def concatmap(f, list):
    return reduce(lambda r, x: r + f(x), list, [])


# -> (sourcefile, packagename)
def find_sourcefile(sourcedirs, modulename):
    segments = modulename.split(".")
    for sourcedir, packagename in sourcedirs:
        sourcefile = os.path.join(sourcedir, *segments) + ".elm"
        if os.path.isfile(sourcefile):
            return (sourcefile, packagename)
    return (None, None)


# -> graph = {modulename: {"imports": [modulename], "package": string}
def imports_from_module(sourcedirs, modulename, graph):
    (sourcefile, packagename) = find_sourcefile(sourcedirs, modulename)
    if sourcefile is None:
        print "warning: source file not found for module name: " + modulename
        return graph

    imports = filter(
        lambda m: m[0:7] != "Native.",
        extract_imports(open(sourcefile).read())
    )
    graph[modulename] = {"imports": imports, "package": packagename}
    nextmodules = filter(lambda m: m not in graph, imports)
    return imports_from_modules(sourcedirs, nextmodules, graph)


def imports_from_modules(sourcedirs, modulenames, graph):
    return reduce(lambda g, m: imports_from_module(sourcedirs, m, g), modulenames, graph)


# filepath -> (elmpackagejson, [modulename])
def info_from_filepath(filepath):
    if os.path.basename(filepath) == "elm-package.json":
        # elm-package.json
        modulenames = json.load(open(filepath)).get("exposed-modules", [])
        return (filepath, modulenames)
    else:
        # <Module>.elm
        elmpackagejson = find_elmpackagejson(filepath)
        modulename = extract_modulename(open(filepath).read()) or "Main"
        return (elmpackagejson, [modulename])


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("-o", "--output", default="module-graph.json", help="file to write to (default: module-graph.json)")
    parser.add_argument("filepath", help="path to .elm file or elm-package.json")
    args = parser.parse_args()

    filepath = os.path.abspath(args.filepath)

    if not os.path.isfile(filepath):
        print "error: file not found: " + filepath
        sys.exit(1)

    (elmpackagejson, modulenames) = info_from_filepath(filepath)

    if elmpackagejson is None:
        print "error: elm-package.json not found for: " + filepath
        sys.exit(1)

    packagedir = os.path.dirname(elmpackagejson)

    if not os.path.exists(os.path.join(packagedir, "elm-stuff")):
        print "error: elm-stuff folder not found (run elm-make and try again)"
        sys.exit(1)

    sourcedirs = list_sourcedirs(packagedir)
    modulegraph = imports_from_modules(sourcedirs, modulenames, {})

    output = io.open(args.output, "w", encoding="utf-8")
    output.write(unicode(json.dumps(modulegraph, indent=2, separators=[",", ": "]), encoding="utf-8-sig"))
    output.close()


if __name__ == "__main__":
    main()
