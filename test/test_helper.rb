# frozen_string_literal: true
begin
  addpath = lambda do |p|
    path = File.expand_path("../../#{p}", __FILE__)
    $LOAD_PATH.unshift(path) unless $LOAD_PATH.include?(path)
  end
  addpath.call("lib")
end

require 'cli/kit'

require 'fileutils'
require 'tmpdir'
require 'tempfile'

require 'rubygems'
require 'bundler/setup'

CLI::UI::StdoutRouter.enable

require 'minitest/autorun'
require "minitest/unit"
require 'mocha/minitest'

require_relative '../lib/rubyzoom/catalogue'
require_relative '../lib/rubyzoom/team'
require_relative '../lib/rubyzoom/player'
require_relative '../lib/rubyzoom/skater'
require_relative '../lib/rubyzoom/goalie'
