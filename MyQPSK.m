function [ symbol,isymbol ] = MyQPSK( I,Q )
if nargout <2
    if nargin==2    
        symbol =(I*2-1)+i*(Q*2-1);
    end
    if nargin==1
       if rem(length(I),2)==0
           ii=I(1:2:end);
           q=I(2:2:end);
           symbol =((ii*2-1)+i*(q*2-1));  
       end 
    
    end
end
if nargout==2
    if nargin==2
        symbol=real((I*2-1)+i*(Q*2-1));
        isymbol=imag(real((I*2-1)+i*(Q*2-1)));
    end
    if nargin==1
       if rem(length(I),2)==0 
           ii=I(1:2:end);
           q=I(2:2:end);
           symbol =real((ii*2-1)+i*(q*2-1));
           isymbol=imag(real((ii*2-1)+i*(q*2-1)));
       end
    end
end
end

