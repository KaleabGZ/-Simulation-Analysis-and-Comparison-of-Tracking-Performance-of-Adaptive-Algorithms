K=1000;
m=0.01;
alpha=0.1;
lambda=0.9;
N=500;
h=linear_change(x,m);

[MSE_e1, Mean_f1, MSE_f1, Mean_vv_norm1]  = lms_exp_loop(K, N, h ,step_index, sigma_w, alpha)
tic
[MSE_e2, Mean_f2, MSE_f2, Mean_vv_norm2] = rls_exp_loop(K, N, h,step_index, sigma_w, lambda, gamma)
toc;
figure
subplot(4, 1, 1); 
semilogy(MSE_e1);
xlabel('No of samples');
ylabel('MSE value');
title('MSE error signal (log scale)');
title(['MSE error signal(in log scale) of LMS for alpha = ', num2str(alpha),  ' and m = ', num2str(m)]);
ylim([1e-7, 10]);
yticks([1e-7,1]); 
set(gca, 'YScale', 'log'); 

subplot(4, 1, 2); 
semilogy(MSE_f1');
xlabel('No of samples');
ylabel('MSE value');
title(['MSE filter coefficient (log scale) of LMS for alpha = ', num2str(alpha),  ' and m = ', num2str(m)]);

subplot(4, 1, 3); 
plot(Mean_f1');
xlabel('No of samples');
ylabel('Mean value');
title(['Mean of filter coefficient of LMS for alpha = ', num2str(alpha),  ' and m = ', num2str(m)]);


subplot(4, 1, 4); 
semilogy(Mean_vv_norm1);
xlabel('No of samples');
ylabel('Mean value');
title(['Mean vv norm of LMS for alpha =', num2str(alpha),  ' and m = ', num2str(m)]);
ylim([1e-7, 10]);
yticks([1e-7,1]); 
set(gca, 'YScale', 'log'); 

figure
subplot(4, 1, 1); 
semilogy(MSE_e2);
xlabel('No of samples');
ylabel('MSE value');
title('MSE error signal (log scale)');
title(['MSE error signal(in log scale) of RLS for lambda = ', num2str(lambda),  ' and m = ', num2str(m)]);
ylim([1e-7, 10]);
yticks([1e-7,1]); 
set(gca, 'YScale', 'log'); 

subplot(4, 1, 2); 
semilogy(MSE_f2');
xlabel('No of samples');
ylabel('MSE value');
title(['MSE filter coefficient (log scale) of RLS for lambda = ', num2str(lambda),  ' and m = ', num2str(m)]);

subplot(4, 1, 3); 
plot(Mean_f2');
xlabel('No of samples');
ylabel('Mean value');
title(['Mean of filter coefficient of RLS for lambda = ', num2str(lambda),  ' and m = ', num2str(m)]);


subplot(4, 1, 4); 
semilogy(Mean_vv_norm2);
xlabel('No of samples');
ylabel('Mean value');
title(['Mean vv norm of RLS for lambda = ', num2str(lambda),  ' and m = ', num2str(m)]);
ylim([1e-7, 10]);
yticks([1e-7,1]); 
set(gca, 'YScale', 'log'); 