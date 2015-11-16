require 'ffi'

# declare an integer to pass to Go
int = 3
puts "Ruby integer: #{int}"

# PASS A INTEGER TO GO
# define a module that consumes our 'C style' compiled Go library
module PassIntegerToGo
  extend FFI::Library
  ffi_lib File.expand_path("./receive_integer.so", File.dirname(__FILE__))
  attach_function :receive, [:int], :int # the Go library implements a receive method that outputs a message containing the integer it received
end

PassIntegerToGo.receive(int)

