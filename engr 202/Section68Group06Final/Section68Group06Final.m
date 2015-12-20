function varargout = Section68Group06Final(varargin)
% SECTION68GROUP06FINAL MATLAB code for Section68Group06Final.fig
%      SECTION68GROUP06FINAL, by itself, creates a new SECTION68GROUP06FINAL or raises the existing
%      singleton*.
%
%      H = SECTION68GROUP06FINAL returns the handle to a new SECTION68GROUP06FINAL or the handle to
%      the existing singleton*.
%
%      SECTION68GROUP06FINAL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SECTION68GROUP06FINAL.M with the given input arguments.
%
%      SECTION68GROUP06FINAL('Property','Value',...) creates a new SECTION68GROUP06FINAL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Section68Group06Final_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Section68Group06Final_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Section68Group06Final

% Last Modified by GUIDE v2.5 30-Aug-2015 15:07:22

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Section68Group06Final_OpeningFcn, ...
                   'gui_OutputFcn',  @Section68Group06Final_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT

% --- Executes just before Section68Group06Final is made visible.
function Section68Group06Final_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Section68Group06Final (see VARARGIN)

% Choose default command line output for Section68Group06Final
handles.output = hObject;
if ~isempty(instrfind)
    fclose(instrfind);
    delete(instrfind);
end
comPort='/dev/tty.usbmodem1421';
[accelerometer.s,flag]=setupSerial(comPort);
calCo = calibrate(accelerometer.s);
saveVal('loop','true');

set(handles.axes1);
axis([-25  300 -25 50 -25 50]);
view(3);
grid off;
axis off;
axis equal;
whitebg([0/255 169/255 0/255  ]);
l = light('Position',[-1 -1 1],'Parent',handles.axes1);

hold on
shg

mbox = msgbox('Welcome to The Football Simulator!','Instructions:'); uiwait(mbox);
mbox = msgbox({'Throw the ''football'' as straight as you';'can to get it through the goal.'},'Instructions:'); uiwait(mbox);
mbox = msgbox({'Hold the acelerometer with ''y'' forward';'and ''x'' up, to aim your throw'},'Instructions:'); uiwait(mbox);
mbox = msgbox({'When you think you are ready, just aim and';'throw it straight.'},'Instructions:'); uiwait(mbox);
mbox = msgbox({'Good luck! Oh . . . and don''t forget to';'hit the red ''x'' to quit.'},'Instructions:','Callback','uiresume(mbox)'); uiwait(mbox);


pause(.1)
while(true)
[v,theta,phi] = readAccFull(accelerometer,calCo);
set(handles.axes1);
%cla
[xfinal, yfinal] = animation(v,theta,phi,handles.axes1);
%drawnow
if (xfinal > 200 && atand(yfinal/abs(xfinal)) < atand(25/200))
    mbox = msgbox({'Congratulations! You won!';'Play again if you want.'},'Callback','uiresume(mbox)'); 
else
    mbox = msgbox({'Almost. Why don''t you try';'again? Just throw another.'},'Callback','uiresume(mbox)'); 
end
if (strcmp(getVal('loop'),'false'))
    break
end
 end
% 
%guidata(hObject, handles);
% Update handles structure

% UIWAIT makes Section68Group06Final wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Section68Group06Final_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes during object deletion, before destroying properties.
function figure1_DeleteFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
saveVal('loop','false');
closeSerial

% --- Executes during object deletion, before destroying properties.
function axes1_DeleteFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
saveVal('loop','false');
closeSerial 
