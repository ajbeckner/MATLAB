%%
close all; clear all;clc
ax = axes('XLim',[-25 300],'YLim',[-25 25],'ZLim',[-25 25]);
view(3)
grid off;
axis equal;
axis off
hold on 
whitebg('g')
shg

%%
[x1,y1,z1] = ellipsoid(0,0,0,6,3,3,10);
ball = surface(x1,y1,z1,'FaceColor',[.4 .2 0]);
q = hgtransform('Parent',ax);
set(ball,'Parent',q)

%%
[x2,y2,z2] = cylinder([.08],10);
l = 25;
d = 200;
h(1) = surface(d + l*x2,l*y2,-l*z2,'FaceColor','yellow');
h(2) = surface(d + l*y2,2*l*z2 - l,l*x2,'FaceColor','yellow');
h(3) = surface(d +l*x2,l*y2+l,2*l*z2-1,'FaceColor','yellow');
h(4) = surface(d + l*x2,l*y2-l,2*l*z2-1,'FaceColor','yellow');
p = hgtransform('Parent',ax);
set(h,'Parent',p)

%%
set(gcf,'Renderer','opengl')
drawnow
Rz = eye(4);
Sxy = Rz;


%% 
% setup
velocity = 50;
angle = 35;
vx = velocity*cosd(angle);
vy = velocity*sind(angle);
tmax = (2*vy/9.8)*(9/8);

t = linspace(0,tmax,100);
dy = vy*t + .5*-9.8*t.*t;
dx = vx*t;

xTranslation = vx*t;
yTranslation = 0*xTranslation;
zTranslation = vy*t + .5*-9.8*t.*t;

%%
for i = 1:length(xTranslation)
    translation = makehgtform('translate', [xTranslation(i) yTranslation(i) zTranslation(i)] );
    
    %r = linspace(1,5*pi/3,length(xTranslation));
    r = (vy - (9.8*t))/(vy - (9.8*t(1)));
    
    Rz = makehgtform('yrotate',-r(i));
    
    % Combining the individual transformation
    disp(i)
    set(q,'matrix',translation*Rz);
    pause(.001)
    hold on
end

