function [v t] = problem1

% coordinates of square under one variable
polarangles = (pi/4) *(1:2:(2*4 - 1));
X = cos(polarangles);
Y = sin(polarangles);
square = [X*X(1)*4;Y*Y(1)*4];
% generate animation window
figure
xmin = -5;
xmax = 25;
ymin = -5;
ymax = 125;
axis equal
axis([xmin xmax ymin ymax])
hold on

% setting your trajectory
t = linspace(0,20,500); % independent variable of your function
trajectory = (1/4).*t.^2; % represents y in y = t^2

% all fill/drawing steps should occur in for loop
for i = 1:length(t)
    
    scale = 1 - (.75*t(i))/t(length(t));
    
    % fill in the appropriate inputs for fill
    h = fill( square(1,:)*scale + t(i),  square(2,:)*scale + trajectory(i),'r');
    % do not change below 2 lines, should follow your fill command
    v.x(i,:)=get(h,'xdata')';
    v.y(i,:)=get(h,'ydata')';
    % add anything below
    
    pause(.001)
    
    if i < length(t)
        delete(h)
    end
end

end
