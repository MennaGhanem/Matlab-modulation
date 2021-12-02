%% QPSK
bitsNum=20000;
bitsI = 2*randi([0,1],1,bitsNum)-1;
bitsQ = 2*randi([0,1],1,bitsNum)-1;

Symbol =(bitsI+i*bitsQ);


%% AWGN

n=(randn(1,20000)+i*randn(1,20000));
BER=[]
for v=[0.1, 0.1259, 0.1585, 0.1995, 0.2512, 0.3162, 0.3981, 0.5012, 0.6310, 0.7943, 1]
    noise=sqrt(v).*(n);
   
    %%received
    Rsig = Symbol +noise;

    %%detection
    
    Isymbol=ones(1,20000);
    Qsymbol=ones(1,20000);
    
    Isymbol( find(real(Rsig)<0))=-1;
    Qsymbol( find(imag(Rsig)<0))=-1;
    
    
    %%BER
    b=(sum(bitsI~=Isymbol)/(bitsNum));
    a=(sum(bitsQ~=Qsymbol)/(bitsNum));
    z=(a+b)/2;
    BER=[BER z]; 
end
v=[0.1, 0.1259, 0.1585, 0.1995, 0.2512, 0.3162, 0.3981, 0.5012, 0.6310, 0.7943, 1];
SNR=10*log10(1./v);
hold on
semilogy(SNR,BER);