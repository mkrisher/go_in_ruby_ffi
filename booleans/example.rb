require 'ffi'

# define a boolean in Ruby to pass to Go
bool = false
puts "Ruby boolean: #{bool}"

# PASS A BOOLEAN TO GO
# define a module that consumes our 'C style' compiled Go library
module PassBooleanToGo
  extend FFI::Library
  ffi_lib File.expand_path("./receive_boolean.so", File.dirname(__FILE__))
  attach_function :receive, [:bool], :void # the Go library implements a receive method that outputs a message containing the boolean it received
end

PassBooleanToGo.receive(bool)
