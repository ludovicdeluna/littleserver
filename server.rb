# A server for play
# See: http://www.tutorialspoint.com/ruby/ruby_socket_programming.htm
#
# Active Support:
# http://edgeguides.rubyonrails.org/active_support_core_extensions.html
#
require 'socket'                    # Get sockets from stdlib
require 'active_support/core_ext'   # For 1.day

I18n.enforce_available_locales=true #Ruby1.9 not set to tue by default

hostname = 'localhost'
port = 2000

# My killer
Thread.start do
  sleep(20.seconds)
  puts 'Server halted'
  exit
end

# My Server with his socket to listen
server = TCPServer.open(hostname, port)

puts 'Server is running for 20 secondes. Happy play'
loop {                         # Servers run forever
  client = server.accept       # Wait for a client to connect
  puts 'New connection'
  client.puts(Time.now.ctime)  # Send the time to the client
  client.puts "Closing the connection. Bye!"
  client.close
  puts 'Connection terminated'
}
