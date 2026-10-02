# Generated with JReleaser 1.26.0 at 2026-10-02T17:44:51.237342741Z

class AgenticSkills < Formula
  desc "Interactive installer for AI agent skills, agents, commands, hooks and MCP servers"
  homepage "https://github.com/alt-Ash/agentic-skills-bundle"
  url "https://github.com/alt-Ash/agentic-skills-bundle/releases/download/v3.0.0/agentic-skills-3.0.0.jar", :using => :nounzip
  version "3.0.0"
  sha256 "15e4f84a15fc695f6c8ab38a73d9357f79b653c5e675205f82dc9f54fb3f94fe"
  license "MIT"

  depends_on "openjdk@21"

  def install
    libexec.install "agentic-skills-3.0.0.jar"

    bin.mkpath
    File.open("#{bin}/agentic-skills", "w") do |f|
      f.write <<~EOS
        #!/bin/bash
        export JAVA_HOME="#{Language::Java.overridable_java_home_env(nil)[:JAVA_HOME]}"
        exec "${JAVA_HOME}/bin/java" -jar #{libexec}/agentic-skills-3.0.0.jar "$@"
      EOS
    end
  end

  test do
    output = shell_output("#{bin}/agentic-skills --version")
    assert_match "3.0.0", output
  end
end
