function [ Wxy,Uxy,Ixy,Kxy,Exy ] = FittingFcn( x,y,pdata,varargin )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
%--空间曲面拟合函数,输入参数至少三个(x,y,paramenter,phi)
%W0x 走向主断面距走向左边界的水平距离为x处的下沉值
%parameter{
%     Prediction 预测参数结构体
%     Prediction = ('q','b','b1','b2','b3','tb','tb1','tb2','s1','s2'
%                   ,'s3','s4','theta')
%     Coal 煤层参数结构体
%     Coal = ('m','alpha','H1','H2','D1','D3')
%   }  
% parameter = struct('q',{},'b',{},'b1',{},'b2',{},'tb',{},'tb1',{},'tb2',...
%     {},'s1',{},'s2',{},'s3',{},'s4',{},'theta',{},'m',{},'alpha',{},'H1',...
%     {},'H2',{},'D1',{},'D3',{});
if isa(pdata,'struct')
        parameter = pdata;
else
        parray=pdata;
        parameter.q = parray(1,1);
        parameter.b = parray(2);
        parameter.b1 = parray(3);
        parameter.b2 = parray(4);
        parameter.tb = parray(5);
        parameter.tb1 = parray(6);
        parameter.tb2 = parray(7);
        parameter.s1 = parray(8);
        parameter.s2 = parray(9);
        parameter.s3 = parray(10);
        parameter.s4 = parray(11);
        parameter.theta = parray(12);
        parameter.m = parray(13);
        parameter.alpha = parray(14);
        parameter.H1 = parray(15);
        parameter.H2 = parray(16);
        parameter.D1 = parray(17);
        parameter.D3 = parray(18);
end      
if nargin == 4
    phi = varargin{1};
else
    phi = 0;
end

W0 = parameter .m * parameter .q * cos(parameter .alpha*pi/180);   %W0为地表最大下沉值，m为采厚
                                                %q为下沉系数，alpha为煤层倾角
H = (parameter .H1 +parameter .H1)/2;   %H为走向主断面开采平均深度
r = H/parameter .tb;    %r为主要影响半径
W0x = (W0/2) * (erf((sqrt(pi)/r) * (x-parameter .s3)) - erf((sqrt(pi)/r)...
    *(x-parameter .D3+parameter .s4)));   %走向主断面下沉拟合函数模型

r1 = parameter .H1/parameter .tb1;   %r1为下山方向主要影响半径
r2 = parameter .H2/parameter .tb2;   %r2为上山方向主要影响半径
W0y = (W0/2) * ( erf( sqrt(pi)*(y+parameter .H1*cot(parameter .theta*pi/180)-parameter .s1...
    *cos(parameter .alpha*pi/180))/r1 ) - erf(sqrt(pi)*(y-(parameter .D1-parameter .s2)...
    *cos(parameter .alpha*pi/180))/r2+parameter .H2*cot(parameter .theta*pi/180)) );

%--下沉拟合函数模型
Wxy = (W0x * W0y)/W0;

%--走向主断面水平移动拟合
U0x = parameter.b*W0*( exp( -pi*(x-parameter.s3).^2/r.^2 )-...
    exp(-pi*(x-parameter.D3+parameter.s4).^2/r.^2) );   %b为走向方向水平移动系数
%--倾向主断面水平移动拟合模型

U1y = parameter.b1*W0*exp( -pi*( y+parameter.H1*cot(parameter.theta*pi/180)...
    -parameter.s1*cos(parameter.alpha*pi/180) )/r1.^2 );
U2y = parameter.b2*W0*exp( -pi*( y-( parameter.D1-parameter.s2 )*cos(parameter.alpha*pi/180)+parameter.H2...
    *cot(parameter.theta*pi/180) )/r2.^2 );
U0y = (U1y -U2y)+W0y * cot(parameter.theta*pi/180);
%--水平移动函数模型
Uxy = 1/W0*(U0x*W0y*cos(phi*pi/180)+U0y*W0x*sin(phi*pi/180));

