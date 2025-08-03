function [MSE_e, Mean_f, MSE_f,Mean_vv_norm]  = lms_step_loop(K, N, h1 , h2,step_index, sigma_w, alpha)

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
 
    L = length(h1);
    load('ecg.mat')
    f_s=1e3;
    ee = zeros(K,N);
    fff = zeros(L,N,K);
    hhh = zeros(L,N,K);

    MSE_e = zeros(1,N);
    MSE_f = zeros(L,N);
    Mean_f = zeros(L,N);

    % *********************** K realizations *******************************
    
    for k = 1:K
       x = randn(1,N);
       d = step_filter(h1,h2,step_index, x) + sigma_w*randn(1, N);
       [e, y, ff] = lms1(x, d, L, alpha);
        ee(k,:) = e;
        fff(:,:,k) = ff;
    end

    % *********************** Averaging ************************************

MSE_e = sum(ee.^2)/K;

Mean_f = mean(fff,3);

hhh(:, 1:step_index, :) = repmat(h1, [1, step_index, K]);
hhh(:, step_index+1:N, :) = repmat(h2, [1, N-step_index, K]);

vv = fff - hhh;
MSE_f = sum((vv).^2,3)/K;

vv_norm = squeeze(sum(vv.*vv,1)); 
Mean_vv_norm = mean(vv_norm,2).';

end