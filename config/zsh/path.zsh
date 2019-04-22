# Prepend $PATH without duplicates
function _prepend_path() {
	if ! $( echo "$PATH" | tr ":" "\n" | grep -qx "$1" ) ; then
		PATH="$1:$PATH"
	fi
}

# Setting up GOPATH
export GOPATH='/home/ankush/code/go'

# Setting up GOROOT
export GOROOT='/usr/local/go'

# Setting up JAVA_HOME
export JAVA_HOME='/usr/lib/jvm/java-11-openjdk-amd64'

# Construct $PATH
PATH='/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl'
_prepend_path "$HOME/config/bin"
_prepend_path "$HOME/npm.global/bin"
# Adding go commandline packages to the path
_prepend_path "$GOPATH/bin" 
_prepend_path "$GOROOT/bin"
# installed tools
_prepend_path "/home/ankush/toolbox/bin"
export PATH


export LD_LIBRARY_PATH="/usr/lib64:/usr/lib"