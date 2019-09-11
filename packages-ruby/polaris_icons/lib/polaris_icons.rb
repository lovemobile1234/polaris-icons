module PolarisIcons
  autoload :AssetCatalog, 'polaris_icons/asset_catalog'
  autoload :SwiftInterfaceGenerator, 'polaris_icons/swift_interface_generator'

  def self.execute(*command)
    _, error, status = Open3.capture3(*command)
    raise StandardError, error unless status.success?
  end
end
