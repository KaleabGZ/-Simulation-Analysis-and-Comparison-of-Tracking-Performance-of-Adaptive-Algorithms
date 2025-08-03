function [e, y, ff] = lms1(x, d, L, alpha)
   
% Implementation of LMS algorithm.
%     
% [e, y, ff] = lms1(x, d, L, alpha);
%     
% Inputs:
%   x - input signal,
%   d - desired signal,
%   L - filter order filter,
%   alpha - step-size parameter.
% Outputs:
%   e - error signal,
%   y - output filter signal,
%   ff - filter coefficients matrix.

    N = length(x);
    
    e = zeros(1,N);
    y = zeros(1,N);                   
    ff = zeros(L,N);                

    f_n = zeros(L,1);   % vector of filter coefficients at the moment n
    x_n = zeros(L,1);   % vector of signal samples x(n) at the moment n

    for n = 1:N

        x_n = [x(n); x_n(1:end-1,1)];

        y(n) = f_n'*x_n;
        e(n) = d(n)-y(n);
        f_n = f_n+alpha*e(n)*x_n;

        ff(:,n) = f_n;

    end
    
end