clear all; 
clc;

%this variabls are fixed variables 
link_capacity=10^7 % in MBps
hop_number=6 % in router + me as uploader
hop_capacity=[0 800 500 300 100 50] %
totatl_file_size=50*10^3 %in MBps
repetation_delay=10; %on sec
header_structure=20 % header tcpip
byte=8; % in bits

%this variable is programing variables
mtu=500:500:3500;
t_delay=0;
delay=zeros(1,length(mtu));
packet_per_mtu=zeros(1,length(mtu));
processing_delay_per_mtu=zeros(1,length(mtu));


for m=1:length(mtu)
	for i=1:hop_number
		if i==1
			result =hop_fragmantation(totatl_file_size,mtu(m),header_structure);
			t_delay=transmission_delay(result,link_capacity);

		else
			result=hop_fragmantation(result,hop_capacity(i),header_structure);
			t_delay=transmission_delay(result,link_capacity);
		end
		delay(m)=delay(m)+t_delay;
		packet_per_mtu(m)=totalextraheader(result,header_structure);
		processing_delay_per_mtu(m)=processing_delay(result);
	end
	delay(m);
end
delay


subplot(2,2,1),plot(mtu,delay,'r'), title('transmission delay'), xlabel('MTU') ,ylabel('Total Delay')
subplot(2,2,2),plot(mtu,packet_per_mtu,'b'), title('packet per mtu'), xlabel('MTU'), ylabel('Packet per MYU')
subplot(2,2,3),plot(mtu,processing_delay_per_mtu,'k'), title('processing delay per mtu'), xlabel('MTU') ,ylabel('Process Need per MTU')
subplot(2,2,4),plot(processing_delay_per_mtu,delay,'--*k'), title('processing delay vs delay'), xlabel('processing delay') ,ylabel('total delay per MTU')

