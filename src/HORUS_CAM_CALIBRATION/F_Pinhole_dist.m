function F=F_Pinhole_dist(u,v,xi,yi,zi,B)
%
% F=F_Pinhole_dist(u,v,xi,yi,zi,B)
% This function calculates the residual vector F of the projection using
% the Pinhole model with distortion from P�rez (2009) and P�rez et al
% (2011). The spatial GCPs coordinates are used to project the GCP on the
% image using the parameters given in B and then the image coordiantes
% obtained are compared with the ones given.
% Inputs:
%   u: coordinates u of the GCPs on the image (nx1 matrix).
%   v: coordinates v of the GCPs on the image (nx1 matrix).
%   xi: coordinates x of the GCPs in the space (nx1 matrix).
%   yi: coordinates y of the GCPs in the space (nx1 matrix).
%   zi: coordinates z of the GCPs in the space (nx1 matrix).
%   B: 1x12 vector with the values of the Pinhole model parameters 
%    B=[fDu fDv u0 v0 k1 k2 a b c tx ty tz]. [a b c] is the vector obtained
%    after aplying the Rodrigues formula to the rotation matrix.
% Outputs:
%   F: vector of order 2nx1 with the residuals of the projection using the
%   parameters given in B.
%
%   Developed by Juan camilo P�rez Mu�oz (2011) for the HORUS project.
%
% References:
%   P�REZ, J.  M.Sc. Thesis, Optimizaci�n No Lineal y Calibraci�n de
%   C�maras Fotogr�ficas. Facultad de Ciencias, Universidad Nacional de
%   Colombia, Sede Medell�n. (2009). Available online in
%   http://www.bdigital.unal.edu.co/3516/
%   P�REZ, J., ORTIZ, C., OSORIO, A., MEJ�A, C., MEDINA, R. "CAMERA
%   CALIBRATION USING THE LEVENBERG-MARQUADT METHOD AND ITS ENVIROMENTAL
%   MONITORING APLICATIONS". (2011) To be published.


fDu=B(1);
fDv=B(2);
u0=B(3);
v0=B(4);
k1=B(5);
k2=B(6);
a=B(7);
b=B(8);
c=B(9);
tx=B(10);
ty=B(11);
tz=B(12);



