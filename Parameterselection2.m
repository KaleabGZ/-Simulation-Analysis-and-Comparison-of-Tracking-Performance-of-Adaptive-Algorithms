
K=1000;
alpha=[0.05,0.1,0.2];
MSE_e_results = zeros(length(lambda),N);
for n = 1:3

    [MSE_e, ~, ~, ~]  = lms1_loop(K, N, h1, sigma_w, alpha(n))
    MSE_e_results(n,:)=MSE_e;
   
end
figure
semilogy(1:500,MSE_e_results(1,1:500),'r')
hold on
semilogy(1:500,MSE_e_results(2,1:500),'b')
semilogy(1:500,MSE_e_results(3,1:500),'g')

legend('α = 0.05','α = 0.1', 'α = 0.2')
xlabel('Number of samples');
ylabel('MSE value');
title('MSE values of LMS for different values of alpha')