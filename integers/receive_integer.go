// go build -buildmode=c-shared -o receive_integer.so receive_integer.go

package main

import (
	"C"
	"fmt"
)

//export receive
func receive(i int) int {
	fmt.Println("Go integer:", i)
	return i
}

func main() {}