%有限开采走向主断面上移动和变形预计
i0x=(W0/r)*exp(-pi*(x-parameter.s3).^2/r.^2)-(W0/r)*exp(-pi*(x-parameter.D3...
    +parameter.s4).^2/r.^2); 
k0x=(-2*pi*W0/r.^3)*(x-parameter.s3)*exp(-pi*(x-parameter.s3).^2/r.^2)-(-2*...
    pi*W0/r.^3)*(x-parameter.D3+parameter.s4)*exp(-pi*(x-parameter.D3+...
    parameter.s4).^2/r.^2);  
e0x=(-2*pi*parameter.b*W0/r.^2)*(x-parameter.s3)*exp(-pi*(x-parameter.s3).^2/r.^2)-...
    (-2*pi*parameter.b*W0/r.^2)*(x-parameter.D3+parameter.s4)*exp(-pi*(x-parameter.D3...
    +parameter.s4).^2/r^.2);  
%有限开采倾向主断面上移和预计变形 
i0y=(W0/r1)*exp(-pi*(y+parameter.H1*cot(parameter.theta*pi/180)-parameter.s1...
    *cos(parameter.alpha*pi/180)).^2/r1.^2)-(W0/r2)*exp(-pi*(y-(parameter.D1-parameter.s2)*cos(...
    parameter.alpha*pi/180)+parameter.H2*cot(parameter.theta*pi/180)).^2/r2.^2);  
k0y=(-2*pi*W0/r1.^3)*(y+parameter.H1*cot(parameter.theta*pi/180)-parameter.s1...
    *cos(parameter.alpha*pi/180))*exp(-pi*(y+parameter.H1*cot(parameter.theta...
    *pi/180)-parameter.s1*cos(parameter.alpha*pi/180)).^2/r1.^2)-(-2*pi*W0/r2...
    .^3)*(y-(parameter.D1-parameter.s2)*cos(parameter.alpha*pi/180)+parameter.H2*cot(parameter.theta...
    *pi/180))*exp(-pi*(y-(parameter.D1-parameter.s2)*cos(parameter.alpha*pi/180)+parameter.H2*cot(...
    parameter.theta*pi/180)).^2/r2.^2);
e0y=(-2*pi*parameter.b1*W0/r1.^2)*(y+parameter.H1*cot(parameter.theta*pi/180)-parameter.s1...
    *cos(parameter.alpha*pi/180))*exp(-pi*(y+parameter.H1*cot(parameter.theta...
    *pi/180)-parameter.s1*cos(parameter.alpha*pi/180)).^2/r1.^2)+(W0/r1)*exp(...
    -pi*(y+parameter.H1*cot(parameter.theta*pi/180)-parameter.s1*cos(...
    parameter.alpha*pi/180)).^2/r1.^2)*cot(parameter.theta*pi/180)-(-2*pi*parameter.b2...
    *W0/r2.^2)*(y-(parameter.D1-parameter.s2)*cos(parameter.alpha*pi/180)+parameter.H2*cot(...
    parameter.theta*pi/180))*exp(-pi*(y-(parameter.D1-parameter.s2)*cos(parameter.alpha*pi/180)+...
    parameter.H2*cot(parameter.theta*pi/180)).^2/r2.^2)-(W0/r2)*exp(-pi*(y-...
    (parameter.D1-parameter.s2)*cos(parameter.alpha*pi/180)+parameter.H2*cot(parameter.theta*pi...
    /180)).^2/r2.^2)*cot(parameter.theta*pi/180);
%沿phi方向的倾斜ixy；
Ixy=(1/W0)*i0x*W0y*cos(phi*pi/180)+i0y*W0x*sin(phi*pi/180);
%沿phi方向的曲率kxy
Kxy=(1/W0)*(k0x*W0y*(cos(phi*pi/180))^2+k0y*W0x*(sin(phi*pi/180))^2+i0x*i0y...
    *sin(2*pi*phi/180));
%沿phi方向的水平变形exy
Exy=(1/W0)* (e0x*W0y*(cos(phi*pi/180))^2+e0y*W0x*(sin(phi*pi/180))^2+(U0x...
    *i0y+U0y*i0x)*sin(phi*pi/180)*cos(phi*pi/180));
 
end

