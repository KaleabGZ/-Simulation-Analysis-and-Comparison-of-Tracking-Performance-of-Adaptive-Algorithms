

step_index=250;
N=500;
h1= [1, 0.9, -0.7, 0.5, -0.3, 0.1]';
h2=h1+0.5;
L=length(h1);
alpha=0.1;
gamma=100;
lambda=0.9
sigma_w=0.001

%noise and input definition
x = randn(1,N);
d = step_filter(h1, h2, step_index, x) + sigma_w*randn(1,N);

[e1, y1, ff1] = lms1(x, d, L, alpha)
[e2, y2, ff2] = rls1(x, d, L,lambda, gamma)

norm1 = zeros(1,size(ff1,2)); 
for n = 1:N

  if n<step_index
    norm1(n)=(ff1(:,n)-h1)'*(ff1(:,n)-h1);
  
  else
    norm1(n)=(ff1(:,n)-h2)'*(ff1(:,n)-h2);    
  end
  
end

norm2 = zeros(1,size(ff2,2)); 
for n = 1:N

  if n<step_index
    norm2(n)=(ff2(:,n)-h1)'*(ff2(:,n)-h1)
  
  else
    norm2(n)=(ff2(:,n)-h2)'*(ff2(:,n)-h2)    
  end
  
end


figure;
subplot(3, 1, 1); 
plot(e1);
xlabel('No of samples');
ylabel('Amplitude');
title(['Error signal LMS algorithm for alpha = ', num2str(alpha)]);

subplot(3, 1, 2); 
plot(ff1');
xlabel('No of samples');
ylabel('Cofficient value');
title(['Filter Cofficient LMS algorithm for alpha = ', num2str(alpha)]);

subplot(3, 1, 3); 
semilogy(norm1)
xlabel('No of samples')
ylabel('norm')
title(['Norm error in log scale LMS algorithm for alpha = ', num2str(alpha)]);

ylim([1e-7, 10]);
yticks([1e-7,1]); 
set(gca, 'YScale', 'log'); 


figure;
subplot(3, 1, 1); 
plot(e2);
xlabel('No of samples');
ylabel('Amplitude');
title(['Error signal RLS algorithm for lambda = ', num2str(lambda)]);

subplot(3, 1, 2); 
plot(ff2');
xlabel('No of samples');
ylabel('Cofficient value');
title(['Filter Cofficient  RLS algorithm for lambda = ', num2str(lambda)]);

subplot(3, 1, 3); 
semilogy(norm2)
xlabel('No of samples')
ylabel('norm')
title(['Norm error in log scale RLS algorithm for lambda = ', num2str(lambda)]);
ylim([1e-8, 10]);
yticks([1e-8,1]); 
set(gca, 'YScale', 'log'); 