F=zeros(2*size(u,1),1);
k=0;
for j=1:size(u,1)
    x=xi(j);
    y=yi(j);
    z=zi(j);
    uk=u(j);
    vk=v(j);
    
    k=k+1;
    F(k)=fDu*(((0.1e1+(0.1e1-cos(sqrt((abs(a)^2+abs(b)^2+abs(c)^2))))/(abs(a)^2+abs(b)^2+abs(c)^2)*(-c^2-b^2))*x+(-sin(sqrt((abs(a)^2+abs(b)^2+abs(c)^2)))*((abs(a)^2+abs(b)^2+abs(c)^2)^(-0.1e1/0.2e1))*c+(0.1e1-cos(sqrt((abs(a)^2+abs(b)^2+abs(c)^2))))/(abs(a)^2+abs(b)^2+abs(c)^2)*b*a)*y+(sin(sqrt((abs(a)^2+abs(b)^2+abs(c)^2)))*((abs(a)^2+abs(b)^2+abs(c)^2)^(-0.1e1/0.2e1))*b+(0.1e1-cos(sqrt((abs(a)^2+abs(b)^2+abs(c)^2))))/(abs(a)^2+abs(b)^2+abs(c)^2)*c*a)*z+tx)/((-sin(sqrt((abs(a)^2+abs(b)^2+abs(c)^2)))*((abs(a)^2+abs(b)^2+abs(c)^2)^(-0.1e1/0.2e1))*b+(0.1e1-cos(sqrt((abs(a)^2+abs(b)^2+abs(c)^2))))/(abs(a)^2+abs(b)^2+abs(c)^2)*c*a)*x+(sin(sqrt((abs(a)^2+abs(b)^2+abs(c)^2)))*((abs(a)^2+abs(b)^2+abs(c)^2)^(-0.1e1/0.2e1))*a+(0.1e1-cos(sqrt((abs(a)^2+abs(b)^2+abs(c)^2))))/(abs(a)^2+abs(b)^2+abs(c)^2)*c*b)*y+(0.1e1+(0.1e1-cos(sqrt((abs(a)^2+abs(b)^2+abs(c)^2))))/(abs(a)^2+abs(b)^2+abs(c)^2)*(-b^2-a^2))*z+tz)+(k1*(((0.1e1+(0.1e1-cos(sqrt((abs(a)^2+abs(b)^2+abs(c)^2))))/(abs(a)^2+abs(b)^2+abs(c)^2)*(-c^2-b^2))*x+(-sin(sqrt((abs(a)^2+abs(b)^2+abs(c)^2)))*((abs(a)^2+abs(b)^2+abs(c)^2)^(-0.1e1/0.2e1))*c+(0.1e1-cos(sqrt((abs(a)^2+abs(b)^2+abs(c)^2))))/(abs(a)^2+abs(b)^2+abs(c)^2)*b*a)*y+(sin(sqrt((abs(a)^2+abs(b)^2+abs(c)^2)))*((abs(a)^2+abs(b)^2+abs(c)^2)^(-0.1e1/0.2e1))*b+(0.1e1-cos(sqrt((abs(a)^2+abs(b)^2+abs(c)^2))))/(abs(a)^2+abs(b)^2+abs(c)^2)*c*a)*z+tx)^2/((-sin(sqrt((abs(a)^2+abs(b)^2+abs(c)^2)))*((abs(a)^2+abs(b)^2+abs(c)^2)^(-0.1e1/0.2e1))*b+(0.1e1-cos(sqrt((abs(a)^2+abs(b)^2+abs(c)^2))))/(abs(a)^2+abs(b)^2+abs(c)^2)*c*a)*x+(sin(sqrt((abs(a)^2+abs(b)^2+abs(c)^2)))*((abs(a)^2+abs(b)^2+abs(c)^2)^(-0.1e1/0.2e1))*a+(0.1e1-cos(sqrt((abs(a)^2+abs(b)^2+abs(c)^2))))/(abs(a)^2+abs(b)^2+abs(c)^2)*c*b)*y+(0.1e1+(0.1e1-cos(sqrt((abs(a)^2+abs(b)^2+abs(c)^2))))/(abs(a)^2+abs(b)^2+abs(c)^2)*(-b^2-a^2))*z+tz)^2+((sin(sqrt((abs(a)^2+abs(b)^2+abs(c)^2)))*((abs(a)^2+abs(b)^2+abs(c)^2)^(-0.1e1/0.2e1))*c+(0.1e1-cos(sqrt((abs(a)^2+abs(b)^2+abs(c)^2))))/(abs(a)^2+abs(b)^2+abs(c)^2)*b*a)*x+(0.1e1+(0.1e1-cos(sqrt((abs(a)^2+abs(b)^2+abs(c)^2))))/(abs(a)^2+abs(b)^2+abs(c)^2)*(-c^2-a^2))*y+(-sin(sqrt((abs(a)^2+abs(b)^2+abs(c)^2)))*((abs(a)^2+abs(b)^2+abs(c)^2)^(-0.1e1/0.2e1))*a+(0.1e1-cos(sqrt((abs(a)^2+abs(b)^2+abs(c)^2))))/(abs(a)^2+abs(b)^2+abs(c)^2)*c*b)*z+ty)^2/((-sin(sqrt((abs(a)^2+abs(b)^2+abs(c)^2)))*((abs(a)^2+abs(b)^2+abs(c)^2)^(-0.1e1/0.2e1))*b+(0.1e1-cos(sqrt((abs(a)^2+abs(b)^2+abs(c)^2))))/(abs(a)^2+abs(b)^2+abs(c)^2)*c*a)*x+(sin(sqrt((abs(a)^2+abs(b)^2+abs(c)^2)))*((abs(a)^2+abs(b)^2+abs(c)^2)^(-0.1e1/0.2e1))*a+(0.1e1-cos(sqrt((abs(a)^2+abs(b)^2+abs(c)^2))))/(abs(a)^2+abs(b)^2+abs(c)^2)*c*b)*y+(0.1e1+(0.1e1-cos(sqrt((abs(a)^2+abs(b)^2+abs(c)^2))))/(abs(a)^2+abs(b)^2+abs(c)^2)*(-b^2-a^2))*z+tz)^2)+k2*(((0.1e1+(0.1e1-cos(sqrt((abs(a)^2+abs(b)^2+abs(c)^2))))/(abs(a)^2+abs(b)^2+abs(c)^2)*(-c^2-b^2))*x+(-sin(sqrt((abs(a)^2+abs(b)^2+abs(c)^2)))*((abs(a)^2+abs(b)^2+abs(c)^2)^(-0.1e1/0.2e1))*c+(0.1e1-cos(sqrt((abs(a)^2+abs(b)^2+abs(c)^2))))/(abs(a)^2+abs(b)^2+abs(c)^2)*b*a)*y+(sin(sqrt((abs(a)^2+abs(b)^2+abs(c)^2)))*((abs(a)^2+abs(b)^2+abs(c)^2)^(-0.1e1/0.2e1))*b+(0.1e1-cos(sqrt((abs(a)^2+abs(b)^2+abs(c)^2))))/(abs(a)^2+abs(b)^2+abs(c)^2)*c*a)*z+tx)^2/((-sin(sqrt((abs(a)^2+abs(b)^2+abs(c)^2)))*((abs(a)^2+abs(b)^2+abs(c)^2)^(-0.1e1/0.2e1))*b+(0.1e1-cos(sqrt((abs(a)^2+abs(b)^2+abs(c)^2))))/(abs(a)^2+abs(b)^2+abs(c)^2)*c*a)*x+(sin(sqrt((abs(a)^2+abs(b)^2+abs(c)^2)))*((abs(a)^2+abs(b)^2+abs(c)^2)^(-0.1e1/0.2e1))*a+(0.1e1-cos(sqrt((abs(a)^2+abs(b)^2+abs(c)^2))))/(abs(a)^2+abs(b)^2+abs(c)^2)*c*b)*y+(0.1e1+(0.1e1-cos(sqrt((abs(a)^2+abs(b)^2+abs(c)^2))))/(abs(a)^2+abs(b)^2+abs(c)^2)*(-b^2-a^2))*z+tz)^2+((sin(sqrt((abs(a)^2+abs(b)^2+abs(c)^2)))*((abs(a)^2+abs(b)^2+abs(c)^2)^(-0.1e1/0.2e1))*c+(0.1e1-cos(sqrt((abs(a)^2+abs(b)^2+abs(c)^2))))/(abs(a)^2+abs(b)^2+abs(c)^2)*b*a)*x+(0.1e1+(0.1e1-cos(sqrt((abs(a)^2+abs(b)^2+abs(c)^2))))/(abs(a)^2+abs(b)^2+abs(c)^2)*(-c^2-a^2))*y+(-sin(sqrt((abs(a)^2+abs(b)^2+abs(c)^2)))*((abs(a)^2+abs(b)^2+abs(c)^2)^(-0.1e1/0.2e1))*a+(0.1e1-cos(sqrt((abs(a)^2+abs(b)^2+abs(c)^2))))/(abs(a)^2+abs(b)^2+abs(c)^2)*c*b)*z+ty)^2/((-sin(sqrt((abs(a)^2+abs(b)^2+abs(c)^2)))*((abs(a)^2+abs(b)^2+abs(c)^2)^(-0.1e1/0.2e1))*b+(0.1e1-cos(sqrt((abs(a)^2+abs(b)^2+abs(c)^2))))/(abs(a)^2+abs(b)^2+abs(c)^2)*c*a)*x+(sin(sqrt((abs(a)^2+abs(b)^2+abs(c)^2)))*((abs(a)^2+abs(b)^2+abs(c)^2)^(-0.1e1/0.2e1))*a+(0.1e1-cos(sqrt((abs(a)^2+abs(b)^2+abs(c)^2))))/(abs(a)^2+abs(b)^2+abs(c)^2)*c*b)*y+(0.1e1+(0.1e1-cos(sqrt((abs(a)^2+abs(b)^2+abs(c)^2))))/(abs(a)^2+abs(b)^2+abs(c)^2)*(-b^2-a^2))*z+tz)^2)^2)*((0.1e1+(0.1e1-cos(sqrt((abs(a)^2+abs(b)^2+abs(c)^2))))/(abs(a)^2+abs(b)^2+abs(c)^2)*(-c^2-b^2))*x+(-sin(sqrt((abs(a)^2+abs(b)^2+abs(c)^2)))*((abs(a)^2+abs(b)^2+abs(c)^2)^(-0.1e1/0.2e1))*c+(0.1e1-cos(sqrt((abs(a)^2+abs(b)^2+abs(c)^2))))/(abs(a)^2+abs(b)^2+abs(c)^2)*b*a)*y+(sin(sqrt((abs(a)^2+abs(b)^2+abs(c)^2)))*((abs(a)^2+abs(b)^2+abs(c)^2)^(-0.1e1/0.2e1))*b+(0.1e1-cos(sqrt((abs(a)^2+abs(b)^2+abs(c)^2))))/(abs(a)^2+abs(b)^2+abs(c)^2)*c*a)*z+tx)/((-sin(sqrt((abs(a)^2+abs(b)^2+abs(c)^2)))*((abs(a)^2+abs(b)^2+abs(c)^2)^(-0.1e1/0.2e1))*b+(0.1e1-cos(sqrt((abs(a)^2+abs(b)^2+abs(c)^2))))/(abs(a)^2+abs(b)^2+abs(c)^2)*c*a)*x+(sin(sqrt((abs(a)^2+abs(b)^2+abs(c)^2)))*((abs(a)^2+abs(b)^2+abs(c)^2)^(-0.1e1/0.2e1))*a+(0.1e1-cos(sqrt((abs(a)^2+abs(b)^2+abs(c)^2))))/(abs(a)^2+abs(b)^2+abs(c)^2)*c*b)*y+(0.1e1+(0.1e1-cos(sqrt((abs(a)^2+abs(b)^2+abs(c)^2))))/(abs(a)^2+abs(b)^2+abs(c)^2)*(-b^2-a^2))*z+tz))+u0-uk;
    k=k+1;
    F(k)=-fDv*(((sin(sqrt((abs(a)^2+abs(b)^2+abs(c)^2)))*((abs(a)^2+abs(b)^2+abs(c)^2)^(-0.1e1/0.2e1))*c+(0.1e1-cos(sqrt((abs(a)^2+abs(b)^2+abs(c)^2))))/(abs(a)^2+abs(b)^2+abs(c)^2)*b*a)*x+(0.1e1+(0.1e1-cos(sqrt((abs(a)^2+abs(b)^2+abs(c)^2))))/(abs(a)^2+abs(b)^2+abs(c)^2)*(-c^2-a^2))*y+(-sin(sqrt((abs(a)^2+abs(b)^2+abs(c)^2)))*((abs(a)^2+abs(b)^2+abs(c)^2)^(-0.1e1/0.2e1))*a+(0.1e1-cos(sqrt((abs(a)^2+abs(b)^2+abs(c)^2))))/(abs(a)^2+abs(b)^2+abs(c)^2)*c*b)*z+ty)/((-sin(sqrt((abs(a)^2+abs(b)^2+abs(c)^2)))*((abs(a)^2+abs(b)^2+abs(c)^2)^(-0.1e1/0.2e1))*b+(0.1e1-cos(sqrt((abs(a)^2+abs(b)^2+abs(c)^2))))/(abs(a)^2+abs(b)^2+abs(c)^2)*c*a)*x+(sin(sqrt((abs(a)^2+abs(b)^2+abs(c)^2)))*((abs(a)^2+abs(b)^2+abs(c)^2)^(-0.1e1/0.2e1))*a+(0.1e1-cos(sqrt((abs(a)^2+abs(b)^2+abs(c)^2))))/(abs(a)^2+abs(b)^2+abs(c)^2)*c*b)*y+(0.1e1+(0.1e1-cos(sqrt((abs(a)^2+abs(b)^2+abs(c)^2))))/(abs(a)^2+abs(b)^2+abs(c)^2)*(-b^2-a^2))*z+tz)+(k1*(((0.1e1+(0.1e1-cos(sqrt((abs(a)^2+abs(b)^2+abs(c)^2))))/(abs(a)^2+abs(b)^2+abs(c)^2)*(-c^2-b^2))*x+(-sin(sqrt((abs(a)^2+abs(b)^2+abs(c)^2)))*((abs(a)^2+abs(b)^2+abs(c)^2)^(-0.1e1/0.2e1))*c+(0.1e1-cos(sqrt((abs(a)^2+abs(b)^2+abs(c)^2))))/(abs(a)^2+abs(b)^2+abs(c)^2)*b*a)*y+(sin(sqrt((abs(a)^2+abs(b)^2+abs(c)^2)))*((abs(a)^2+abs(b)^2+abs(c)^2)^(-0.1e1/0.2e1))*b+(0.1e1-cos(sqrt((abs(a)^2+abs(b)^2+abs(c)^2))))/(abs(a)^2+abs(b)^2+abs(c)^2)*c*a)*z+tx)^2/((-sin(sqrt((abs(a)^2+abs(b)^2+abs(c)^2)))*((abs(a)^2+abs(b)^2+abs(c)^2)^(-0.1e1/0.2e1))*b+(0.1e1-cos(sqrt((abs(a)^2+abs(b)^2+abs(c)^2))))/(abs(a)^2+abs(b)^2+abs(c)^2)*c*a)*x+(sin(sqrt((abs(a)^2+abs(b)^2+abs(c)^2)))*((abs(a)^2+abs(b)^2+abs(c)^2)^(-0.1e1/0.2e1))*a+(0.1e1-cos(sqrt((abs(a)^2+abs(b)^2+abs(c)^2))))/(abs(a)^2+abs(b)^2+abs(c)^2)*c*b)*y+(0.1e1+(0.1e1-cos(sqrt((abs(a)^2+abs(b)^2+abs(c)^2))))/(abs(a)^2+abs(b)^2+abs(c)^2)*(-b^2-a^2))*z+tz)^2+((sin(sqrt((abs(a)^2+abs(b)^2+abs(c)^2)))*((abs(a)^2+abs(b)^2+abs(c)^2)^(-0.1e1/0.2e1))*c+(0.1e1-cos(sqrt((abs(a)^2+abs(b)^2+abs(c)^2))))/(abs(a)^2+abs(b)^2+abs(c)^2)*b*a)*x+(0.1e1+(0.1e1-cos(sqrt((abs(a)^2+abs(b)^2+abs(c)^2))))/(abs(a)^2+abs(b)^2+abs(c)^2)*(-c^2-a^2))*y+(-sin(sqrt((abs(a)^2+abs(b)^2+abs(c)^2)))*((abs(a)^2+abs(b)^2+abs(c)^2)^(-0.1e1/0.2e1))*a+(0.1e1-cos(sqrt((abs(a)^2+abs(b)^2+abs(c)^2))))/(abs(a)^2+abs(b)^2+abs(c)^2)*c*b)*z+ty)^2/((-sin(sqrt((abs(a)^2+abs(b)^2+abs(c)^2)))*((abs(a)^2+abs(b)^2+abs(c)^2)^(-0.1e1/0.2e1))*b+(0.1e1-cos(sqrt((abs(a)^2+abs(b)^2+abs(c)^2))))/(abs(a)^2+abs(b)^2+abs(c)^2)*c*a)*x+(sin(sqrt((abs(a)^2+abs(b)^2+abs(c)^2)))*((abs(a)^2+abs(b)^2+abs(c)^2)^(-0.1e1/0.2e1))*a+(0.1e1-cos(sqrt((abs(a)^2+abs(b)^2+abs(c)^2))))/(abs(a)^2+abs(b)^2+abs(c)^2)*c*b)*y+(0.1e1+(0.1e1-cos(sqrt((abs(a)^2+abs(b)^2+abs(c)^2))))/(abs(a)^2+abs(b)^2+abs(c)^2)*(-b^2-a^2))*z+tz)^2)+k2*(((0.1e1+(0.1e1-cos(sqrt((abs(a)^2+abs(b)^2+abs(c)^2))))/(abs(a)^2+abs(b)^2+abs(c)^2)*(-c^2-b^2))*x+(-sin(sqrt((abs(a)^2+abs(b)^2+abs(c)^2)))*((abs(a)^2+abs(b)^2+abs(c)^2)^(-0.1e1/0.2e1))*c+(0.1e1-cos(sqrt((abs(a)^2+abs(b)^2+abs(c)^2))))/(abs(a)^2+abs(b)^2+abs(c)^2)*b*a)*y+(sin(sqrt((abs(a)^2+abs(b)^2+abs(c)^2)))*((abs(a)^2+abs(b)^2+abs(c)^2)^(-0.1e1/0.2e1))*b+(0.1e1-cos(sqrt((abs(a)^2+abs(b)^2+abs(c)^2))))/(abs(a)^2+abs(b)^2+abs(c)^2)*c*a)*z+tx)^2/((-sin(sqrt((abs(a)^2+abs(b)^2+abs(c)^2)))*((abs(a)^2+abs(b)^2+abs(c)^2)^(-0.1e1/0.2e1))*b+(0.1e1-cos(sqrt((abs(a)^2+abs(b)^2+abs(c)^2))))/(abs(a)^2+abs(b)^2+abs(c)^2)*c*a)*x+(sin(sqrt((abs(a)^2+abs(b)^2+abs(c)^2)))*((abs(a)^2+abs(b)^2+abs(c)^2)^(-0.1e1/0.2e1))*a+(0.1e1-cos(sqrt((abs(a)^2+abs(b)^2+abs(c)^2))))/(abs(a)^2+abs(b)^2+abs(c)^2)*c*b)*y+(0.1e1+(0.1e1-cos(sqrt((abs(a)^2+abs(b)^2+abs(c)^2))))/(abs(a)^2+abs(b)^2+abs(c)^2)*(-b^2-a^2))*z+tz)^2+((sin(sqrt((abs(a)^2+abs(b)^2+abs(c)^2)))*((abs(a)^2+abs(b)^2+abs(c)^2)^(-0.1e1/0.2e1))*c+(0.1e1-cos(sqrt((abs(a)^2+abs(b)^2+abs(c)^2))))/(abs(a)^2+abs(b)^2+abs(c)^2)*b*a)*x+(0.1e1+(0.1e1-cos(sqrt((abs(a)^2+abs(b)^2+abs(c)^2))))/(abs(a)^2+abs(b)^2+abs(c)^2)*(-c^2-a^2))*y+(-sin(sqrt((abs(a)^2+abs(b)^2+abs(c)^2)))*((abs(a)^2+abs(b)^2+abs(c)^2)^(-0.1e1/0.2e1))*a+(0.1e1-cos(sqrt((abs(a)^2+abs(b)^2+abs(c)^2))))/(abs(a)^2+abs(b)^2+abs(c)^2)*c*b)*z+ty)^2/((-sin(sqrt((abs(a)^2+abs(b)^2+abs(c)^2)))*((abs(a)^2+abs(b)^2+abs(c)^2)^(-0.1e1/0.2e1))*b+(0.1e1-cos(sqrt((abs(a)^2+abs(b)^2+abs(c)^2))))/(abs(a)^2+abs(b)^2+abs(c)^2)*c*a)*x+(sin(sqrt((abs(a)^2+abs(b)^2+abs(c)^2)))*((abs(a)^2+abs(b)^2+abs(c)^2)^(-0.1e1/0.2e1))*a+(0.1e1-cos(sqrt((abs(a)^2+abs(b)^2+abs(c)^2))))/(abs(a)^2+abs(b)^2+abs(c)^2)*c*b)*y+(0.1e1+(0.1e1-cos(sqrt((abs(a)^2+abs(b)^2+abs(c)^2))))/(abs(a)^2+abs(b)^2+abs(c)^2)*(-b^2-a^2))*z+tz)^2)^2)*((sin(sqrt((abs(a)^2+abs(b)^2+abs(c)^2)))*((abs(a)^2+abs(b)^2+abs(c)^2)^(-0.1e1/0.2e1))*c+(0.1e1-cos(sqrt((abs(a)^2+abs(b)^2+abs(c)^2))))/(abs(a)^2+abs(b)^2+abs(c)^2)*b*a)*x+(0.1e1+(0.1e1-cos(sqrt((abs(a)^2+abs(b)^2+abs(c)^2))))/(abs(a)^2+abs(b)^2+abs(c)^2)*(-c^2-a^2))*y+(-sin(sqrt((abs(a)^2+abs(b)^2+abs(c)^2)))*((abs(a)^2+abs(b)^2+abs(c)^2)^(-0.1e1/0.2e1))*a+(0.1e1-cos(sqrt((abs(a)^2+abs(b)^2+abs(c)^2))))/(abs(a)^2+abs(b)^2+abs(c)^2)*c*b)*z+ty)/((-sin(sqrt((abs(a)^2+abs(b)^2+abs(c)^2)))*((abs(a)^2+abs(b)^2+abs(c)^2)^(-0.1e1/0.2e1))*b+(0.1e1-cos(sqrt((abs(a)^2+abs(b)^2+abs(c)^2))))/(abs(a)^2+abs(b)^2+abs(c)^2)*c*a)*x+(sin(sqrt((abs(a)^2+abs(b)^2+abs(c)^2)))*((abs(a)^2+abs(b)^2+abs(c)^2)^(-0.1e1/0.2e1))*a+(0.1e1-cos(sqrt((abs(a)^2+abs(b)^2+abs(c)^2))))/(abs(a)^2+abs(b)^2+abs(c)^2)*c*b)*y+(0.1e1+(0.1e1-cos(sqrt((abs(a)^2+abs(b)^2+abs(c)^2))))/(abs(a)^2+abs(b)^2+abs(c)^2)*(-b^2-a^2))*z+tz))+v0-vk;
end

