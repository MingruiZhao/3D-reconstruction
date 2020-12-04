rng(0,'twister');
rvals = 2*rand(10000,1)-1;
elevation = asin(rvals);
azimuth = 2*pi*rand(10000,1);
radii = 3*(rand(10000,1).^(1/3));
[x,y,z] = sph2cart(azimuth,elevation,radii);
% z = z+ 30;
% figure
% scatter3(x,y,z,'.')
% axis equal


one = ones([10000,1]);
vt = [x,y,z,one];
v = vt.';
f = 1;
hold on
err = [];
base = 10;
e = 10
for f=1:40
P=[ f , 0 , 0 , 0 ;
    0 , f , 0 , 0 ; % } projection matrix
    0 , 0 , 1 , 0 ] ;
T=[ 1 , 0 , 0 , 0; % x 
    0 , 1 , 0 , 0; % y
    0 , 0 , 1 , -30; % z
    0 , 0 , 0 , 1]; % w
i = P*T*v;
M1 = P*T;
i = i (1:2 ,:)./ i (3 ,:); % convert to Cartesian co?ord
% figure
% c = linspace(1,1,length(x));
% scatter ( i (1 ,:) , i (2 ,:),c) % behold : a square !
P2=[ f , 0 , 0 , 0 ;
    0 , f , 0 , 0 ; % } projection matrix
    0 , 0 , 1 , 0 ] ;
T=[ 1 , 0 , 0 , base; % x 
    0 , 1 , 0 , -30; % y
    0 , 0 , 1 , -30; % z
    0 , 0 , 0 , 1]; % w
R=[ cos(pi/90) , 0 , sin(pi/90) , 0; % x (3D scene points )
    0 , 1 , 0 , 0; % y
    -sin(pi/90) , 0 ,  cos(pi/90) , 0; % z
    0 , 0 , 0 , 1]; % w
M = P2*R*T;
i2 = P2*R*T*v; 
i2=i2 (1:2 ,:)./ i2 (3 ,:); % convert to Cartesian co?ord
% for iter = 1:e
%     a = 0.01;
%     b = 0;
%     xi = a.*randn([2 1])+b;
%     i(:,randi([1,10000],1,1)) = xi;
% end
% for iter = 1:e
%     a = 0.01;
%     b = -0.33;
%     xi2 = a.*randn([1 1])+b;
%     tmp = randi([1,10000],1,1);
%     i2(1,tmp) = xi2;
%     a = 0.01;
%     b = 0;
%     xi2 = a.*randn([1 1])+b;
%     i2(2,tmp) = xi2;
% end




% figure
% c = linspace(1,1,length(x));
% scatter ( i2 (1 ,:) , i2 (2 ,:),c) % behold : a square !
% figure
% c = linspace(1,1,length(x));
% scatter ( i (1 ,:) , i (2 ,:),c) % behold : a square !
worldPoints = triangulate(i.',i2.',M1.',M.');
% figure
% scatter3(worldPoints(:,1),worldPoints(:,2),worldPoints(:,3),'.');
% axis equal
fin = 0;
for a = 1:10000
    fin = fin + abs(sum(worldPoints(a,1) - x(a,1))) + abs(sum(worldPoints(a,2) - y(a,1))) + abs(sum(worldPoints(a,3) - z(a,1)));
end
err(f) = fin;
end