require 'logger'

module Loggeable
  # This is the magical bit that gets mixed into your classes
  def logger
    Loggeable.logger
  end

  # Global, memoized, lazy initialized instance of a logger
  def self.logger

    @logger ||= create_log_file("udacityLog.log")
  end

  def self.create_log_file(filename)
    if File.file?(filename)
      puts "INFO -> The Log file #{filename} Already Exists, Deleting it"
      FileUtils.rm(filename)
    end
    return Logger.new(filename)
  end
end
