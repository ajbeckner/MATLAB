% %% Biweekly Assignment 3
% %  by Anthony Beckner
% %  section 81
% 
% %                                                 %
% %% ------------------- QUESTION 1 -------------- %%
% %                                                 %
% 
% %% startup:
% close all;clear all; clc
% 
% % set axes
% figure(1)
% whitebg('w')%keeps correct color (necesarry for running multiple times)
% %create limits
% xmin = -10;
% xmax = 250;
% ymin = -10;
% ymax = 50;
% axis equal 
% axis([xmin xmax ymin ymax])
% hold on
% 
% % create square
% %poroperty values for sides, color, and length
% nSides = 4;
% color = 'green';
% length = 5;
% 
% %taken from a function that creates n sided polygon length l, color c
% polarangles = (pi/nSides) *(1:2:(2*nSides - 1));%generate angles of polar graph
% %convert to cartesan coordinates
% X = cos(polarangles);
% Y = sin(polarangles);
% X = X*X(1)*length;
% Y = Y*Y(1)*length;
% square = [X;Y];
% %draw
% h = fill(square(1,:),square(2,:),'g');
% %% animation:
% 
% % setup
% velocity = 50;
% angle = 35;
% vx = velocity*cosd(angle);
% vy = velocity*sind(angle);
% tmax = 2*vy/9.8;%formua for end time found by calculating half time and *2
% 
% %create values for translation
% t = linspace(0,tmax,500);%all necesary time values with 500 frames
% dy = vy*t + .5*-9.8*t.*t;%formula for y distance
% dx = vx*t;%formula for x distance
% 
% for i = 1:max(size(t))
%     
%     %rotation
%     beta = (t(i)*pi);
%     rotX = [cos(beta), -sin(beta)];
%     rotY = [sin(beta), cos(beta)];
%     nsquare = square;
%     nsquare = [rotX*nsquare;rotY*nsquare];
%     
%     %plotting
%     pause(.001)
%     delete(h)%clears previous objects
%     shg
%     h = fill(nsquare(1,:) + dx(i),nsquare(2,:) + dy(i),color);%draws and translates
%     
%     
%     
% end
% 
% %                                                 %
%% ------------------- QUESTION 2 -------------- %%
%                                                 %
% This animation shows a football moving through the air and sucessfully
% landing between the goal posts.
% 

%% startup
clear all; clc
%generate axes
figure(2)
ax = axes('XLim',[-25 300],'YLim',[-25 25],'ZLim',[-25 25]);
view(3)%show 3space

%makes space look nice
grid off;
axis off
axis equal;
whitebg('g')
hold on 
shg

%% generate points of football
[x1,y1,z1] = ellipsoid(0,0,0,6,3,3,10); 
ball = surface(x1,y1,z1,'FaceColor','r'); 
q = hgtransform('Parent',ax);
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
% model projectile like in part one
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
for j = 1:length(xTranslation)
    % perform translation
    translation = makehgtform('translate', [xTranslation(j) yTranslation(j) zTranslation(j)] );
    
    Rz = makehgtform('yrotate',-r(j));
    
    % Combining the individual transformation
    set(q,'matrix',translation*Rz);
    pause(.01)
    hold on
end





