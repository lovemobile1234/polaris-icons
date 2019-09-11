require 'test_helper'
require 'tmpdir'
require 'fileutils'

module PolarisIcons
  class SwiftInterfaceGeneratorTest < MiniTest::Test
    include TestHelper::Fixtures

    def setup
      super
      @tmp_dir = Dir.mktmpdir
      @asset_catalog = AssetCatalog.new
      @subject = SwiftInterfaceGenerator.new
    end

    def teardown
      super
      FileUtils.remove_entry(@tmp_dir)
    end

    def test_generate
      icon_path = File.join(@tmp_dir, "icon.pdf")
      FileUtils.cp(fixture_path("icon.pdf"), icon_path)
      @asset_catalog.add_pdf(icon_path)
      @asset_catalog.write(@tmp_dir)

      # When
      @subject.generate(asset_catalogs_dir: @tmp_dir)
    end
  end
end
