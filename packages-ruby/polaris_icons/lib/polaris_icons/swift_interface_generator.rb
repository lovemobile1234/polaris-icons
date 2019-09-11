require 'open3'
require 'tmpdir'
require 'yaml'

module PolarisIcons
  class SwiftInterfaceGenerator
    SwiftGenNotFound = Class.new(StandardError)

    def generate(asset_catalogs_dir:)
      raise SwiftGenNotFound unless swiftgen_available?

      Dir.mktmpdir do |tmp_dir|
        # Write config
        swiftgen_config = swiftgen_config(asset_catalogs_dir: asset_catalogs_dir)
        swiftgen_config_path = File.join(tmp_dir, "swiftgen.yml")

        # Generate
        File.write(swiftgen_config_path, swiftgen_config.to_yaml)
        PolarisIcons.execute(
          "swiftgen", "config", "run",
          "--config", swiftgen_config_path
        )
      end
    end

    private

    def swiftgen_config(asset_catalogs_dir:)
      {
        "xcassets" => {
          "inputs" => Dir.glob(File.join(asset_catalogs_dir, "*.xcassets")),
          "outputs" => [
            {
              "templatePath" => File.join(__dir__, "swift_interface_generator/asset_catalog.stencil"),
              "output" => File.join(asset_catalogs_dir, "PolarisIcons.swift"),
              "params" => {
                "enumName" => "PolarisIcons",
                "publicAccess" => true
              }
            },
            {
              "templatePath" => File.join(__dir__, "swift_interface_generator/typealiases.stencil"),
              "output" => File.join(asset_catalogs_dir, "PolarisIconsTypealiases.swift"),
              "params" => {
                "publicAccess" => true
              }
            }
          ]
        }
      }
    end

    def swiftgen_available?
      _, status = Open3.capture2("which", "swiftgen")
      status.success?
    end
  end
end
