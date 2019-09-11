$LOAD_PATH.unshift(File.expand_path("../../lib", __FILE__))

require "polaris_icons"

require "minitest/autorun"
require "mocha/minitest"
require "byebug"
require "minitest/reporters"

require 'test_helper/fixtures'

Minitest::Reporters.use!(Minitest::Reporters::SpecReporter.new)
