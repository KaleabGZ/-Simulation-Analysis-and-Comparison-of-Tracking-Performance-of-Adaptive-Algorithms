
a1=[10,0.1,0.02]
hchange = zeros(length(a1),N);
 
for n=1:length(a1)
   
    h=exponential_change(x,a1(n))
   
    
    hchange(n,:)=h(1,:)

end

figure
plot(hchange(1,:),'r')
hold on
plot(hchange(2,:),'b')
plot(hchange(3,:),'g')

legend('a = 1','a = 0.1', 'a = 0.02')
xlabel('Number of samples');
ylabel('h value(first cofficient)');
title('parameter h for different values of a')