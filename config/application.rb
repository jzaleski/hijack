# Silence warnings by default, but provide an easy means through an environment
# variable to re-enable them if so desired
$VERBOSE = nil unless ENV['VERBOSE']

# Store the path to the "root" directory as a constant
ROOT_DIR = File.expand_path(File.dirname(__FILE__) + '/..')

# Store the path to the "app" directory as a constant
APP_DIR = "#{ROOT_DIR}/app"

# Store the path to the "bridges" directory as a constant
BRIDGES_DIR = "#{APP_DIR}/bridges"

# Store the path to the "config" directory as a constant
CONFIG_DIR = "#{ROOT_DIR}/config"

# Store the path to the "classes" directory as a constant
CLASSES_DIR = "#{APP_DIR}/classes"

# Store the path to the "helpers" directory as a constant
HELPERS_DIR = "#{APP_DIR}/helpers"

# Store the path to the "interfaces" directory as a constant
INTERFACES_DIR = "#{APP_DIR}/interfaces"

# Store the path to the "mixins" directory as a constant
MIXINS_DIR = "#{APP_DIR}/mixins"

# Store the path to the "refinements" directory as a constant
REFINEMENTS_DIR = "#{APP_DIR}/refinements"

# Store the path to the "scripts" directory as a constant
SCRIPTS_DIR = "#{APP_DIR}/scripts"

# Ensure that the "app" directory is in the load-path
$LOAD_PATH.unshift(APP_DIR) unless $LOAD_PATH.include?(APP_DIR)

# General require(s)
REQUIRED_MODULES = %w[
  erb
  json
  openssl
  readline
  rexml/document
  set
  sinatra/base
  socket
  thread
]
REQUIRED_MODULES += Dir["#{CLASSES_DIR}/*.rb"]
REQUIRED_MODULES += Dir["#{REFINEMENTS_DIR}/*.rb"]
REQUIRED_MODULES += Dir["#{HELPERS_DIR}/*.rb"]
REQUIRED_MODULES.each { |required_module| require required_module }
