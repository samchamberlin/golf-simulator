function varargout = Project3(varargin)
% PROJECT3 MATLAB code for Project3.fig
%      PROJECT3, by itself, creates a new PROJECT3 or raises the existing
%      singleton*.
%
%      H = PROJECT3 returns the handle to a new PROJECT3 or the handle to
%      the existing singleton*.
%
%      PROJECT3('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PROJECT3.M with the given input arguments.
%
%      PROJECT3('Property','Value',...) creates a new PROJECT3 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Project3_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Project3_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Project3

% Last Modified by GUIDE v2.5 10-Dec-2018 21:43:14

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Project3_OpeningFcn, ...
                   'gui_OutputFcn',  @Project3_OutputFcn, ...
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


% --- Executes just before Project3 is made visible.
function Project3_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Project3 (see VARARGIN)

% Choose default command line output for Project3
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Project3 wait for user response (see UIRESUME)
% uiwait(handles.figure1);

%BACKGROUND IMAGE
backgroundImage = axes('units','normalized', ...
            'position',[0 0 1 1]);
uistack(backgroundImage,'bottom');
I=imread('GolfCourse.jpg');
hi = imagesc(I);
colormap gray;
set(backgroundImage,'handlevisibility','off', ...
    'visible','off');
%-----------------------------------------

%CLUB IMAGE
axes(handles.clubImage);
    [im, map, alpha] = imread('Bag.png');
    f = imshow(im, 'XData', [0 6], 'YData', [0 10]);
    set(f, 'AlphaData', alpha);
%-----------------------------------------

%CREATE AXES
x=0;
y=0;
z=0;
plot3(handles.mainAxes,x,y,z);
xlim(handles.mainAxes, [0 400]);
ylim(handles.mainAxes, [-100 100]);
set(handles.mainAxes,'YDir','reverse');
zlim(handles.mainAxes, [0 100]);
box(handles.mainAxes, 'on');
hold(handles.mainAxes, 'on');

plot(handles.axes2, x, y);
xlim(handles.axes2,[-100, 100]);
ylim(handles.axes2,[0,400]);
hold(handles.axes2, 'on');

plot(handles.axes3, x, y);
xlim(handles.axes3,[0, 400]);
ylim(handles.axes3,[0,100]);
hold(handles.axes3, 'on');
%-----------------------------------------


% --- Outputs from this function are returned to the command line.
function varargout = Project3_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on selection change in golfClubs.
function golfClubs_Callback(hObject, eventdata, handles)
% hObject    handle to golfClubs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
contents = cellstr(get(hObject,'String'));
currentClub = contents{get(hObject,'Value')};

axes(handles.clubImage);
if(strcmp(currentClub,'Driver'))
    [im, map, alpha] = imread('Driver.png');
    f = imshow(im, 'XData', [0 6], 'YData', [0 10]);
    set(f, 'AlphaData', alpha);
elseif(strcmp(currentClub,'2 Wood') | strcmp(currentClub,'3 Wood') | strcmp(currentClub,'4 Wood')  | strcmp(currentClub,'5 Wood') | strcmp(currentClub,'6 Wood') | strcmp(currentClub,'7 Wood'))
    [im, map, alpha] = imread('Wood.png');
    f = imshow(im, 'XData', [0 6], 'YData', [0 10]);
    set(f, 'AlphaData', alpha);
elseif(strcmp(currentClub,'3 Iron') | strcmp(currentClub,'4 Iron') | strcmp(currentClub,'5 Iron') | strcmp(currentClub,'6 Iron') | strcmp(currentClub,'7 Iron') | strcmp(currentClub,'8 Iron') | strcmp(currentClub,'9 Iron'))
    [im, map, alpha] = imread('Iron.png');
    f = imshow(im, 'XData', [0 6], 'YData', [0 10]);
    set(f, 'AlphaData', alpha);
elseif(strcmp(currentClub,'Putter'))
    [im, map, alpha] = imread('Putter.png');
    f = imshow(im, 'XData', [0 6], 'YData', [0 10]);
    set(f, 'AlphaData', alpha);
elseif(strcmp(currentClub,'Pitching Wedge'))
    [im, map, alpha] = imread('Wedge.png');
    f = imshow(im, 'XData', [0 6], 'YData', [0 10]);
    set(f, 'AlphaData', alpha);
else
    [im, map, alpha] = imread('Bag.png');
    f = imshow(im, 'XData', [0 6], 'YData', [0 10]);
    set(f, 'AlphaData', alpha);
end

% Hints: contents = cellstr(get(hObject,'String')) returns golfClubs contents as cell array
%        contents{get(hObject,'Value')} returns selected item from golfClubs


% --- Executes during object creation, after setting all properties.
function golfClubs_CreateFcn(hObject, eventdata, handles)
% hObject    handle to golfClubs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
% if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
%     set(hObject,'BackgroundColor','white');
% end


function holeDistance_Callback(hObject, eventdata, handles)
% hObject    handle to holeDistance (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of holeDistance as text
%        str2double(get(hObject,'String')) returns contents of holeDistance as a double


% --- Executes during object creation, after setting all properties.
function holeDistance_CreateFcn(hObject, eventdata, handles)
% hObject    handle to holeDistance (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in createHoleButton.
function createHoleButton_Callback(hObject, eventdata, handles)
% hObject    handle to createHoleButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global numSwings;
numSwings = 0;

global xHole;
global yHole;

hold(handles.mainAxes, 'off');
hold(handles.axes2, 'off');
hold(handles.axes3, 'off');

%CREATE HOLE
xHole = randi([-100,100]);
dHole = str2double(get(handles.holeDistance, 'String'));
yHole = sqrt(dHole^2 - xHole^2);

plot3(handles.mainAxes, yHole, xHole, 0, 'ro');
set(handles.mainAxes,'YDir','reverse');
xlim(handles.mainAxes,[0, 400]);
ylim(handles.mainAxes,[-100,100]);
zlim(handles.mainAxes,[0,100]);
box(handles.mainAxes, 'on');
hold(handles.mainAxes, 'on');

plot(handles.axes2, xHole, yHole, 'ro')
xlim(handles.axes2,[-100, 100]);
ylim(handles.axes2,[0,400]);
hold(handles.axes2, 'on');

plot(handles.axes3, yHole, 0, 'ro')
xlim(handles.axes3,[0, 400]);
ylim(handles.axes3,[0,100]);
hold(handles.axes3, 'on');
%-----------------------------------------

%CREATE WIND ARROW
A = str2double(get(handles.windSpeed,'String')); %Wind Speed
B = get(handles.windDirectionSlider, 'Value'); %Wind Direction

quiver(handles.axes2,90,360,A*sind(B),A*cosd(B),'maxheadsize',.6,'linewidth',2);
xlim(handles.axes2,[-100, 100]);
ylim(handles.axes2,[0,400]);
hold(handles.axes2, 'on');

quiver(handles.axes3,360,90,A*cosd(B),0,'maxheadsize',.4,'linewidth',2);
xlim(handles.axes3,[0, 400]);
ylim(handles.axes3,[0,100]);
hold(handles.axes3, 'on');
%-----------------------------------------

%CREATE SWING ARROW DIRECTION
A = str2double(get(handles.swingPower, 'String')); %Swing Power
B = get(handles.swingDirectionSlider, 'Value'); %Swing Direction

currentClub = get(handles.golfClubs, 'Value');
if currentClub == 2
    club = 'Driver';
elseif currentClub == 3
    club = '2 Wood';
elseif currentClub == 4
    club = '3 Wood';
elseif currentClub == 5
    club = '4 Wood';
elseif currentClub == 6
    club = '5 Wood';
elseif currentClub == 7
    club = '6 Wood';
elseif currentClub == 8
    club = '7 Wood';
elseif currentClub == 9
    club = '3 Iron';
elseif currentClub == 10
    club = '4 Iron';
elseif currentClub == 11
    club = '5 Iron';
elseif currentClub == 12
    club = '6 Iron';
elseif currentClub == 13
    club = '7 Iron';
elseif currentClub == 14
    club = '8 Iron';
elseif currentClub == 15
    club = '9 Iron';
elseif currentClub == 16
    club = 'Pitching Wedge';
elseif currentClub == 17
    club = 'Putter';
else
   club = 'none';
end

[vel spin theta0] = club_strike(club, 1);
swingAngle = theta0;

quiver3(handles.mainAxes,0,0,0,(1/2)*A*sind(B),-(1/2)*A*cosd(B),A*sind(swingAngle),'maxheadsize',.4,'linewidth',2);
xlim(handles.mainAxes, [0 400]);
ylim(handles.mainAxes, [-100 100]);
set(handles.mainAxes,'YDir','reverse');
zlim(handles.mainAxes, [0 100]);
box(handles.mainAxes, 'on');
hold(handles.mainAxes, 'on');

quiver(handles.axes2,0,0,-A*cosd(B),A*sind(B),'maxheadsize',.4,'linewidth',2);
xlim(handles.axes2,[-100, 100]);
ylim(handles.axes2,[0,400]);
hold(handles.axes2, 'on');

quiver(handles.axes3,0,0,(1/2)*A*sind(B)*cosd(swingAngle),(1/2)*A*sind(B)*sind(swingAngle),'maxheadsize',.4,'linewidth',2);
xlim(handles.axes3,[0, 400]);
ylim(handles.axes3,[0,100]);
hold(handles.axes3, 'on');
%-----------------------------------------


function windSpeed_Callback(hObject, eventdata, handles)
% hObject    handle to windSpeed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of windSpeed as text
%        str2double(get(hObject,'String')) returns contents of windSpeed as a double

hold(handles.mainAxes, 'off');
hold(handles.axes2, 'off');
hold(handles.axes3, 'off');

%CREATE HOLE
global xHole;
global yHole;

plot3(handles.mainAxes, yHole, xHole, 0, 'ro');
set(handles.mainAxes,'YDir','reverse');
xlim(handles.mainAxes,[0, 400]);
ylim(handles.mainAxes,[-100,100]);
zlim(handles.mainAxes,[0,100]);
box(handles.mainAxes, 'on');
hold(handles.mainAxes, 'on');

plot(handles.axes2, xHole, yHole, 'ro')
xlim(handles.axes2,[-100, 100]);
ylim(handles.axes2,[0,400]);
hold(handles.axes2, 'on');

plot(handles.axes3, yHole, 0, 'ro')
xlim(handles.axes3,[0, 400]);
ylim(handles.axes3,[0,100]);
hold(handles.axes3, 'on');
%-----------------------------------------

%CREATE WIND ARROW
A = str2double(get(handles.windSpeed,'String')); %Wind Speed
B = get(handles.windDirectionSlider, 'Value'); %Wind Direction

quiver(handles.axes2,90,360,A*sind(B),A*cosd(B),'maxheadsize',.6,'linewidth',2);
xlim(handles.axes2,[-100, 100]);
ylim(handles.axes2,[0,400]);
hold(handles.axes2, 'on');

quiver(handles.axes3,360,90,A*cosd(B),0,'maxheadsize',.4,'linewidth',2);
xlim(handles.axes3,[0, 400]);
ylim(handles.axes3,[0,100]);
hold(handles.axes3, 'on');
%-----------------------------------------

%CREATE SWING ARROW DIRECTION
A = str2double(get(handles.swingPower, 'String')); %Swing Power
B = get(handles.swingDirectionSlider, 'Value'); %Swing Direction

currentClub = get(handles.golfClubs, 'Value');
if currentClub == 2
    club = 'Driver';
elseif currentClub == 3
    club = '2 Wood';
elseif currentClub == 4
    club = '3 Wood';
elseif currentClub == 5
    club = '4 Wood';
elseif currentClub == 6
    club = '5 Wood';
elseif currentClub == 7
    club = '6 Wood';
elseif currentClub == 8
    club = '7 Wood';
elseif currentClub == 9
    club = '3 Iron';
elseif currentClub == 10
    club = '4 Iron';
elseif currentClub == 11
    club = '5 Iron';
elseif currentClub == 12
    club = '6 Iron';
elseif currentClub == 13
    club = '7 Iron';
elseif currentClub == 14
    club = '8 Iron';
elseif currentClub == 15
    club = '9 Iron';
elseif currentClub == 16
    club = 'Pitching Wedge';
elseif currentClub == 17
    club = 'Putter';
else
   club = 'none';
end

[vel spin theta0] = club_strike(club, 1);
swingAngle = theta0;

quiver3(handles.mainAxes,0,0,0,(1/2)*A*sind(B),-(1/2)*A*cosd(B),A*sind(swingAngle),'maxheadsize',.4,'linewidth',2);
xlim(handles.mainAxes, [0 400]);
ylim(handles.mainAxes, [-100 100]);
set(handles.mainAxes,'YDir','reverse');
zlim(handles.mainAxes, [0 100]);
box(handles.mainAxes, 'on');
hold(handles.mainAxes, 'on');

quiver(handles.axes2,0,0,-A*cosd(B),A*sind(B),'maxheadsize',.4,'linewidth',2);
xlim(handles.axes2,[-100, 100]);
ylim(handles.axes2,[0,400]);
hold(handles.axes2, 'on');

quiver(handles.axes3,0,0,(1/2)*A*sind(B)*cosd(swingAngle),(1/2)*A*sind(B)*sind(swingAngle),'maxheadsize',.4,'linewidth',2);
xlim(handles.axes3,[0, 400]);
ylim(handles.axes3,[0,100]);
hold(handles.axes3, 'on');
%-----------------------------------------

% --- Executes during object creation, after setting all properties.
function windSpeed_CreateFcn(hObject, eventdata, handles)
% hObject    handle to windSpeed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on slider movement.
function windDirectionSlider_Callback(hObject, eventdata, handles)
% hObject    handle to windDirectionSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

hold(handles.mainAxes, 'off');
hold(handles.axes2, 'off');
hold(handles.axes3, 'off');

%CREATE HOLE
global xHole;
global yHole;

plot3(handles.mainAxes, yHole, xHole, 0, 'ro');
set(handles.mainAxes,'YDir','reverse');
xlim(handles.mainAxes,[0, 400]);
ylim(handles.mainAxes,[-100,100]);
zlim(handles.mainAxes,[0,100]);
box(handles.mainAxes, 'on');
hold(handles.mainAxes, 'on');

plot(handles.axes2, xHole, yHole, 'ro')
xlim(handles.axes2,[-100, 100]);
ylim(handles.axes2,[0,400]);
hold(handles.axes2, 'on');

plot(handles.axes3, yHole, 0, 'ro')
xlim(handles.axes3,[0, 400]);
ylim(handles.axes3,[0,100]);
hold(handles.axes3, 'on');
%-----------------------------------------

%CREATE WIND ARROW
A = str2double(get(handles.windSpeed,'String')); %Wind Speed
B = get(handles.windDirectionSlider, 'Value'); %Wind Direction

quiver(handles.axes2,90,360,A*sind(B),A*cosd(B),'maxheadsize',.6,'linewidth',2);
xlim(handles.axes2,[-100, 100]);
ylim(handles.axes2,[0,400]);
hold(handles.axes2, 'on');

quiver(handles.axes3,360,90,A*cosd(B),0,'maxheadsize',.4,'linewidth',2);
xlim(handles.axes3,[0, 400]);
ylim(handles.axes3,[0,100]);
hold(handles.axes3, 'on');
%-----------------------------------------

%CREATE SWING ARROW DIRECTION
A = str2double(get(handles.swingPower, 'String')); %Swing Power
B = get(handles.swingDirectionSlider, 'Value'); %Swing Direction

currentClub = get(handles.golfClubs, 'Value');
if currentClub == 2
    club = 'Driver';
elseif currentClub == 3
    club = '2 Wood';
elseif currentClub == 4
    club = '3 Wood';
elseif currentClub == 5
    club = '4 Wood';
elseif currentClub == 6
    club = '5 Wood';
elseif currentClub == 7
    club = '6 Wood';
elseif currentClub == 8
    club = '7 Wood';
elseif currentClub == 9
    club = '3 Iron';
elseif currentClub == 10
    club = '4 Iron';
elseif currentClub == 11
    club = '5 Iron';
elseif currentClub == 12
    club = '6 Iron';
elseif currentClub == 13
    club = '7 Iron';
elseif currentClub == 14
    club = '8 Iron';
elseif currentClub == 15
    club = '9 Iron';
elseif currentClub == 16
    club = 'Pitching Wedge';
elseif currentClub == 17
    club = 'Putter';
else
   club = 'none';
end

[vel spin theta0] = club_strike(club, 1);
swingAngle = theta0;

quiver3(handles.mainAxes,0,0,0,(1/2)*A*sind(B),-(1/2)*A*cosd(B),A*sind(swingAngle),'maxheadsize',.4,'linewidth',2);
xlim(handles.mainAxes, [0 400]);
ylim(handles.mainAxes, [-100 100]);
set(handles.mainAxes,'YDir','reverse');
zlim(handles.mainAxes, [0 100]);
box(handles.mainAxes, 'on');
hold(handles.mainAxes, 'on');

quiver(handles.axes2,0,0,-A*cosd(B),A*sind(B),'maxheadsize',.4,'linewidth',2);
xlim(handles.axes2,[-100, 100]);
ylim(handles.axes2,[0,400]);
hold(handles.axes2, 'on');

quiver(handles.axes3,0,0,(1/2)*A*sind(B)*cosd(swingAngle),(1/2)*A*sind(B)*sind(swingAngle),'maxheadsize',.4,'linewidth',2);
xlim(handles.axes3,[0, 400]);
ylim(handles.axes3,[0,100]);
hold(handles.axes3, 'on');
%-----------------------------------------


% --- Executes during object creation, after setting all properties.
function windDirectionSlider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to windDirectionSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function swingDirectionSlider_Callback(hObject, eventdata, handles)
% hObject    handle to swingDirectionSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

hold(handles.mainAxes, 'off');
hold(handles.axes2, 'off');
hold(handles.axes3, 'off');

%CREATE HOLE
global xHole;
global yHole;

plot3(handles.mainAxes, yHole, xHole, 0, 'ro');
set(handles.mainAxes,'YDir','reverse');
xlim(handles.mainAxes,[0, 400]);
ylim(handles.mainAxes,[-100,100]);
zlim(handles.mainAxes,[0,100]);
box(handles.mainAxes, 'on');
hold(handles.mainAxes, 'on');

plot(handles.axes2, xHole, yHole, 'ro')
xlim(handles.axes2,[-100, 100]);
ylim(handles.axes2,[0,400]);
hold(handles.axes2, 'on');

plot(handles.axes3, yHole, 0, 'ro')
xlim(handles.axes3,[0, 400]);
ylim(handles.axes3,[0,100]);
hold(handles.axes3, 'on');
%-----------------------------------------

%CREATE WIND ARROW
A = str2double(get(handles.windSpeed,'String')); %Wind Speed
B = get(handles.windDirectionSlider, 'Value'); %Wind Direction

quiver(handles.axes2,90,360,A*sind(B),A*cosd(B),'maxheadsize',.6,'linewidth',2);
xlim(handles.axes2,[-100, 100]);
ylim(handles.axes2,[0,400]);
hold(handles.axes2, 'on');

quiver(handles.axes3,360,90,A*cosd(B),0,'maxheadsize',.4,'linewidth',2);
xlim(handles.axes3,[0, 400]);
ylim(handles.axes3,[0,100]);
hold(handles.axes3, 'on');
%-----------------------------------------

%CREATE SWING ARROW DIRECTION
A = str2double(get(handles.swingPower, 'String')); %Swing Power
B = get(handles.swingDirectionSlider, 'Value'); %Swing Direction

currentClub = get(handles.golfClubs, 'Value');
if currentClub == 2
    club = 'Driver';
elseif currentClub == 3
    club = '2 Wood';
elseif currentClub == 4
    club = '3 Wood';
elseif currentClub == 5
    club = '4 Wood';
elseif currentClub == 6
    club = '5 Wood';
elseif currentClub == 7
    club = '6 Wood';
elseif currentClub == 8
    club = '7 Wood';
elseif currentClub == 9
    club = '3 Iron';
elseif currentClub == 10
    club = '4 Iron';
elseif currentClub == 11
    club = '5 Iron';
elseif currentClub == 12
    club = '6 Iron';
elseif currentClub == 13
    club = '7 Iron';
elseif currentClub == 14
    club = '8 Iron';
elseif currentClub == 15
    club = '9 Iron';
elseif currentClub == 16
    club = 'Pitching Wedge';
elseif currentClub == 17
    club = 'Putter';
else
   club = 'none';
end

[vel spin theta0] = club_strike(club, 1);
swingAngle = theta0;

quiver3(handles.mainAxes,0,0,0,(1/2)*A*sind(B),-(1/2)*A*cosd(B),A*sind(swingAngle),'maxheadsize',.4,'linewidth',2);
xlim(handles.mainAxes, [0 400]);
ylim(handles.mainAxes, [-100 100]);
set(handles.mainAxes,'YDir','reverse');
zlim(handles.mainAxes, [0 100]);
box(handles.mainAxes, 'on');
hold(handles.mainAxes, 'on');

quiver(handles.axes2,0,0,-A*cosd(B),A*sind(B),'maxheadsize',.4,'linewidth',2);
xlim(handles.axes2,[-100, 100]);
ylim(handles.axes2,[0,400]);
hold(handles.axes2, 'on');

quiver(handles.axes3,0,0,(1/2)*A*sind(B)*cosd(swingAngle),(1/2)*A*sind(B)*sind(swingAngle),'maxheadsize',.4,'linewidth',2);
xlim(handles.axes3,[0, 400]);
ylim(handles.axes3,[0,100]);
hold(handles.axes3, 'on');
%-----------------------------------------


% --- Executes during object creation, after setting all properties.
function swingDirectionSlider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to swingDirectionSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

% --- Executes on slider movement.
function swingPowerSlider_Callback(hObject, eventdata, handles)
% hObject    handle to swingPowerSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

swingPower = get(handles.swingPowerSlider, 'Value');
swingPower = swingPower*100;
swingPower = round(swingPower, 0);
set(handles.swingPower, 'String', swingPower);

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
hold(handles.mainAxes, 'off');
hold(handles.axes2, 'off');
hold(handles.axes3, 'off');

%CREATE HOLE
global xHole;
global yHole;

plot3(handles.mainAxes, yHole, xHole, 0, 'ro');
set(handles.mainAxes,'YDir','reverse');
xlim(handles.mainAxes,[0, 400]);
ylim(handles.mainAxes,[-100,100]);
zlim(handles.mainAxes,[0,100]);
box(handles.mainAxes, 'on');
hold(handles.mainAxes, 'on');

plot(handles.axes2, xHole, yHole, 'ro')
xlim(handles.axes2,[-100, 100]);
ylim(handles.axes2,[0,400]);
hold(handles.axes2, 'on');

plot(handles.axes3, yHole, 0, 'ro')
xlim(handles.axes3,[0, 400]);
ylim(handles.axes3,[0,100]);
hold(handles.axes3, 'on');
%-----------------------------------------

%CREATE WIND ARROW
A = str2double(get(handles.windSpeed,'String')); %Wind Speed
B = get(handles.windDirectionSlider, 'Value'); %Wind Direction

quiver(handles.axes2,90,360,A*sind(B),A*cosd(B),'maxheadsize',.6,'linewidth',2);
xlim(handles.axes2,[-100, 100]);
ylim(handles.axes2,[0,400]);
hold(handles.axes2, 'on');

quiver(handles.axes3,360,90,A*cosd(B),0,'maxheadsize',.4,'linewidth',2);
xlim(handles.axes3,[0, 400]);
ylim(handles.axes3,[0,100]);
hold(handles.axes3, 'on');
%-----------------------------------------

%CREATE SWING ARROW DIRECTION
A = str2double(get(handles.swingPower, 'String')); %Swing Power
B = get(handles.swingDirectionSlider, 'Value'); %Swing Direction

currentClub = get(handles.golfClubs, 'Value');
if currentClub == 2
    club = 'Driver';
elseif currentClub == 3
    club = '2 Wood';
elseif currentClub == 4
    club = '3 Wood';
elseif currentClub == 5
    club = '4 Wood';
elseif currentClub == 6
    club = '5 Wood';
elseif currentClub == 7
    club = '6 Wood';
elseif currentClub == 8
    club = '7 Wood';
elseif currentClub == 9
    club = '3 Iron';
elseif currentClub == 10
    club = '4 Iron';
elseif currentClub == 11
    club = '5 Iron';
elseif currentClub == 12
    club = '6 Iron';
elseif currentClub == 13
    club = '7 Iron';
elseif currentClub == 14
    club = '8 Iron';
elseif currentClub == 15
    club = '9 Iron';
elseif currentClub == 16
    club = 'Pitching Wedge';
elseif currentClub == 17
    club = 'Putter';
else
   club = 'none';
end

[vel spin theta0] = club_strike(club, 1);
swingAngle = theta0;

quiver3(handles.mainAxes,0,0,0,(1/2)*A*sind(B),-(1/2)*A*cosd(B),A*sind(swingAngle),'maxheadsize',.4,'linewidth',2);
xlim(handles.mainAxes, [0 400]);
ylim(handles.mainAxes, [-100 100]);
set(handles.mainAxes,'YDir','reverse');
zlim(handles.mainAxes, [0 100]);
box(handles.mainAxes, 'on');
hold(handles.mainAxes, 'on');

quiver(handles.axes2,0,0,-A*cosd(B),A*sind(B),'maxheadsize',.4,'linewidth',2);
xlim(handles.axes2,[-100, 100]);
ylim(handles.axes2,[0,400]);
hold(handles.axes2, 'on');

quiver(handles.axes3,0,0,(1/2)*A*sind(B)*cosd(swingAngle),(1/2)*A*sind(B)*sind(swingAngle),'maxheadsize',.4,'linewidth',2);
xlim(handles.axes3,[0, 400]);
ylim(handles.axes3,[0,100]);
hold(handles.axes3, 'on');
%-----------------------------------------

% --- Executes during object creation, after setting all properties.
function swingPowerSlider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to swingPowerSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in swing.
function swing_Callback(hObject, eventdata, handles)
% hObject    handle to swing (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global lastXYZ;
global numSwings;

currentClub = get(handles.golfClubs, 'Value');
swingPower = get(handles.swingPowerSlider, 'Value'); %From 0 to 1

if currentClub == 2
    club = 'Driver';
elseif currentClub == 3
    club = '2 Wood';
elseif currentClub == 4
    club = '3 Wood';
elseif currentClub == 5
    club = '4 Wood';
elseif currentClub == 6
    club = '5 Wood';
elseif currentClub == 7
    club = '6 Wood';
elseif currentClub == 8
    club = '7 Wood';
elseif currentClub == 9
    club = '3 Iron';
elseif currentClub == 10
    club = '4 Iron';
elseif currentClub == 11
    club = '5 Iron';
elseif currentClub == 12
    club = '6 Iron';
elseif currentClub == 13
    club = '7 Iron';
elseif currentClub == 14
    club = '8 Iron';
elseif currentClub == 15
    club = '9 Iron';
elseif currentClub == 16
    club = 'Pitching Wedge';
elseif currentClub == 17
    club = 'Putter';
else
   club = 'none';
end

[vel spin theta0] = club_strike(club, swingPower);

swingDirection = get(handles.swingDirectionSlider, 'Value');
swingDirection = swingDirection - 90;
windDirection = get(handles.windDirectionSlider, 'Value');
angle = windDirection - swingDirection;

windSpeedX = str2double(get(handles.windSpeed, 'String')) * cosd(angle);
windSpeedZ = str2double(get(handles.windSpeed, 'String')) * sind(angle);

Vrx = vel(1) - windSpeedX;
Vry = vel(2);
Vrz = vel(3) - windSpeedZ;
Wx = spin(1);
Wy = spin(2);
Wz = spin(3);

%FIRST SHOT
if numSwings == 0
    TSPAN = [0:.01:20];
    Y0 = [0, 0, 0, Vrx, Vry, Vrz, windSpeedX, 0, windSpeedZ, Wx, Wy, Wz];
    [TOUT,YOUT] = ode45(@eom,TSPAN,Y0);

    userAngle = get(handles.swingDirectionSlider, 'Value') - 90;
    
    X = YOUT(:,1)';
    Y = YOUT(:,2)';
    Z = YOUT(:,3)';
    
    R = [cosd(userAngle) -sind(userAngle)
        sind(userAngle) cosd(userAngle)];
        
    vector = [X; Z];
    
    transform = R * vector;
    
    X = transform(1,:);
    Z = transform(2,:);

    i = 1;
    Xabove = [];
    Yabove = [];
    Zabove = [];

    while Y(i) >= 0
        Xabove(i) = X(i);
        Yabove(i) = Y(i);
        Zabove(i) = Z(i);
        i = i + 1;
    end
    
%     lastXYZ = [Xabove(i-1), Yabove(i-1), Zabove(i-1)];
% 
%     lastX = lastXYZ(:,1);
%     lastY = lastXYZ(:,2);
%     lastZ = lastXYZ(:,3);
end

%-----------------------------------------


%2ND AND MORE SHOTS
% if numSwings > 1
%     lastX
%     lastY
%     lastZ
%     
%     TSPAN = [0:.01:20];
%     Y0 = [lastX, lastY, lastZ, Vx, Vy, Vz, windSpeed*cosd(windAngle), 0, windSpeed*sind(windAngle), Wx, Wy, Wz];
%     [TOUT,YOUT] = ode45(@eom,TSPAN,Y0);
% 
%     X = YOUT(:,1);
%     Y = YOUT(:,2);
%     Z = YOUT(:,3);
% 
%     i = 1;
%     Xabove = [];
%     Yabove = [];
%     Zabove = [];
% 
%     while Y(i) >= 0
%         Xabove(i) = X(i);
%         Yabove(i) = Y(i);
%         Zabove(i) = Z(i);
%         i = i + 1;
%     end 
%     
%     lastXYZ = [Xabove(i-1), Yabove(i-1), Zabove(i-1)]
% 
%     lastX = lastXYZ(:,1);
%     lastY = lastXYZ(:,2);
%     lastZ = lastXYZ(:,3);
% end
%-----------------------------------------

plot3(handles.mainAxes, Xabove, Zabove, Yabove);
xlim(handles.mainAxes, [0 400]);
ylim(handles.mainAxes, [-100 100]);
set(handles.mainAxes,'YDir','reverse');
zlim(handles.mainAxes, [0 100]);
box(handles.mainAxes, 'on');
hold(handles.mainAxes, 'on');

plot(handles.axes2, Zabove, Xabove);
xlim(handles.axes2,[-100,100]);
ylim(handles.axes2,[0,400]);
hold(handles.axes2, 'on');

plot(handles.axes3, Xabove, Yabove);
xlim(handles.axes3,[0,400]);
ylim(handles.axes3,[0,100]);
hold(handles.axes3, 'on');

% numSwings = numSwings + 1;

