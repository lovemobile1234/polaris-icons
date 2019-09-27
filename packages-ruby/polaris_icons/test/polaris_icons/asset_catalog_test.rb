require 'test_helper'
require 'tmpdir'
require 'fileutils'
require 'json'

module PolarisIcons
  class AssetCatalogTest < MiniTest::Test
    include TestHelper::Fixtures
    include TestHelper::Temporary

    def setup
      super
      @subject = AssetCatalog.new
    end

    def test_generate
      # Given
      icon_path = File.join(@tmp_dir, "icon.pdf")
      FileUtils.cp(fixture_path("icon.pdf"), icon_path)
      @subject.add_pdf(icon_path)

      # When
      @subject.write(@tmp_dir)

      # Then
      asset_catalog_path = Dir.glob(File.join(@tmp_dir, "*.xcassets")).first
      assert asset_catalog_path
      imageset_path = File.join(asset_catalog_path, "icon.imageset")
      assert File.directory?(imageset_path)

      content = JSON.load(File.open(File.join(imageset_path, "Contents.json")))
      expected = {
        "images"=>[{"idiom"=>"universal", "filename"=>"icon.pdf"}],
        "properties"=>{"template-rendering-intent"=>"template", "preserves-vector-representation" => true},
        "info"=>{"version"=>1, "author"=>"Polaris"}
      }
      assert_equal expected, content
    end
  end
end
