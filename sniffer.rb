# simples sniffer
require "packetfu"
include PacketFu

interface = ARGV[0]
case interface
when nil
	puts "Type interface name!"
	exit
end
puts "[+] Started on '#{ARGV[0]}' "
c = PacketFu::Capture.new(:iface => interface, :promisc => true, :start => true, :filter => "ip")
loop do
	c.stream.each do |packet|
		pa = PacketFu::Packet.parse(packet)
		puts ">> Source IP -> #{pa.ip_saddr} Destination -> #{pa.ip_daddr} -> TYPE -> #{pa.proto.last}"

	end
end
