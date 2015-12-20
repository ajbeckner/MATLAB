%connect to phone and get accel data
clear m
m = mobiledev;
m.AccelerationSensorEnabled = 1;
m.Logging = 1;
%initialize data for rolling plot
data = zeros(200,1);
%initialize plot
figure(1)
p = plot(data);
axis([0 200 -15 15]);
pause(1)
tic
while (toc < 30)%run for 30 secs
      %get new z coordinates
      [a,~] = accellog(m);
      if length(a) > 200
        data = a(end-199:end,3);
      else
        data(201 - length(a):200) = a(:,3);
      end
      % redraw plot
      p.YData = data;
      drawnow
  end