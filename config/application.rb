# Silence warnings by default, but provide an easy means through an environment
# variable to re-enable them if so desired
$VERBOSE = nil unless ENV['VERBOSE']

# Store the path to the app-root as a constant
ROOT_DIR = File.expand_path(File.dirname(__FILE__) + '/../')

# Store the path to the app directory as a constant
APP_DIR = "#{ROOT_DIR}/app"

# Store the path to the bridges directory as a constant
BRIDGES_DIR = "#{APP_DIR}/bridges"

# Store the path to the managers directory as a constant
MANAGERS_DIR = "#{APP_DIR}/managers"

# Store the path to the refinements directory as a constant
REFINEMENTS_DIR = "#{APP_DIR}/refinements"

# Store the path to the scripts directory as a constant
SCRIPTS_DIR = "#{APP_DIR}/scripts"

# Ensure that the "app" directory is in the load-path
$LOAD_PATH.unshift(APP_DIR) unless $LOAD_PATH.include?(APP_DIR)

# Require(s)
REQUIRED_MODULES = []
REQUIRED_MODULES += %w[json set socket thread]
REQUIRED_MODULES += Dir["#{REFINEMENTS_DIR}/*.rb"]
REQUIRED_MODULES.each {|required_module| require required_module}
