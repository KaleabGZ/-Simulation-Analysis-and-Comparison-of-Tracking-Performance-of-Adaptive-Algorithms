function h=linear_change(x,m)
N=length(x);
step_index=250;

h1= [1, 0.9, -0.7, 0.5, -0.3, 0.1]';
h2=h1+0.5
h=[repmat(h1,1,step_index-1)];




for n=step_index:N
   
    if h1+m*(n-step_index+1)<h2
       h_next=h1+m*(n-step_index+1);
       h=[h,repmat(h_next,1,1)];
    
    else
     h=[h,repmat(h2,1,1)];
    end
end


end