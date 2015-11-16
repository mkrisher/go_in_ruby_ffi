// go build -buildmode=c-shared -o receive_string.so receive_string.go

package main

import (
	"C"
	"fmt"
)

//export receive
func receive(str *C.char) {
	fmt.Println("Go string:", C.GoString(str))
}

func main() {}
