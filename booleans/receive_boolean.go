// go build -buildmode=c-shared -o receive_boolean.so receive_boolean.go

package main

import (
	"C"
	"fmt"
)

//export receive
func receive(bln bool) {
	fmt.Println("Go boolean:", bln)
}

func main() {}
