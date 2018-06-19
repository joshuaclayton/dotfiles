#!/usr/bin/env ruby

require "json"

# puts content.keys

class BuildStructure
  def initialize(json)
    @json = json
    @registry = ModuleRegistry.new

    @registry.process do |registry|
      @json.each_with_index do |(k, v), i|
        registry.register("u#{i}", k, v["imports"], v["package"])
      end
    end
  end

  attr_reader :registry
end

class ElmModule < Struct.new(:id, :name, :imports, :package)
  def app?
    package == "user/project"
  end
end

class ElmImport < Struct.new(:id, :name, :package)
  def app?
    package == "user/project"
  end
end

class ModuleRegistry
  def initialize
    @modules = []
  end

  def process(&block)
    yield self
    finalize_import_associations
    self
  end

  def register(id, name, imports, package)
    real_imports = imports.map do |import|
      ElmImport.new(nil, import, nil)
    end

    @modules << ElmModule.new(id, name, real_imports, package)
  end

  def to_dot
    res = []
    res << "digraph G {"
    res << "size=\"6,4\";"
    res << "ratio=\"fill\";"
    res << "subgraph cluster_0 {"
    res << "label=\"Data\";"
    res << "color=\"#ccffcc\";"
    res << "style=\"filled\";"
    @modules.each do |mod|
      if mod.app?
        res << "#{mod.id}[label=\"#{mod.name}\"];"
      end
    end
    res << "}"
    @modules.each do |mod|
      mod.imports.each do |import|
        if mod.app? && import.app?
          res << "#{mod.id} -> #{import.id};"
        end
      end
    end
    res << "}"

    res.join("\n")
  end

  attr_reader :modules

  private

  def find_by_module_name(name)
    @modules.detect do |mod|
      mod.name == name
    end || ElmModule.new(nil, nil, [], nil)
  end

  def finalize_import_associations
    @modules.each do |elm_module|
      elm_module.imports =
        elm_module.imports.map do |import|
          match = find_by_module_name(import.name)
          import.id = match.id
          import.package = match.package
          import
        end
    end
  end
end

content = JSON.parse(ARGF.read)
puts BuildStructure.new(content).registry.to_dot
