export GOVERSION=$(brew list go --versions | awk '{print $2}')
export GOPATH=$PROJECTS/go
export GOROOT=$(brew --prefix)/Cellar/go/$GOVERSION/libexec
export GOOS=darwin
export PATH=$GOPATH/bin:$PATH
export GO15VENDOREXPERIMENT=1
