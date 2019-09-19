module PolarisIcons
  autoload :AssetCatalog, 'polaris_icons/asset_catalog'

  def self.execute(*command, stdin_data: nil)
    _, error, status = Open3.capture3(*command, stdin_data: stdin_data)
    raise StandardError, error unless status.success?
  end
end
