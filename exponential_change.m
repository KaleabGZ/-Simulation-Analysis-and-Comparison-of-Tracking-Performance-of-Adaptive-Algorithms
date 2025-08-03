function h=exponential_change(x,a)
N=length(x);
step_index=250;

h1= [1, 0.9, -0.7, 0.5, -0.3, 0.1]';

h=[repmat(h1,1,step_index-1)];




for n=step_index:N
   
    exp_inc=0.5*(1-exp(-a*(n-step_index)))
    h_next=h1+exp_inc;
    h=[h,repmat(h_next,1,1)];

end


end