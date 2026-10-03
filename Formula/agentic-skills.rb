# Generated with JReleaser 1.26.0 at 2026-10-03T08:55:50.545504999Z

class AgenticSkills < Formula
  desc "Interactive installer for AI agent skills, agents, commands, hooks and MCP servers"
  homepage "https://github.com/alt-Ash/agentic-skills-bundle"
  url "https://github.com/alt-Ash/agentic-skills-bundle/releases/download/v3.2.0/agentic-skills-3.2.0.jar", :using => :nounzip
  version "3.2.0"
  sha256 "e0631297b66d67e7def8b6ddede9b497712e3a5d6179d16010c1e01917e207d7"
  license "MIT"

  depends_on "openjdk@21"

  def install
    libexec.install "agentic-skills-3.2.0.jar"

    bin.mkpath
    File.open("#{bin}/agentic-skills", "w") do |f|
      f.write <<~EOS
        #!/bin/bash
        export JAVA_HOME="#{Language::Java.overridable_java_home_env(nil)[:JAVA_HOME]}"
        exec "${JAVA_HOME}/bin/java" -jar #{libexec}/agentic-skills-3.2.0.jar "$@"
      EOS
    end
  end

  test do
    output = shell_output("#{bin}/agentic-skills --version")
    assert_match "3.2.0", output
  end
end
