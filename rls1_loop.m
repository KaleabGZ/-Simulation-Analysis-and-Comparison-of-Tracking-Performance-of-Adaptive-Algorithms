function [MSE_e, Mean_f, MSE_f, Mean_vv_norm] = rls1_loop(K, N, h, sigma_w, lambda, gamma)

    % Loop of K realizations of RLS algorithm

    L=length(h)
    ee = zeros(K,N);
    fff = zeros(L,N,K);

    MSE_e = zeros(1,N);
    MSE_f = zeros(L,N);
    Mean_f = zeros(L,N);

    % *********************** K realizations *******************************
   
    for k = 1:K
        
        x=randn(1,N);
        d = filter(h,1, x) + sigma_w*randn(1, N);
        [e,  y,  ff] = rls1(x,  d,  L, lambda, gamma);
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
    
    
end