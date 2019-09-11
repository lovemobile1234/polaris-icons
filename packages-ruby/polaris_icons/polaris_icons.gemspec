require './version'

Gem::Specification.new do |spec|
  spec.name          = "polaris_icons"
  spec.version       = PolarisIcons::VERSION
  spec.authors       = ["amrocha"]
  spec.email         = ["andre.rocha@shopify.com"]
  spec.licenses      = ['SEE LICENSE.md']

  spec.summary       = "Asset gem containing all of the official icons in Polaris"
  spec.description   = "Asset gem containing all of the official icons in Polaris"
  spec.homepage      = "https://github.com/Shopify/polaris-icons/"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "https://packages.shopify.io"

    spec.metadata["homepage_uri"] = spec.homepage
    spec.metadata["source_code_uri"] = "https://github.com/Shopify/polaris-icons/"
    spec.metadata["changelog_uri"] = "https://github.com/Shopify/polaris-icons/blob/master/packages/polaris-icons/CHANGELOG.md"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir[
    "{images}/**/*",
    "package.json",
    "README.md",
    "LICENSE.md",
  ]

  spec.add_development_dependency "bundler", "~> 1.17"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "json", "~> 2.2"
  spec.add_development_dependency "byebug", "~> 11.0"
end
