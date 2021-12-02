
%% QPSK
bitsNum=40000;
bits= randi([0,1],1,bitsNum);

I=bits(1:2:end);
Q=bits(2:2:end);

Symbol =MyQPSK(I,Q);

%% AWGN
Isymbol=zeros(1,20000);
Qsymbol=zeros(1,20000);
n=(randn(1,20000)+i*randn(1,20000));
BER=[]
for v=[0.1, 0.1259, 0.1585, 0.1995, 0.2512, 0.3162, 0.3981, 0.5012, 0.6310, 0.7943, 1]
    noise=sqrt(v).*(n);
   
    %%received
    Rsig = Symbol +noise;

    %%detection
    
    Isymbol( find(real(Rsig)>=0))=1;
    Qsymbol( find(imag(Rsig)>=0))=1;
    
    I_Qbits=[Isymbol;Qsymbol];
    Rbits=reshape(I_Qbits,1,[]);
    
    
    %%BER
    b=(sum(bits~=Rbits)./(bitsNum));  
    BER=[BER b]; 
end
v=[0.1, 0.1259, 0.1585, 0.1995, 0.2512, 0.3162, 0.3981, 0.5012, 0.6310, 0.7943, 1];
SNR=10*log10(1./v);

semilogy(SNR,BER);

