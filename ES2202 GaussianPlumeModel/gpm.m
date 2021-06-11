%This program is Written By Akash Chandra Behera for the ES2202 Termpaper Spring 2021
%In this file I define the Gaussian Plume Function, I also used it to do the individual calculations for each day

%E=gpm1(2000000000,100,0.15,1,0.2,7000);
%disp(E)
%Some termoinology : Q is the stack emission in microgram per sec.; h the
%actual height of the stack; t is the temperature of the day in
%consideration; p is parameter dependent on terrain; wind is the speed of
%wind at 10m height in m per sec.; x&y are coordinates
function [conc] = gpm(Q,h,t,p,wind,x,y) 
%Following part is for convinenece of calculations
%Q = input("What is Q");
%wind = input("Wind speed at surface");
%what is p? ");
%H = 100;
p=0.15; %It later turned out all days had stability class A
u_h = wind.*(10.^p);  %%We first calcuate wind speed at actual stack height
disp(u_h); %%This was for debugging
F=9.8.*9.*9.*(1-((t+273.15)./(180+273.15)));   %%This is the buoyancy parameter
if F>=55         %% We use equation 54 from Air pollution chapter of Gilbert Master 3rd edition, as we shall only be dealing with unsatble conditions
    x_f=120.*(F.^0.4);
else
    x_f=50.*(F.^(5./8));
end
dh=1.6.*(F.^(1./3)).*(x_f.^(2./3))./u_h;
a = 213; %%From Table 8 Gilbert Masters 3rd Ed.
H=dh + h; %%H is our effective height
u_H=wind.*((H./10).^p);  %%Wind speed at effective height
if x<=1    %%Again from table 8 of Gilbert Masters 3rd Ed.
    d = 1.941; c = 440.8; f = 9.27;
else
    d = 2.094; c = 459.7; f = -9.6;
end
sig_y = a.*(x.^0.894); %%Eq.47&48 from Air pollution chapter of Gilbert Masters 3rd Ed.
disp(sig_y);
sig_z= c.*(x.^d)+f;
disp(sig_z);
%format short e
f_0=(Q./(pi.*sig_y.*sig_z.*u_H)); %%from here on I just define the Gaussian equation (I break them in parts just for convenience of coding.) 
j_0 = ((H.^2)./(2.*(sig_z.^2)));
g_0=exp((-1).*j_0);
y_0=exp((-(y.^2)./(2.*(sig_y.^2))));
conc=(f_0).*g_0.*y_0;

end