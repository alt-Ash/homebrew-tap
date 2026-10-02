# Generated with JReleaser 1.26.0 at 2026-10-02T18:49:25.319913553Z

class AgenticSkills < Formula
  desc "Interactive installer for AI agent skills, agents, commands, hooks and MCP servers"
  homepage "https://github.com/alt-Ash/agentic-skills-bundle"
  url "https://github.com/alt-Ash/agentic-skills-bundle/releases/download/v3.1.0/agentic-skills-3.1.0.jar", :using => :nounzip
  version "3.1.0"
  sha256 "9403a171990bd8d9dba93478f5e505cf5f9889f06d9f4cb1a26a9a6cc4473f11"
  license "MIT"

  depends_on "openjdk@21"

  def install
    libexec.install "agentic-skills-3.1.0.jar"

    bin.mkpath
    File.open("#{bin}/agentic-skills", "w") do |f|
      f.write <<~EOS
        #!/bin/bash
        export JAVA_HOME="#{Language::Java.overridable_java_home_env(nil)[:JAVA_HOME]}"
        exec "${JAVA_HOME}/bin/java" -jar #{libexec}/agentic-skills-3.1.0.jar "$@"
      EOS
    end
  end

  test do
    output = shell_output("#{bin}/agentic-skills --version")
    assert_match "3.1.0", output
  end
end
