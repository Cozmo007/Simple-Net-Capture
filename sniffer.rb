# simples sniffer
require "packetfu"
include PacketFu

interface = ARGV[0]
case interface
when nil
	puts "Type interface name!"
	exit
end
c = PacketFu::Capture.new(:iface => interface, :start => true, :filter => "ip")
loop do
	c.stream.each do |packet|
		pa = PacketFu::Packet.parse(packet)
		puts "Source IP -> #{pa.ip_saddr} Destination -> #{pa.ip_daddr}"

	end
end
