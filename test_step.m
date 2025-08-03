 for n = step_index:(step_index+L)
        d(n)=0;
        for m=1:L
            d(n)=d(n)+h2(m)*x(n-m+1);
           
        end
 end