function t=Tdayca(tmax,tmin)
t=0;
for i=1:4
tfac=0.93+0.11*i-0.070*i^2+0.0053*i^3;
ti=tmin+tfac*(tmax-tmin);
t=t+ti;
end
t=1/4 * t;
end