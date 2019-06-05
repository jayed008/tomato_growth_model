function sugar=main1step(ca,k1)
h=1;

x0=[75*10^-4       %[NADP+]
    112*10^-4      %[ADP]
    200*10^-6      %[RuBP]
    1.34*10^-2      %[Ci]   
    200*10^-6      %[PGA]
    200*10^-6      %[DPGA]
    200*10^-6      %[PGAld]
           0];     %[sugar]
p1=[10^10
    10^0
    5
    5
    10^23
    1.34*10^-2
    75*10^-4
    112*10^-4
    10^-3]; 

p2=[0
    10^0
    5
    5
    10^23
    1.34*10^-2
    75*10^-4
    112*10^-4
    10^-3];
x0(4)=ca;
p1(6)=ca;
p2(6)=ca;
p1(1)=k1;

x=x0;
for n=1:12*3600
   p=p1; 
   p(1)= p(1)* sin(2*pi*(n/(3600*24)));
   k1=feval(@bigfun,x,p);
   k2=feval(@bigfun,x+h/2*k1,p);
   k3=feval(@bigfun,x+h/2*k2,p);
   k4=feval(@bigfun,x+h*k3,p);
   x=x+(h/6).*(k1+2*k2+2*k3+k4);
end
for n=12*3600+1:24*3600
   p=p2; 
   k1=feval(@bigfun,x,p);
   k2=feval(@bigfun,x+h/2*k1,p);
   k3=feval(@bigfun,x+h/2*k2,p);
   k4=feval(@bigfun,x+h*k3,p);
   x=x+(h/6).*(k1+2*k2+2*k3+k4);
end

sugar=x(8)*48*12;
end
