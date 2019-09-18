require 'fileutils'
require 'json'

module PolarisIcons
  class AssetCatalog

    def initialize(name: "PolarisIcons", author: "Polaris")
      @name = name
      @author = author
      @pdfs = []
    end

    def add_pdf(path)
      @pdfs << path
    end

    def write(path)
      xcassets_path = File.join(path, "#{@name}.xcassets")
      FileUtils.mkdir_p(xcassets_path)

      write_contents_json(xcassets_path)
      write_image_sets(xcassets_path)
    end

    private

    def write_image_sets(xcassets_path)
      @pdfs.each do |pdf_path|
        file_name = File.basename(pdf_path)
        name = file_name.gsub(".pdf", "")

        imageset_path = File.join(xcassets_path, "#{name}.imageset")
        FileUtils.mkdir_p(imageset_path)

        # Copy the image
        FileUtils.cp(pdf_path, File.join(imageset_path, file_name))

        contents = {
          images: [
            {
              idiom: "universal",
              filename: file_name
            }
          ],
          properties: {
            "template-rendering-intent" => "template"
          }
        }
        contents.merge!(info)
        json = JSON.pretty_generate(contents)
        File.write(File.join(imageset_path, "Contents.json"), json)
      end
    end

    def write_contents_json(xcassets_path)
      json = JSON.pretty_generate(info)
      File.write(File.join(xcassets_path, "Contents.json"), json)
    end

    def info
      {
        info: {
          version: 1,
          author: @author
        }
      }
    end

  end
end
