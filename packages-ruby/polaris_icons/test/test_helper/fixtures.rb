module TestHelper
  module Fixtures
    def fixture_path(path)
      File.join(File.expand_path("../fixtures", __dir__), path)
    end
  end
end
