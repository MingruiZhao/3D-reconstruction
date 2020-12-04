v=[ 1 , 1 , -1, -1; % x (3D scene points )
    -1 , -1, -1 , -1; % y
    3 , 1 , 3 , 1; % z
    1 , 1 , 1 , 1]; % w
% v=[ 1 , 1 , -1, -1; % x (3D scene points )
% 1 , -1, 1 , -1 ; % y
% 1 , 1 , 1 , 1 ; % z
% 1 , 1 , 1 , 1 ] ; % w
P=[ 2 , 0 , 0 , 0 ;
0 , 2 , 0 , 0 ; % } projection matrix
0 , 0 , 1 , 0 ] ;
T=[ 1 , 0 , 0 , -1; % x (3D scene points )
    0 , 1 , 0 , 0; % y
    0 , 0 , 1 , 0; % z
    0 , 0 , 0 , 1]; % w
R=[ cos(pi/90) , 0 , sin(pi/90) , 10; % x (3D scene points )
    0 , 1 , 0 , 10; % y
    -sin(pi/90) , 0 ,  cos(pi/90) , 10; % z
    0 , 0 , 0 , 1]; % w
% R=[ 2 , 0 , 0 , 0; % x (3D scene points )
%     0 , 2 , 0, 0; % y
%    0 , 0 , 2 , 0; % z
%     0 , 0 , 0 , 1]; % w
% i=P*(T)*v % project into homogeneous co?ord
% i=i (1:2 ,:)./ i (3 ,:) % convert to Cartesian co?ord
% scatter ( i (1 ,:) , i (2 ,:)) % behold : a square !
% hold on
i2=P*(T*R)*v % project into homogeneous co?ord
i2=i2 (1:2 ,:)./ i2 (3 ,:) % convert to Cartesian co?ord
scatter ( i2 (1 ,:) , i2 (2 ,:)) % behold : a square !
