require 'pathname'
require 'sqlite3'

APP_ROOT = Pathname.new(File.dirname(File.expand_path(__FILE__)))

require APP_ROOT.join('app', 'models', 'student')
require APP_ROOT.join('app', 'models', 'teacher')
require APP_ROOT.join('app', 'models', 'database_model')

Database::Model.database = APP_ROOT.join('db', 'ar-students.sqlite3')