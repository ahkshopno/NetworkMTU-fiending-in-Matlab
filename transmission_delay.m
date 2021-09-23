function t_delay = transmission_delay(in_packets,linkcapacity)
%This function calculate the delay of the trasmission packet file
% give as packes array[] link capacity as int 

t_delay=0;
delay=0;
prossesing_delay=.00001;
packet_length = length(in_packets);

for i=1:packet_length
	delay=(in_packets(i)*8)/linkcapacity;
	t_delay=t_delay+delay+prossesing_delay;
end


