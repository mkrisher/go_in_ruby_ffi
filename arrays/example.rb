require 'ffi'

# declare an array to write into the pointer
arr = [1,4,3]
puts "Ruby array: #{arr}"

# declare a module that interfaces with our 'C style' shared compiled Go library
module PassArrayFromRuby
  extend FFI::Library
  ffi_lib File.expand_path("./array_receiver.so", File.dirname(__FILE__))
  attach_function :puts, [ :pointer, :int ], :void  # the Go library implements a puts method that outputs a message containing the array it received
end

# use MemoryPointer to create a pointer to store our array
ptr = FFI::MemoryPointer.new(:int, arr.size)
ptr.write_array_of_int(arr)
PassArrayFromRuby.puts(ptr, arr.size)

