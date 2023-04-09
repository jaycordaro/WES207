function [FCS] = crc16_802_15_4(Message)
% calculate 802.15.4 CRC-16
% see 7.2.11 and figure 7-4 for BACKWARDS ITU-T CRC 
% reference vector test_vec=[0 1 zeros(1,15) 1 0 1 0 1 1 0];
% should produce [0 0 1 0 0 1 1 1 1 0 0 1 1 1 1 0]
% Sam Weismuller, Eric Pae, Jay Cordaro

R=[zeros(1,16)];

for jj=1:length(Message)
    s1=bitxor(Message(jj),R(1));    
    s2=bitxor(s1,R(12));            
    s3=bitxor(s1,R(5));             
    
    R=[R(2:16) s1];            % matlab vector notation.  start at 1, not 0
    R(11)=s2;                   
    R(4)=s3;                    
end

FCS=R;
end




