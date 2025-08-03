
m1=[0.003,0.005,0.010]
hchange = zeros(length(m1),N);
 
for n=1:length(m1)
   
    h=linear_change(x,m1(n))
   
    
    hchange(n,:)=h(1,:)

end

figure
plot(hchange(1,:),'r')
hold on
plot(hchange(2,:),'b')
plot(hchange(3,:),'g')

legend('m = 0.003','m = 0.005', 'm = 0.010')
xlabel('Number of samples');
ylabel('h value(first cofficient)');
title('parameter h for different values of m')