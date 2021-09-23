function t_delay = processing_delay(in_packets)
%This function calculate the delay of the trasmission packet file
% give as packes array[] link capacity as int 

t_delay=0;
prossesing_delay=.00001;
packet_length = length(in_packets);

for i=1:packet_length
	t_delay=t_delay+prossesing_delay;
end


