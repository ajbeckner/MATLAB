function [x y] = animation(velocity,theta,phi, ax)
%generate axes with 3 dimensions, and set paremeters
postColor1 = [238/255 215/255 0/255];
postColor2 = [238/255 215/255 40/255];

ballColor1 = [139/255 69/255 19/255];
ballColor2 = [139/255 69/255 59/255];

%% generate points of football

[x1,y1,z1] = ellipsoid(0,0,0,6,3,3,40);
ball = surface(x1,y1,z1,'FaceColor',ballColor1,'EdgeColor','none','FaceLighting','gouraud'); 
q = hgtransform('Parent',ax);
set(ball,'Parent',q);

%% generate goal post

[x2,y2,z2] = cylinder([.08],30);% points of cylinder shape
l = 25; % standard length
d = 200;% distance away from origin

%create four different cylindrical components
h(1) = surface(d + l*x2,l*y2,l*z2,'FaceColor',postColor1,'EdgeColor','none','FaceLighting','gouraud');
h(2) = surface(d + l*y2,2*l*z2 - l,l+l*x2,'FaceColor',postColor1,'EdgeColor','none','FaceLighting','gouraud');
h(3) = surface(d +l*x2,l*y2+l,l + 2*l*z2-1,'FaceColor',postColor1,'EdgeColor','none','FaceLighting','gouraud');
h(4) = surface(d + l*x2,l*y2-l,l + 2*l*z2-1,'FaceColor',postColor1,'EdgeColor','none','FaceLighting','gouraud');

%combine the component objects into one parent

p = hgtransform('Parent',ax);
set(h,'Parent',p);

%% animation setup

set(gcf,'Renderer','opengl');
drawnow

%initialize transforms
%Rz = eye(4);

%% calculate translation curves

% model football like in part one
% velocity = 50;
% theta = 40;
% phi = 0;
vx = velocity*cosd(theta)*cosd(phi);
vz = velocity*sind(theta);
vy = velocity*cosd(theta)*sind(phi);
t = (2*vz/9.8);

t = linspace(0,t,100);
dx = vx*t;
dy = vy*t;
dz = vz*t + .5*-9.8*t.*t;

%landing coordinates
x = dx(end);
y = dy(end);

% set up translations in x and z

xTranslation = dx;
yTranslation = dy;
zTranslation = dz;

% rotation is the unit vector of the derivative
r = (vz - (9.8*t))/(vz - (9.8*t(1)));

%%

%note: all transforms have same length
for j = 1:length(xTranslation)

    % perform translation
    translation = makehgtform('translate', [xTranslation(j) yTranslation(j) zTranslation(j)] );
    Rz = makehgtform('yrotate',-r(j));

    % Combine the individual transformations
    set(q,'matrix',translation*Rz);
    drawnow

end
end