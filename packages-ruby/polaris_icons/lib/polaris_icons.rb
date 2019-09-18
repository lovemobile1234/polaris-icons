module PolarisIcons
  autoload :AssetCatalog, 'polaris_icons/asset_catalog'

  def self.execute(*command)
    _, error, status = Open3.capture3(*command)
    raise StandardError, error unless status.success?
  end
end
