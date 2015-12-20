    function varargout = Section68Group06Biweekly3GUI(varargin)
% SECTION68GROUP06BIWEEKLY3GUI MATLAB code for Section68Group06Biweekly3GUI.fig
%      SECTION68GROUP06BIWEEKLY3GUI, by itself, creates a new SECTION68GROUP06BIWEEKLY3GUI or raises the existing
%      singleton*.
%
%      H = SECTION68GROUP06BIWEEKLY3GUI returns the handle to a new SECTION68GROUP06BIWEEKLY3GUI or the handle to
%      the existing singleton*.
%
%      SECTION68GROUP06BIWEEKLY3GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SECTION68GROUP06BIWEEKLY3GUI.M with the given input arguments.
%
%      SECTION68GROUP06BIWEEKLY3GUI('Property','Value',...) creates a new SECTION68GROUP06BIWEEKLY3GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Section68Group06Biweekly3GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Section68Group06Biweekly3GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Section68Group06Biweekly3GUI

% Last Modified by GUIDE v2.5 31-Jul-2015 00:00:59

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Section68Group06Biweekly3GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @Section68Group06Biweekly3GUI_OutputFcn, ...
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


% --- Executes just before Section68Group06Biweekly3GUI is made visible.
function Section68Group06Biweekly3GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Section68Group06Biweekly3GUI (see VARARGIN)

% Choose default command line output for Section68Group06Biweekly3GUI



handles.output = hObject;

%%%% NOTE TO MEGAN AND CORY: CHANGE THESE (below) VARIABLES IN THE OTHER CALLBACKS
%%%% TO TURN THINGS ON AND OFF AS NEEDED. EVERYTHING ELSE FOR THIS PART
%%%% SHOULD BE DONE. You can use handles, or maybe conditionwrite/ conditionread with more files
%%%% GOOD NIGHT. -AJ,3:56, July 31, 2015

handles.buffer=200; %Set buffer length
handles.points = 5; % Window size for SMA
handles.threshold=1.5; % Set threshold
handles.a = .5;


% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Section68Group06Biweekly3GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Section68Group06Biweekly3GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1


% --- Executes on button press in calibrateButton.
function calibrateButton_Callback(hObject, eventdata, handles)
% hObject    handle to calibrateButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%prepare for calibration
conditionWrite('condition.txt','false')
if ~isempty(instrfind)
    fclose(instrfind);
    delete(instrfind);
end

%calibrate
comPort='/dev/tty.usbmodem1421';
[handles.accelerometer.s,flag]=setupSerial(comPort);
handles.calCo=calibrate(handles.accelerometer.s);
%make variables visible to other callbacks
guidata(hObject,handles);


% --- Executes on button press in startButton.
function startButton_Callback(hObject, eventdata, handles)
% hObject    handle to startButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

handles.accelerometer.s;%WARNING: DO NOT REMOVE

magnitudeRaw=zeros(1,handles.buffer); % Magnitude raw data
magnitudeFilteredSMA=zeros(1,handles.buffer); % Magnitude filtered data
magnitudeFilteredAlpha=zeros(1,handles.buffer);% Magnitude alpha filtered data

%set up axes and plot initial datasets
axes(handles.axes1);
cla
P1=plot(1:handles.buffer,magnitudeRaw); 
hold on
P2=plot(1:handles.buffer,magnitudeFilteredSMA,'r','Linewidth',2);
P3=plot(1:handles.buffer,magnitudeFilteredAlpha,'k','Linewidth',2);
legend('Raw Data','SMA Filtered','Alpha Filtered')
plot([0, handles.buffer],[handles.threshold, handles.threshold],'g','Linewidth',3) % Plot threshold line

