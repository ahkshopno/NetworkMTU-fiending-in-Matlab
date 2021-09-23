function R_packets = hop_fragmantation(in_packets,mtu,header)
%This function fragments the input packets its supported mtu size
% give as packes array[] hope supported byte size+input hader as mtu int, hader file size 
a=0;
packet_length = length(in_packets);
zero_var=0;
for i= 1:packet_length
	for_zeros=(in_packets(i)-header)/(mtu-header);
	if rem((in_packets(i)-header),(mtu-header))>0
		for_zeros=ceil(for_zeros);
	end
	zero_var=zero_var+for_zeros;
end
R_packets=zeros(1,zero_var);


R_packets_count=1;

for i=1:packet_length
	my_bytes_length=(in_packets(i)-header)/(mtu-header);
	my_bytes_length=ceil(my_bytes_length);
	rimender=rem((in_packets(i)-header),(mtu-header));
	if rimender>0
    	my_bytes=zeros(1,my_bytes_length);
		my_bytes(my_bytes_length)=rimender;
	end
	for j=1:my_bytes_length
		R_packets(R_packets_count)=mtu;
		if (rimender>0 ) && (j==my_bytes_length);
			R_packets(R_packets_count)=(rimender+header);
		end
		R_packets_count=R_packets_count+1;
	end

end
% R_packets=a;

