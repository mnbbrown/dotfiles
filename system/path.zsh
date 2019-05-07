export PATH="$GOPATH/bin:/usr/local/sbin:$PATH"
test "$(uname)" = "Darwin" && export JAVA_HOME=$(/usr/libexec/java_home)
