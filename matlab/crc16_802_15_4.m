function [FCS] = crc16_802_15_4(Message)

R=[zeros(1,16)];

for jj=1:length(Message)
    JUNK=xor(Message(jj),R(1));
    R(1)=R(2);
    R(2)=R(3);
    R(3)=R(4);
    R(4)=xor(JUNK,R(5));
    R(5)=R(6);
    R(6)=R(7);
    R(7)=R(8);
    R(8)=R(9);
    R(9)=R(10);
    R(10)=R(11);
    R(11)=xor(JUNK,R(12));
    R(12)=R(13);
    R(13)=R(14);
    R(14)=R(15);
    R(16)=JUNK;
end

FCS=R;
end



