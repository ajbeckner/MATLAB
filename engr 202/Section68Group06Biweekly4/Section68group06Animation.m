%% startup
close all
clear all
clc

%generate axes with 3 dimensions, and set paremeters
figure(2)
ax = axes('XLim',[-25 300],'YLim',[-25 50],'ZLim',[-25 50]);
view(3)

 

%makes space look nice

grid off;
axis off
axis equal;
%whitebg('g')
hold on
shg

 

%% generate points of football

[x1,y1,z1] = ellipsoid(0,0,0,6,3,3,10); 
ball = surface(x1,y1,z1,'FaceColor','r'); 
q = hgtransform('Parent',ax)
set(ball,'Parent',q)

%% generate goal post

[x2,y2,z2] = cylinder([.08],10);% points of cylinder shape
l = 25; % standard length
d = 200;% distance away from origin

%create four different cylindrical components
h(1) = surface(d + l*x2,l*y2,-l*z2,'FaceColor','yellow');
h(2) = surface(d + l*y2,2*l*z2 - l,l*x2,'FaceColor','yellow');
h(3) = surface(d +l*x2,l*y2+l,2*l*z2-1,'FaceColor','yellow');
h(4) = surface(d + l*x2,l*y2-l,2*l*z2-1,'FaceColor','yellow');

%combine the component objects into one parent

p = hgtransform('Parent',ax);
set(h,'Parent',p)

 

%% animation setup

set(gcf,'Renderer','opengl')
drawnow

%initialize transforms
Rz = eye(4);

%% calculate translation curves

% model football like in part one
velocity = 50;
angle = 35;
vx = velocity*cosd(angle);
vy = velocity*sind(angle);
tmax = (2*vy/9.8)*(9/8);

t = linspace(0,tmax,100);
dy = vy*t + .5*-9.8*t.*t;
dx = vx*t;

% set up translations in x and z

xTranslation = vx*t;
yTranslation = 0*xTranslation;
zTranslation = vy*t + .5*-9.8*t.*t;

% rotation is the unit vector of the derivative
r = (vy - (9.8*t))/(vy - (9.8*t(1)));

%%

%note: all transforms have same length
for j = 1:length(xTranslation)

    % perform translation
    translation = makehgtform('translate', [xTranslation(j) yTranslation(j) zTranslation(j)] );
    Rz = makehgtform('yrotate',-r(j));

    % Combine the individual transformations
    set(q,'matrix',translation*Rz);
    pause(.01)
    hold on

end

%Explosion Animation Code

%sets the scale fator value for the explosion and initial sphere
scale = 5; 
[X,Y,Z] = sphere(30);

for i = 1:.25:30
    
    %conditional determines when to make sphere yellow/red, and scales
    %sphere
    if i-floor(i) > .5 
    surface(scale*X+270,scale*Y,scale*Z-25,'Facecolor','yellow');
    elseif i-floor(i) < 5 
    surface(scale*X+270,scale*Y,scale*Z-25,'Facecolor','red');
    end
    
    %changes scale by 1 each itteration
    scale = scale+1; 
    pause(.01)
    
end
    
    
        
    
    
    
    
    
    
    
