# encoding: utf-8
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)
require 'version'

# this is built using these instructions: http://yehudakatz.com/2010/04/02/using-gemspecs-as-intended/
Gem::Specification.new do |s|
  s.name = "ar_csv_importer"
  s.version = ARCSVImporter::VERSION
  s.homepage = "http://github.com/SeanRoberts/ar_csv_importer"
  s.license = "MIT"
  s.summary = "Easily add CSV import tools to any ActiveRecord model."
  s.description = "Easily add CSV import tools to any ActiveRecord model."
  s.email = "roberts.sean@gmail.com"
  s.authors = ["Sean Roberts"]

  s.required_rubygems_version = ">= 1.5.2"
  s.required_ruby_version = ">= 1.9.3"

  s.add_dependency 'rack', '1.4.5'
  s.add_dependency 'rake', '>= 0.9.2'
  s.add_dependency 'rails', '3.2.13'

  s.files        = Dir.glob("{lib}/**/*")
  s.require_path = 'lib'
end
