APP_ROOT = ::File.expand_path(::File.dirname(__FILE__))
$:.unshift APP_ROOT
$:.unshift APP_ROOT+'/lib'

use Rack::Static, :urls => ['/uploads']

require 'main'
require 'file_processor'

run Sinatra::Application
