% do not modify the function line below
function [v, square] = problem2

% coordinates of square under one variable

square = [3.5 3.5 6.5 6.5; 3.5 6.5 6.5 3.5];

% generate animation window
figure
xmin = -pi;
xmax = 7*pi;
ymin = -8;
ymax = 8;
axis equal
axis([xmin xmax ymin ymax])
grid on
hold on

%setting your trajectory
t = linspace(0,6*pi,500); % independent variable of your function
trajectory = cos(t); % represents y in y = cos(t)

nsquare = square;

plot(t,trajectory,':')
for i = 1:length(t)
    
    
    beta = (t(i)*10/(3));
    
    rotX = [cos(beta), -sin(beta)];
    rotY = [sin(beta), cos(beta)];
    
    nsquare(1,:) = square(1,:) - 5;
    nsquare(2,:) = square(2,:) - 5;
    nsquare = [rotX*nsquare;rotY*nsquare];
    
    h = fill( nsquare(1,:) + t(i) ,nsquare(2,:) + trajectory(i),'r');
    % do not change below 2 lines, should follow your fill command
    v.x(i,:)=get(h,'xdata')';
    v.y(i,:)=get(h,'ydata')';
    
    % add anything below
    pause(.000001)
    
    
end
end