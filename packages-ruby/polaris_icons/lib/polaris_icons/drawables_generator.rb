require 'open3'
require 'tmpdir'
require 'yaml'

module PolarisIcons
  class DrawablesGenerator
    def generate(svgs_path, drawables_path)
      root_path = File.expand_path("../../../../", __dir__)
      PolarisIcons.execute("yarn", "--cwd", root_path, "run", "svg2vectordrawable", "-f", svgs_path, "-o", drawables_path)
    end
  end
end
