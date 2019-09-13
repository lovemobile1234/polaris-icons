require 'tmpdir'

module TestHelper
  module Temporary
    def setup
      super
      @tmp_dir = Dir.mktmpdir
    end

    def teardown
      super
      FileUtils.remove_entry(@tmp_dir)
    end
  end
end
