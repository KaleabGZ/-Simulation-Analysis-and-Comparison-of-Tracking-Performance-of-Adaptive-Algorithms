
K=1000;
N=500;
lambda=[1,0.95, 0.9, 0.8];
MSE_e_results = zeros(length(lambda),N);
for n = 1:4

    [MSE_e, ~, ~, ~] = rls1_loop(K, N, h1, sigma_w, lambda(n), gamma);
    
    MSE_e_results(n,:)=MSE_e
   
end
figure
semilogy(1:100,MSE_e_results(1,1:100),'r')
hold on
semilogy(1:100,MSE_e_results(2,1:100),'b')
semilogy(1:100,MSE_e_results(3,1:100),'g')
semilogy(1:100,MSE_e_results(4,1:100),'k')
legend('λ = 1','λ = 0.95', 'λ = 0.9', 'λ = 0.8')
xlabel('Number of samples');
ylabel('MSE value');
title('MSE values of RLS for different values of lambda')