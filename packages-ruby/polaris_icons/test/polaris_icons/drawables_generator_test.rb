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
      FileUtils.mkdir_p(svgs_path)
      svg_path = File.join(svgs_path, "polaris-icon.svg")
      FileUtils.touch(svg_path)
      drawables_path = File.join(@tmp_dir, "drawables")
      root_path = File.expand_path("../../../..", __dir__)

      PolarisIcons
        .expects(:execute)
        .with(
          "java",
          "-jar",
          File.join(root_path, "bin/svg2vd-0.1.jar"),
          File.join(svgs_path, "polaris_icon.svg"),
          drawables_path
        )

      # Then
      @subject.generate(svgs_path, drawables_path)
    end
  end
end
