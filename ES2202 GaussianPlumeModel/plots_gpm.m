%This code was written by Akash Chandra Behera (19MS126) for ES2201
%Termpaper Spring 2021
%Following code is for heat-map
x=linspace(0.01,7,701); %This defines a line space with 701 ticks from 0.01 to 7, so spacing is between each tick is 1 unit
y=linspace(-1200,1200,601);
[X,Y]=meshgrid(x,y);%makes a meshgrid of X,Y
Z1=gpm(81000000,100,31,0.15,1.12,X,abs(Y));%defines value for each grid block
%Z2=gpm(100260780,100,28,0.15,1.12,Y,X)
Z=Z1%+Z2
%Z=conc(2000000000,100,0.15,1,X,Y)
%Z=Gauss(X,Y)
%xticks([0 5 10])
%xticklabels({'x = 0','x = 5','x = 10'})
xlabel('x')
%plot3(X,Y,Z)
%figure(contour(X,Y,Z,v0,'showtext','on','linewidth',2))
%set(gca,'color','none')
%v0=[2.63,10.53,15,25.3,30] NOTE, contour levels are adjusted for each day
%so that they include calculated, adjusted and observed concentartions
%contour(X,Y,Z,v0,'showtext','on','linewidth',2)
heatmap(Z) %makes a heatmap
grid off
colormap(jet) %the colour scheme
function [gpm]= Gauss(x,y) %the function f(x,y)
gpm=x./(y+10);
end

