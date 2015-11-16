// go build -buildmode=c-shared -o array_receiver.so array_receiver.go

package main

import (
	"C"
	"fmt"
	"unsafe"
)

//export puts
func puts(arr *C.int, length int) {
	size := int(unsafe.Sizeof(*arr))
	slice := C.GoBytes(unsafe.Pointer(arr), (_Ctype_int)(size*length))
	var result []byte

	for i := 0; i < length*size; i += size {
		value := slice[i]
		result = AppendByte(result, value)
	}

	fmt.Println("Go array:", result)
}

func AppendByte(slice []byte, data ...byte) []byte {
	m := len(slice)
	n := m + len(data)
	if n > cap(slice) { // if necessary, reallocate
		// allocate double what's needed, for future growth.
		newSlice := make([]byte, (n+1)*2)
		copy(newSlice, slice)
		slice = newSlice
	}
	slice = slice[0:n]
	copy(slice[m:n], data)
	return slice
}

func main() {}
