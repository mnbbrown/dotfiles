pdfc() {
	gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.5 -dPDFSETTINGS=/printer -dNOPAUSE -dQUIET -dBATCH -sOutputFile=$2 $1
}

gocd() {
    cd ~/Code/go/src/$1
}

# Recursively search $1 for files containing $2
s() { egrep -rnw $1 -e $2 }

