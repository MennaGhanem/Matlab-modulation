clear all;
clc;


%% MOD QPSK
I=randi([0,1],1,10);
Q=randi([0,1],1,10);

t= linspace(1,10,1000);
fc=1;

c1=sin(2*pi*fc.*t);
c2=cos(2*pi*fc.*t);

newI=reshape(repmat(I,100,1),1,[]);
newQ=reshape(repmat(Q,100,1),1,[]);

Symbols=MyQPSK(newI,newQ);
MYreal=real(Symbols);
MYimg=imag(Symbols);

angle(Symbols)*180/pi;
MYQPSK_MOD =sqrt(1/2)*((MYreal.*c1)+j*(MYimg.*c2));

%%DeMOD QPSK
r=(real(MYQPSK_MOD).*c1);
img=(imag(MYQPSK_MOD).*c2);
recivedI=ceil(r);
recivedQ=ceil(img);
ID_i=intdump(recivedI,100);
ID_q=intdump(recivedQ,100);
%%plot
figure
subplot(3,1,1)
plot(t,newI)
title("I")
subplot(3,1,2)
plot(t,newQ)
title("Q")
subplot(3,1,3)
plot(t,MYQPSK_MOD)
title("QPSK")

figure
subplot(2,1,1)
plot(t,recivedI)
title('received I')
subplot(2,1,2)
plot(t,recivedQ)
title('received Q')

%% error
error1=sum(ID_i==I)
error2=sum(ID_q==Q)


