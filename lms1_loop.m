function [MSE_e, Mean_f, MSE_f, Mean_vv_norm]  = lms1_loop(K, N, h, sigma_w, alpha)

    % Loop of K realizations of LMS algorithm
    %
    % [e, y, ff] = lms1(x, d, L, alpha);
    %
    % Inputs:
    %       K - number of signal realizations,
    %       N - number of samples in each realization
    %       h - vector of system coefficients,
    %       sigma_w - variance of additional noise
    %       alpha - step-size parameter.
    % Outputs:
    %       MSE_e - MSE of error signal for subsequent moments n,
    %       MSE_f - MSE of filter coefficients for subsequent moments n,
    %       Mean_f - mean values of filter coefficients for subsequent moments n.
 
    L = length(h);

    ee = zeros(K,N);
    fff = zeros(L,N,K);

    MSE_e = zeros(1,N);
    MSE_f = zeros(L,N);
    Mean_f = zeros(L,N);

    % *********************** K realizations *******************************

    for k = 1:K
        x =  randn(1, N);
        d = filter(h, 1, x) + sigma_w*randn(1, N);
        [e, y, ff] = lms1(x, d, L, alpha);
        ee(k,:) = e;
        fff(:,:,k) = ff;
    end

    % *********************** Averaging ************************************

MSE_e = sum(ee.^2)/K;

Mean_f = mean(fff,3);

hhh = repmat(h,[1,N,K]);

vv = fff - hhh;
MSE_f = sum((vv).^2,3)/K;

vv_norm = squeeze(sum(vv.*vv,1)); 
Mean_vv_norm = mean(vv_norm,2).';

% First subplot
subplot(4, 1, 1); % First position (top)
semilogy(MSE_e);
xlabel('No of samples');
ylabel('MSE value');
title('MSE error signal (log scale)');


subplot(4, 1, 2); 
semilogy(MSE_f');
xlabel('No of samples');
ylabel('MSE value');
title('MSE filter coefficient (log scale)');


subplot(4, 1, 3); 
plot(Mean_f');
xlabel('No of samples');
ylabel('Mean value');
title('Mean of filter coefficient');


subplot(4, 1, 4); 
semilogy(Mean_vv_norm);
xlabel('No of samples');
ylabel('Mean value');
title('Mean vv norm');

end