# Ruby FFI examples

## What is this?
  My team is currently researching ways to relieve Ruby of some heavy 
  lifting. The majority of the team is familiar with Ruby, but not 
  necessarily Go. I wanted to experiment with using the C interface 
  to keep the Ruby and Go code together, versus breaking into separate 
  services and passing JSON (or other) back and forth. My intention 
  was to make Go as approachable as possible.

  This direction keeps the majority of the domain logic in Ruby, but 
  allows the passing of most data types to Go. Using Ruby FFI, the 
  code reads as if you are calling Ruby methods, but in fact, Ruby is 
  embedding the Go and calling exposed Go methods via C.

  It boils down to writing Go methods that are faster than the Ruby 
  equivalent due to memory management, etc. Then compiling the Go to 
  expose those methods. Then on the Ruby side, you create a module that 
  embeds the Go library and explicitly exposes the C style methods. Ruby 
  can then call those methods, passing things like Arrays, Strings, 
  Integers, etc. Some data types require some conversion when going from 
  Ruby to C to Go.

  My intention is to go through the data types creating simple examples 
  others can reference when passing data from Ruby to Go and vice versa.

## The pattern
  I'm creating directories for each data type. Included in each directory 
  is an example.rb file for the Ruby logic. And a Go file containing the 
  Go logic. Also included are the two files created during the Go 
  compilation. At the top of each Go code file I am including the command 
  to compile the Go code.

## References
  The Ruby FFI project has a wiki that discusses some of the oddities for 
  things like Arrays and Structs (aka Hashes). Below are references to the 
  data types I will be working through.

  https://github.com/ffi/ffi/blob/master/lib/ffi/types.rb#L74-L150

  https://github.com/ffi/ffi/wiki/Types

## Contributing
  Feel free to implement a data type or make a current implementation better. 

  Just fork and create a branch named after the data type and issue a PR.

