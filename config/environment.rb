# Store the path to the app-root as a constant
APP_ROOT = File.expand_path(File.dirname(__FILE__) + '/../')

# Store the path to the lib directory as a constant
LIB_DIR = "#{APP_ROOT}/lib"

# Store the path to the hijack directory as a constant
HIJACK_DIR = "#{LIB_DIR}/hijack"

# Store the path to the bridge directory as a constant
BRIDGE_DIR = "#{HIJACK_DIR}/bridge"

# Store the path to the script directory as a constant
SCRIPT_DIR = "#{HIJACK_DIR}/script"

# Store the path to the util directory as a constant
UTIL_DIR = "#{HIJACK_DIR}/util"

# Ensure that the "lib" directory is in the load-path
$LOAD_PATH.unshift(LIB_DIR) unless $LOAD_PATH.include?(LIB_DIR)
