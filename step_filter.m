function d = step_filter(h1, h2, step_index, x)
    N = length(x); 
    d = zeros(1, N); 
    L=length(h1);
    % Apply first filter to values before step_index
    d(1:step_index-1) = filter(h1, 1, x(1:step_index-1));
    d(step_index:end) = filter(h2, 1, x(step_index:end));
    
    % Now, adjust the output at step_index so that it's influenced by the past values
   
        

end
