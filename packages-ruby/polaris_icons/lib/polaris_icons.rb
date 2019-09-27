module PolarisIcons
  autoload :AssetCatalog, 'polaris_icons/asset_catalog'
  autoload :DrawablesGenerator, 'polaris_icons/drawables_generator'

  def self.execute(*command, stdin_data: nil)
    _, error, status = Open3.capture3(*command, stdin_data: stdin_data)
    raise StandardError, error unless status.success?
  end
end
