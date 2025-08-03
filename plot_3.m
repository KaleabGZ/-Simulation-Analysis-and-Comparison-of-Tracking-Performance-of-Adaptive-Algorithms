
load('ecg.mat')
N=500;
x=randn(1,N)
step_index=250;
sigma_w=1e-3;
h1= [1, 0.9, -0.7, 0.5, -0.3, 0.1]';
h2=h1+0.5;
L=length(h1);
alpha=0.05;
gamma=100;
lambda=1;
a=0.1
h=exponential_change(x,a);

d = step_filter2(h,x) + sigma_w*randn(1,N);

[e1, y1, ff1] = lms1(x, d, L, alpha)
[e2, y2, ff2] = rls1(x, d, L,lambda, gamma)

norm1 = zeros(1,size(ff1,2)); 
for n = 1:N
    norm1(n)=(ff1(:,n)-h(:,n))'*(ff1(:,n)-h(:,n));   
  
end

norm2 = zeros(1,size(ff2,2)); 
for n = 1:N
  norm2(n)=(ff2(:,n)-h(:,n))'*(ff2(:,n)-h(:,n)); 
  
end

figure;
subplot(3, 1, 1); 
plot(e1);
xlabel('No of samples');
ylabel('Amplitude');
title(['Error signal LMS algorithm for alpha = ', num2str(alpha),  ' and a = ', num2str(a)]);

subplot(3, 1, 2); 
plot(ff1');
xlabel('No of samples');
ylabel('Cofficient value');
title(['Filter Cofficient LMS algorithm for alpha = ', num2str(alpha),  ' and a = ', num2str(a)]);

subplot(3, 1, 3); 
semilogy(norm1)
xlabel('No of samples')
ylabel('norm')
title(['Norm error for alpha = ', num2str(alpha),  ' and a = ', num2str(a)]);
ylim([1e-7, 10]);
yticks([1e-7,1]); 
set(gca, 'YScale', 'log'); 

figure;
subplot(3, 1, 1); 
plot(e2);
xlabel('No of samples');
ylabel('Amplitude');
title(['Error signal RLS algorithm for lambda = ', num2str(lambda),  ' and a = ', num2str(a)]);

subplot(3, 1, 2); 
plot(ff2');
xlabel('No of samples');
ylabel('Cofficient value');
title(['Filter Cofficient  RLS algorithm for lambda = ', num2str(lambda),  ' and a = ', num2str(a)]);

subplot(3, 1, 3); 
semilogy(norm2)
xlabel('No of samples')
ylabel('norm')
title(['Norm error RLS algorithm for lambda = ', num2str(lambda),  ' and a = ', num2str(a)]);
ylim([1e-7, 10]);
yticks([1e-7,1]); 
set(gca, 'YScale', 'log'); 
