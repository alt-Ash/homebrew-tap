# Generated with JReleaser 1.26.0 at 2026-10-01T14:40:57.419445644Z

class AgenticSkills < Formula
  desc "Interactive installer for AI agent skills, agents, commands, hooks and MCP servers"
  homepage "https://github.com/alt-Ash/agentic-skills-bundle"
  url "https://github.com/alt-Ash/agentic-skills-bundle/releases/download/v2.0.0/agentic-skills-2.0.0.jar", :using => :nounzip
  version "2.0.0"
  sha256 "1755b790109af08be7216a03884dda3a7f8fa6b6826d928fb06f6dcda78d185b"
  license "MIT"

  depends_on "openjdk@21"

  def install
    libexec.install "agentic-skills-2.0.0.jar"

    bin.mkpath
    File.open("#{bin}/agentic-skills", "w") do |f|
      f.write <<~EOS
        #!/bin/bash
        export JAVA_HOME="#{Language::Java.overridable_java_home_env(nil)[:JAVA_HOME]}"
        exec "${JAVA_HOME}/bin/java" -jar #{libexec}/agentic-skills-2.0.0.jar "$@"
      EOS
    end
  end

  test do
    output = shell_output("#{bin}/agentic-skills --version")
    assert_match "2.0.0", output
  end
end
