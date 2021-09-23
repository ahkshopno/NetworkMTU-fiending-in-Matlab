function header = totalextraheader(in_packets,header_per_pac)
%This function calculate the delay of the trasmission packet file
% give as packes array[] link capacity as int 
packet_length = length(in_packets);

header=packet_length*header_per_pac;

