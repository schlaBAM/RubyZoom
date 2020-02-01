# frozen_string_literal: true

module Logging
  def logger
    @logger = Logger.new(STDOUT)
  end
end
