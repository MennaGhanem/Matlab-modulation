%% menna-tallah gamal
% lab1
%intake42
%% ASK
B_st= round(rand(1,10));
fc=4;
t=0:0.01:10-0.01;
carrier = sin(2*pi*fc.*t);
seq=B_st+1;
repeated_sig=reshape(repmat(seq,100,1),1,[]);
ASK =repeated_sig.*carrier;



%% MSK
fc1=10;
fc2=5;
c1=sin(2*pi*fc1.*t);
c2=sin(2*pi*fc2.*t);
repeated_sig1=reshape(repmat(B_st,100,1),1,[]);
ones=repeated_sig1.*c1;
zeros=(abs(repeated_sig1-1)).*c2;
MSK=ones+zeros;

%%PLOT
figure
subplot(4,1,1)
plot(t,repeated_sig)
title("BitSTream")
subplot(4,1,2)
plot(t,carrier )
title("carrier1")
subplot(4,1,3)
plot(t,ASK);
title("ASK")
subplot(4,1,4)
plot(t,MSK)
title("MSK")