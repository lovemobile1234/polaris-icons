require 'open3'
require 'tmpdir'
require 'yaml'

module PolarisIcons
  class DrawablesGenerator
    SVG2VectorDrawableNotFound = Class.new(StandardError)

    def generate(svgs_path, drawables_path)
      unless File.exists?(svg2_bin_path)
        raise SVG2VectorDrawableNotFound, "svg2vectordrawable not found, make sure it's defined as a dev dependency in the package.json"
      end

      #s2v -f input_folder -o output_folder
      PolarisIcons.execute(svg2_bin_path, "-f", svgs_path, "-o", drawables_path)
    end

    def svg2_bin_path
      File.expand_path("../../../../node_modules/svg2vectordrawable/bin/svg2vectordrawable", __dir__)
    end
  end
end
