
%% 8PSK 

bitst=randi([0 7],1,20000);
sentsig= pskmod(bitst,8);

% adding gaussian noise to the signal 
Rsig = awgn(sentsig,20);


%% 8QAM 
txsignal=qammod(bitst,8);
rxSig = awgn(txsignal,25);

%% bit error rate
EbNo = (0:16)';  
BER_8PSK = berawgn(EbNo,'psk',8,'nondiff'); 
BER_8QAM = berawgn(EbNo,'qam',8); 

%% plotting 
semilogy(EbNo,[BER_8PSK BER_8QAM]) 
title('8-PSK vs 8-QAM') 
legend('8-PSK','8-QAM')
scatterplot(rxSig)
scatterplot(Rsig)