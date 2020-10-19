function [Vel,Spin,theta0]=club_strike(club,fraction)
%CLUB_STRIKE Ball kinematics for a club strike
%      Vel is a three-dimensional velocity vector
%      Spin is a three-dimensional spin vector
%
%      club is a string indicating the chosen club, and can take on
%         the following values:
%          'D' -- driver
%          '2W' to '7W' -- woods from 2 to 7
%          '3I' to '9I' -- irons from 3 to 9
%          'PW' -- pitching wedge
%      fraction is the fraction of a full swing.  1 indicates full
%        swing; .5 is a half swing; 1.5 is a super swing (not realistic,
%        but might be fun to play with).
%
%   Data is based on interpolation of PGA tour averages
%   available from Trackman Golf:
%   http://notnlp.com/wp-content/uploads/2014/03/pga_thumb.png
%
switch club
    case 'Driver'
      v0=167;
      theta0=11;
      omega0 = 2700;
    case '2 Wood'
      v0 = 163;
      theta0 = 10;
      omega0 = 3100;
    case '3 Wood'
      v0=158;
      theta0=9;
      omega0 = 3600;
    case '4 Wood'
      v0=155;
      theta0=9;
      omega0 = 3900;
    case '5 Wood'
      v0=152;
      theta0=9;
      omega0=4300;
    case '6 Wood'
      v0=149;
      theta0=10;
      omega0=4400;
    case '7 Wood'
      v0=146;
      theta0=10;
      omega0=4500;
    case '3 Iron'
      v0=142;
      theta0=10;
      omega0=4600;
    case '4 Iron'
      v0=137;
      theta0=11;
      omega0=4800;
    case '5 Iron'
      v0=132;
      theta0=12;
      omega0=5400;
    case '6 Iron'
      v0=127;
      theta0=14;
      omega0=6200;
    case '7 Iron'
      v0=120;
      theta0=16;
      omega0=7100;
    case '8 Iron'
      v0=115;
      theta0=18;
      omega0=8000;
    case '9 Iron'
      v0=109;
      theta0=20;
      omega0=8600;
    case 'Pitching Wedge'
      v0=102;
      theta0=24;
      omega0=9300;
    case 'Putter'
        v0=70;
        theta0=0.5;
        omega0=8000;
    otherwise
      v0=0;
      theta0 = 0;
      omega0 = 0;
end
v = v0*fraction*.44704; % convert to m/s from mph
omega = omega0*fraction*.10472; % convert from rpm to rad/s
theta = theta0*(pi/180);
Spin(1)= 0; %No rotation about x axis
Spin(2)= 0; %No hook or slice spin
Spin(3)= omega; %All spin about horizontal axis
Vel(1) = v*cos(theta); %X coordinate
Vel(2) = v*sin(theta); %Y coordinate
Vel(3) = 0; % No pull or push velocity
end

