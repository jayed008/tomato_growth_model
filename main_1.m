clc;clear;
close all;
tspan=[0 86400];
h=1;
t=tspan(1):h:tspan(2);


x0=[75*10^-4       %[NADP+]
    112*10^-4      %[ADP]
    200*10^-6      %[RuBP]
    1.34*10^-2        %[Ci]   
    200*10^-6      %[PGA]
    200*10^-6      %[DPGA]
    200*10^-6      %[PGAld]
           0];     %[sugar]
p1=[10^8
    10^0
    10^0
    10^0
    10^19
    1.34*10^-2
    75*10^-4
    112*10^-4
    10^-3]; 

p2=[0
    10^0
    10^0
    10^0
    10^19
    1.34*10^-2
    75*10^-4
    112*10^-4
    10^-3];

x=zeros(length(x0),length(t));
x(:,1)=x0(:);
for n=1:12*3600
   p=p1; 
   p(1)= p(1)* sin(2*pi*(n/(36000*24)));
   k1=feval(@bigfun,x(:,n),p);
   k2=feval(@bigfun,x(:,n)+h/2*k1,p);
   k3=feval(@bigfun,x(:,n)+h/2*k2,p);
   k4=feval(@bigfun,x(:,n)+h*k3,p);
   x(:,n+1)=x(:,n)+(h/6).*(k1+2*k2+2*k3+k4);
end
for n=12*3600+1:24*3600
   p=p2; 
   k1=feval(@bigfun,x(:,n),p);
   k2=feval(@bigfun,x(:,n)+h/2*k1,p);
   k3=feval(@bigfun,x(:,n)+h/2*k2,p);
   k4=feval(@bigfun,x(:,n)+h*k3,p);
   x(:,n+1)=x(:,n)+(h/6).*(k1+2*k2+2*k3+k4);
end

x=x';

% xlswrite('base_sugar.xlsx',x(:,8));

t=6:1/3600:30;

figure()
plot(t,x(:,8));
xlabel('T/h');
ylabel('C');
title('Concentration of Sugars');


