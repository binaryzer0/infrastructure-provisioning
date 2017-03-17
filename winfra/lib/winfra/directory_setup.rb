require 'fileutils'

module Winfra
  class DirectorySetup
    def setup(path, env)
      create_directory("#{path}/infrastructure/")
      create_directory("#{path}/infrastructure/modules/")
      create_directory("#{path}/infrastructure/stages/")
      create_directory("#{path}/infrastructure/stages/#{env}/")
    end

    private

    def create_directory(path)
      puts "Creating directory #{path} if it doesn't exist"
      FileUtils.mkdir_p(path)
    end
  end
end