require 'test_helper'
require 'tmpdir'
require 'fileutils'
require 'json'

module PolarisIcons
  class DrawablesGeneratorTest < MiniTest::Test
    include TestHelper::Temporary

    def setup
      super
      @subject = DrawablesGenerator.new
    end

    def test_generate
      # Given
      svgs_path = File.join(@tmp_dir, "svgs")
      drawables_path = File.join(@tmp_dir, "drawables")
      root_path = File.expand_path("../../../..", __dir__)

      PolarisIcons
        .expects(:execute)
        .with("yarn",
          "--cwd", root_path,
          "run", "svg2vectordrawable",
          "-f", svgs_path,
          "-o", drawables_path
        )

      # Then
      @subject.generate(svgs_path, drawables_path)
    end
  end
end
