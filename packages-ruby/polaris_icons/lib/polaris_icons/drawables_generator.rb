require 'open3'
require 'tmpdir'
require 'yaml'
require "fileutils"

module PolarisIcons
  class DrawablesGenerator
    def generate(svgs_path, drawables_path)
      root_path = File.expand_path("../../../../", __dir__)
      jar_path = File.join(root_path, "bin", "svg2vd-0.1.jar")

      Dir.glob(File.join(svgs_path, "*.svg")) do |svg_path|
        # Android doesn't support the "-" character in the name, which some icons have.
        path_with_valid_name = File.join(File.dirname(svg_path), File.basename(svg_path).gsub("-", "_"))
        unless path_with_valid_name == svg_path
          FileUtils.move(svg_path, path_with_valid_name, force: true)
        end

        PolarisIcons.execute("java", "-jar", jar_path, path_with_valid_name, drawables_path)
      end
    end
  end
end
