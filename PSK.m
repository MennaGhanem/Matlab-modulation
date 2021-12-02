%% generate bit stream
bitsNum=20000;
%% BPSK Modulation
Syms = 2*randi([0,1],1,bitsNum)-1;


%% AWGN
noise=randn(1,bitsNum);

%% BER Calculation
ber=[]; %empty vector for concatination ber reults
var=[0.1, 0.1259, 0.1585, 0.1995, 0.2512, 0.3162, 0.3981, 0.5012, 0.6310, 0.7943, 1]; 
for v=var;
    n=sqrt(v).*noise;
    
    % recived signal:
    y=Syms+n;
    
    % ML rule:
    deI=ones(1,bitsNum); % initiat detection vector with all ones.
    deI(find(y<0))=-1; % replace the value by -1 in the corresponding locations to real(y)<0
                                                      % imagiry part is ignored as it's pure noise                           
    
    % Demodulation
      
    % BER
    b=(sum(Syms~=deI)/bitsNum);
    ber=[ber b];                                                   
    
end
snr=10*log10(1./var);
semilogy(snr,ber);