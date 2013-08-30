# Silence warnings by default, but provide an easy means through an environment
# variable to re-enable them if so desired
$VERBOSE = nil unless ENV['VERBOSE']

# Store the path to the app-root as a constant
APP_ROOT = File.expand_path(File.dirname(__FILE__) + '/../')

# Store the path to the lib directory as a constant
LIB_DIR = "#{APP_ROOT}/lib"

# Store the path to the hijack directory as a constant
HIJACK_DIR = "#{LIB_DIR}/hijack"

# Store the path to the bridge directory as a constant
BRIDGE_DIR = "#{HIJACK_DIR}/bridge"

# Store the path to the manager directory as a constant
MANAGER_DIR = "#{HIJACK_DIR}/manager"

# Store the path to the refinement directory as a constant
REFINEMENT_DIR = "#{HIJACK_DIR}/refinement"

# Store the path to the script directory as a constant
SCRIPT_DIR = "#{HIJACK_DIR}/script"

# Ensure that the "lib" directory is in the load-path
$LOAD_PATH.unshift(LIB_DIR) unless $LOAD_PATH.include?(LIB_DIR)

# Require(s)
REQUIRED_MODULES = []
REQUIRED_MODULES += %w[json set socket thread]
REQUIRED_MODULES += Dir["#{REFINEMENT_DIR}/*.rb"]
REQUIRED_MODULES.each {|required_module| require required_module}
