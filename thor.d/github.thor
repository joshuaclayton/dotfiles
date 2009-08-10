#!/usr/bin/env ruby

class Github < Thor
  desc "track <user> [<branch-name>]", "track a fork belonging to <user>"
  def track(user, branch_name = nil)
    branch_name ||= user
    git %(remote add #{user} git://github.com/#{user}/#{project_name}.git)
    git %(fetch --no-tags #{user} master:refs/remotes/#{user}/master)
    git %(branch #{branch_name} --track #{user}/master)
  end

  desc "update", "checkout each branch that has a remote and git pull"
  def update
    all = branches
    current = all.first
    last = nil
    branches_with_remotes = all.reject { |branch| remote_for_branch(branch) == "" }

    branches_with_remotes.reverse.each do |branch|
      git %(checkout #{branch})
      git "pull -v --no-tags"
      last = branch
    end

    git %(checkout #{current}) unless last == current
  end

  private

  def command(com, capture = false)
    unless capture
      system(com)
    else
      %x(#{com}).chomp
    end
  end

  def git(com, capture = false)
    command("git #{com}", capture)
  end

  def project_name
    user_and_repo_from(remote_url("origin")).last.chomp(".git")
  end

  def user_and_repo_from(url)
    case url
    when %r|^git://github\.com/([^/]+/[^/]+)$|: $1.split('/')
    when %r|^(?:ssh://)?(?:git@)?github\.com:([^/]+/[^/]+)$|: $1.split('/')
    end
  end

  def remote_url(remote)
    git %(config --get remote.#{remote}.url), true
  end

  def remote_for_branch(name)
    git %(config --get branch.#{name}.remote), true
  end

  def remotes
    git("remote", true).split("\n")
  end

  # fetches list of local branches with current being first
  def branches
    git("branch", true).split("\n").inject([]) do |all, line|
      unless "*" == line[0, 1]
        all << line.strip
      else
        all.unshift line.sub(/^\*\s+/, "")
      end
    end
  end
end
