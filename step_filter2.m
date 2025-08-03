function d = step_filter2(h, x)
    
    [L, N] = size(h); 
    d = zeros(1, N);  
    
    
    for n = 1:N
        
        for k = 1:min(L, n) 
            d(n) = d(n) + h(k, n) * x(n-k+1);
        end
    end
end