count=0; % Variable to count threshold crossings
conditionWrite('condition.txt','true');
newMagnitudeFilteredAlpha = 0;%initialize for calculation
while (true)
   [gx, gy, gz]=readAcc(handles.accelerometer,handles.calCo) ; % Read data from accelerometer
   
   newMagnitudeRaw=sqrt(gx^2+gy^2+gz^2); % Calculate raw magnitude
   magnitudeRaw=[magnitudeRaw(2:end) newMagnitudeRaw]; % Shift raw data vector and add new data point for rolling plots
   
   newMagnitudeFilteredSMA=mean(magnitudeRaw(end-(handles.points)+1:end)); % Calculate average of last tap number of points for SMA
   magnitudeFilteredSMA=[magnitudeFilteredSMA(2:end) newMagnitudeFilteredSMA]; % Shift filtered vector over and add new filtered data point
   
   newMagnitudeFilteredAlpha=(1-handles.a)*magnitudeFilteredAlpha(end)+handles.a*newMagnitudeRaw; %filter next point with alpha value
   magnitudeFilteredAlpha=[magnitudeFilteredAlpha(2:end) newMagnitudeFilteredAlpha];% Shift filtered vector over and add new filtered data point
   
   set(P1,'ydata',magnitudeRaw); % Update plots
   set(P2,'ydata',magnitudeFilteredSMA);
   set(P3,'ydata',magnitudeFilteredAlpha);
   axis([0 handles.buffer 0 2.5]); % Set axis limits
   
   if newMagnitudeFilteredSMA>handles.threshold && magnitudeFilteredSMA(end-1)<handles.threshold % If current point is above threshold, and last point was below threshold
       count=count+1; % Add to count
   end
   
   if newMagnitudeFilteredAlpha>handles.threshold && magnitudeFilteredAlpha(end-1)<handles.threshold % If current point is above threshold, and last point was below threshold
       count=count+1; % Add to count
   end
   title(['Threshold Crossings = ' num2str(count)]) % Title displays threshold counts
   drawnow % Update the plots
   
   if (strcmp(conditionRead('condition.txt'),'false'))
       break
   end
end


% --- Executes on button press in stopButton.
function stopButton_Callback(hObject, eventdata, handles)
% hObject    handle to stopButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
conditionWrite('condition.txt','false')

% --- Executes on selection change in filterMenu.
function filterMenu_Callback(hObject, eventdata, handles)
% hObject    handle to filterMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns filterMenu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from filterMenu
switch get(handles.filterMenu,'Value')   
    case 'None'
        conditionWrite('plotType.txt','NONE');
    case 'SMA'
        conditionWrite('plotType.txt','SMA');
    case 'Alpha'
        conditionWrite('plotType.txt','Alpha');
    otherwise
end 

% --- Executes during object creation, after setting all properties.
function filterMenu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to filterMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
 
% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function alphaInput_Callback(hObject, eventdata, handles)
% hObject    handle to alphaInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of alphaInput as text
%        str2double(get(hObject,'String')) returns contents of alphaInput as a double


% --- Executes during object creation, after setting all properties.
function alphaInput_CreateFcn(hObject, eventdata, handles)
% hObject    handle to alphaInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function dataInput_Callback(hObject, eventdata, handles)
% hObject    handle to dataInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of dataInput as text
%        str2double(get(hObject,'String')) returns contents of dataInput as a double


% --- Executes during object creation, after setting all properties.
function dataInput_CreaqteFcn(hObject, eventdata, handles)
% hObject    handle to dataInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




function thresholdInput_Callback(hObject, eventdata, handles)
% hObject    handle to thresholdInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of thresholdInput as text
%        str2double(get(hObject,'String')) returns contents of thresholdInput as a double


% --- Executes during object creation, after setting all properties.
function thresholdInput_CreateFcn(hObject, eventdata, handles)
% hObject    handle to thresholdInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
handles.threshold = true;


% --- Executes on button press in thresholdButton.
function thresholdButton_Callback(hObject, eventdata, handles)
% hObject    handle to thresholdButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
guidata(hObject,handles);


% --- Executes during object deletion, before destroying properties.
function figure1_DeleteFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
conditionWrite('condition.txt','false')
closeSerial
