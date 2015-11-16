require 'ffi'

# define a string in Ruby to pass to Go
str = "lorem ipsum"
puts "Ruby string: #{str}"

# PASS A STRING TO GO
# define a module that consumes our 'C style' compiled Go library
module PassStringToGo
  extend FFI::Library
  ffi_lib File.expand_path("./receive_string.so", File.dirname(__FILE__))
  attach_function :receive, [:string], :void # the Go library implements a receive method that outputs a message containing the string it received
end

PassStringToGo.receive(str)
