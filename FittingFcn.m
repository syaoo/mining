function [ Wxy,Uxy,Ixy,Kxy,Exy ] = FittingFcn( x,y,pdata,varargin )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
%--�ռ�������Ϻ���,���������������(x,y,paramenter,phi)
%W0x �����������������߽��ˮƽ����Ϊx�����³�ֵ
%parameter{
%     Prediction Ԥ������ṹ��
%     Prediction = ('q','b','b1','b2','b3','tb','tb1','tb2','s1','s2'
%                   ,'s3','s4','theta')
%     Coal ú������ṹ��
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

W0 = parameter .m * parameter .q * cos(parameter .alpha*pi/180);   %W0Ϊ�ر�����³�ֵ��mΪ�ɺ�
                                                %qΪ�³�ϵ����alphaΪú�����
H = (parameter .H1 +parameter .H1)/2;   %HΪ���������濪��ƽ�����
r = H/parameter .tb;    %rΪ��ҪӰ��뾶
W0x = (W0/2) * (erf((sqrt(pi)/r) * (x-parameter .s3)) - erf((sqrt(pi)/r)...
    *(x-parameter .D3+parameter .s4)));   %�����������³���Ϻ���ģ��

r1 = parameter .H1/parameter .tb1;   %r1Ϊ��ɽ������ҪӰ��뾶
r2 = parameter .H2/parameter .tb2;   %r2Ϊ��ɽ������ҪӰ��뾶
W0y = (W0/2) * ( erf( sqrt(pi)*(y+parameter .H1*cot(parameter .theta*pi/180)-parameter .s1...
    *cos(parameter .alpha*pi/180))/r1 ) - erf(sqrt(pi)*(y-(parameter .D1-parameter .s2)...
    *cos(parameter .alpha*pi/180))/r2+parameter .H2*cot(parameter .theta*pi/180)) );

%--�³���Ϻ���ģ��
Wxy = (W0x * W0y)/W0;

%--����������ˮƽ�ƶ����
U0x = parameter.b*W0*( exp( -pi*(x-parameter.s3).^2/r.^2 )-...
    exp(-pi*(x-parameter.D3+parameter.s4).^2/r.^2) );   %bΪ������ˮƽ�ƶ�ϵ��
%--����������ˮƽ�ƶ����ģ��

U1y = parameter.b1*W0*exp( -pi*( y+parameter.H1*cot(parameter.theta*pi/180)...
    -parameter.s1*cos(parameter.alpha*pi/180) )/r1.^2 );
U2y = parameter.b2*W0*exp( -pi*( y-( parameter.D1-parameter.s2 )*cos(parameter.alpha*pi/180)+parameter.H2...
    *cot(parameter.theta*pi/180) )/r2.^2 );
U0y = (U1y -U2y)+W0y * cot(parameter.theta*pi/180);
%--ˮƽ�ƶ�����ģ��
Uxy = 1/W0*(U0x*W0y*cos(phi*pi/180)+U0y*W0x*sin(phi*pi/180));

%���޿����������������ƶ��ͱ���Ԥ��
i0x=(W0/r)*exp(-pi*(x-parameter.s3).^2/r.^2)-(W0/r)*exp(-pi*(x-parameter.D3...
    +parameter.s4).^2/r.^2); 
k0x=(-2*pi*W0/r.^3)*(x-parameter.s3)*exp(-pi*(x-parameter.s3).^2/r.^2)-(-2*...
    pi*W0/r.^3)*(x-parameter.D3+parameter.s4)*exp(-pi*(x-parameter.D3+...
    parameter.s4).^2/r.^2);  
e0x=(-2*pi*parameter.b*W0/r.^2)*(x-parameter.s3)*exp(-pi*(x-parameter.s3).^2/r.^2)-...
    (-2*pi*parameter.b*W0/r.^2)*(x-parameter.D3+parameter.s4)*exp(-pi*(x-parameter.D3...
    +parameter.s4).^2/r^.2);  
%���޿����������������ƺ�Ԥ�Ʊ��� 
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
%��phi�������бixy��
Ixy=(1/W0)*i0x*W0y*cos(phi*pi/180)+i0y*W0x*sin(phi*pi/180);
%��phi���������kxy
Kxy=(1/W0)*(k0x*W0y*(cos(phi*pi/180))^2+k0y*W0x*(sin(phi*pi/180))^2+i0x*i0y...
    *sin(2*pi*phi/180));
%��phi�����ˮƽ����exy
Exy=(1/W0)* (e0x*W0y*(cos(phi*pi/180))^2+e0y*W0x*(sin(phi*pi/180))^2+(U0x...
    *i0y+U0y*i0x)*sin(phi*pi/180)*cos(phi*pi/180));
 
end

