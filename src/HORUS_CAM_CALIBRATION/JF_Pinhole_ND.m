function JF=JF_Pinhole_ND(u,v,xi,yi,zi,B)
%
% JF=JF_Pinhole_ND(u,v,xi,yi,zi,est,var)
% This function calculates Jacobian matrix of the residual vector F of the
% projection using the Pinhole model without distortion from P�rez (2009)
% and P�rez et al (2011). 
% Inputs:
%   u: coordinates u of the GCPs on the image (nx1 matrix).
%   v: coordinates v of the GCPs on the image (nx1 matrix).
%   xi: coordinates x of the GCPs in the space (nx1 matrix).
%   yi: coordinates y of the GCPs in the space (nx1 matrix).
%   zi: coordinates z of the GCPs in the space (nx1 matrix).
%   est: 1x10 vector with the values of the Pinhole model parameters 
%    B=[fDu fDv u0 v0 a b c tx ty tz]. [a b c] is the vector obtained
%    after aplying the Rodrigues formula to the rotation matrix.
%   var: 1x10 vector of 1s and 0s that is used to indicate with 0 which
%   parameters are assumed constant and with 1 which parameters are going
%   to be updated.
% Outputs:
%   JF: Jacobian of the residual vector of the Pinhole model.
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
a=B(5);
b=B(6);
c=B(7);
tx=B(8);
ty=B(9);
tz=B(10);

JF=zeros(2*size(u,1),10);
k=0;
for j=1:size(u,1)
    x=xi(j);
    y=yi(j);
    z=zi(j);
    uk=u(j);
    vk=v(j);
    
    k=k+1;
    JF(k,:)=[((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2) * (z * b - y * c) * sin(sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) + ((x * b ^ 2 - y * a * b - c * (z * a - x * c)) * cos(sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) + ((tx + x) * abs(a) ^ 2) + ((tx + x) * abs(b) ^ 2) + ((tx + x) * abs(c) ^ 2) - (x * b ^ 2) + (y * a * b) + (c * (z * a - x * c))) * sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) / ((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2) * (-b * x + y * a) * sin(sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) + ((z * b ^ 2 - x * c * a - y * c * b + z * a ^ 2) * cos(sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) + ((z + tz) * abs(a) ^ 2) + ((z + tz) * abs(b) ^ 2) + ((z + tz) * abs(c) ^ 2) - (z * b ^ 2) - (z * a ^ 2) + (x * c * a) + (y * c * b)) * sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) 0 ((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2) * (-b * x + y * a) * sin(sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) + ((z * b ^ 2 - y * c * b + a * (z * a - x * c)) * cos(sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) + ((z + tz) * abs(a) ^ 2) + ((z + tz) * abs(b) ^ 2) + ((z + tz) * abs(c) ^ 2) - (z * b ^ 2) + (y * c * b) - (a * (z * a - x * c))) * sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) / ((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2) * (-b * x + y * a) * sin(sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) + ((z * b ^ 2 - x * c * a - y * c * b + z * a ^ 2) * cos(sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) + ((z + tz) * abs(a) ^ 2) + ((z + tz) * abs(b) ^ 2) + ((z + tz) * abs(c) ^ 2) - (z * b ^ 2) - (z * a ^ 2) + (x * c * a) + (y * c * b)) * sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) 0 (0.2e1 * abs(a) * sign(a) * ((-x * u0 + z * fDu) * b + y * (-c * fDu + u0 * a)) * sin(sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) + (abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2) * y * u0 * sin(sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) + sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2)) * ((-x * u0 + z * fDu) * b + y * (-c * fDu + u0 * a)) * cos(sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) * abs(a) * sign(a) + ((-y * fDu * b + u0 * (z * a - x * c) + (-c * fDu + u0 * a) * z) * cos(sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) - ((z * u0 + x * fDu) * b ^ 2 - y * (c * u0 + a * fDu) * b + (-c * fDu + u0 * a) * (z * a - x * c)) * sin(sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) * ((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2) ^ (-0.1e1 / 0.2e1)) * abs(a) * sign(a) + 0.2e1 * ((tx + x) * fDu + u0 * (z + tz)) * abs(a) * sign(a) + (y * fDu * b) - (u0 * (z * a - x * c)) - ((-c * fDu + u0 * a) * z)) * sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2)) + (((z * u0 + x * fDu) * b ^ 2 - y * (c * u0 + a * fDu) * b + (-c * fDu + u0 * a) * (z * a - x * c)) * cos(sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) + (((tx + x) * fDu + u0 * (z + tz)) * abs(a) ^ 2) + (((tx + x) * fDu + u0 * (z + tz)) * abs(b) ^ 2) + (((tx + x) * fDu + u0 * (z + tz)) * abs(c) ^ 2) + ((-x * fDu - z * u0) * b ^ 2) + (y * (c * u0 + a * fDu) * b) - ((-c * fDu + u0 * a) * (z * a - x * c))) * ((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2) ^ (-0.1e1 / 0.2e1)) * abs(a) * sign(a)) / ((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2) * (-b * x + y * a) * sin(sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) + ((z * b ^ 2 - x * c * a - y * c * b + z * a ^ 2) * cos(sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) + ((z + tz) * abs(a) ^ 2) + ((z + tz) * abs(b) ^ 2) + ((z + tz) * abs(c) ^ 2) - (z * b ^ 2) - (z * a ^ 2) + (x * c * a) + (y * c * b)) * sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) - ((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2) * ((-x * u0 + z * fDu) * b + y * (-c * fDu + u0 * a)) * sin(sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) + (((z * u0 + x * fDu) * b ^ 2 - y * (c * u0 + a * fDu) * b + (-c * fDu + u0 * a) * (z * a - x * c)) * cos(sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) + (((tx + x) * fDu + u0 * (z + tz)) * abs(a) ^ 2) + (((tx + x) * fDu + u0 * (z + tz)) * abs(b) ^ 2) + (((tx + x) * fDu + u0 * (z + tz)) * abs(c) ^ 2) + ((-x * fDu - z * u0) * b ^ 2) + (y * (c * u0 + a * fDu) * b) - ((-c * fDu + u0 * a) * (z * a - x * c))) * sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) / ((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2) * (-b * x + y * a) * sin(sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) + ((z * b ^ 2 - x * c * a - y * c * b + z * a ^ 2) * cos(sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) + ((z + tz) * abs(a) ^ 2) + ((z + tz) * abs(b) ^ 2) + ((z + tz) * abs(c) ^ 2) - (z * b ^ 2) - (z * a ^ 2) + (x * c * a) + (y * c * b)) * sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) ^ 2 * (0.2e1 * abs(a) * sign(a) * (-b * x + y * a) * sin(sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) + (abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2) * y * sin(sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) + sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2)) * (-b * x + y * a) * cos(sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) * abs(a) * sign(a) + ((-x * c + 2 * z * a) * cos(sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) - (z * b ^ 2 - x * c * a - y * c * b + z * a ^ 2) * sin(sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) * ((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2) ^ (-0.1e1 / 0.2e1)) * abs(a) * sign(a) + 0.2e1 * (z + tz) * abs(a) * sign(a) - (2 * z * a) + (x * c)) * sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2)) + ((z * b ^ 2 - x * c * a - y * c * b + z * a ^ 2) * cos(sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) + ((z + tz) * abs(a) ^ 2) + ((z + tz) * abs(b) ^ 2) + ((z + tz) * abs(c) ^ 2) - (z * b ^ 2) - (z * a ^ 2) + (x * c * a) + (y * c * b)) * ((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2) ^ (-0.1e1 / 0.2e1)) * abs(a) * sign(a)) (0.2e1 * abs(b) * sign(b) * ((-x * u0 + z * fDu) * b + y * (-c * fDu + u0 * a)) * sin(sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) + (abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2) * (-x * u0 + z * fDu) * sin(sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) + sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2)) * ((-x * u0 + z * fDu) * b + y * (-c * fDu + u0 * a)) * cos(sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) * abs(b) * sign(b) + ((2 * (z * u0 + x * fDu) * b - y * (c * u0 + a * fDu)) * cos(sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) - ((z * u0 + x * fDu) * b ^ 2 - y * (c * u0 + a * fDu) * b + (-c * fDu + u0 * a) * (z * a - x * c)) * sin(sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) * ((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2) ^ (-0.1e1 / 0.2e1)) * abs(b) * sign(b) + 0.2e1 * ((tx + x) * fDu + u0 * (z + tz)) * abs(b) * sign(b) + (2 * (-x * fDu - z * u0) * b) + (y * (c * u0 + a * fDu))) * sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2)) + (((z * u0 + x * fDu) * b ^ 2 - y * (c * u0 + a * fDu) * b + (-c * fDu + u0 * a) * (z * a - x * c)) * cos(sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) + (((tx + x) * fDu + u0 * (z + tz)) * abs(a) ^ 2) + (((tx + x) * fDu + u0 * (z + tz)) * abs(b) ^ 2) + (((tx + x) * fDu + u0 * (z + tz)) * abs(c) ^ 2) + ((-x * fDu - z * u0) * b ^ 2) + (y * (c * u0 + a * fDu) * b) - ((-c * fDu + u0 * a) * (z * a - x * c))) * ((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2) ^ (-0.1e1 / 0.2e1)) * abs(b) * sign(b)) / ((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2) * (-b * x + y * a) * sin(sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) + ((z * b ^ 2 - x * c * a - y * c * b + z * a ^ 2) * cos(sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) + ((z + tz) * abs(a) ^ 2) + ((z + tz) * abs(b) ^ 2) + ((z + tz) * abs(c) ^ 2) - (z * b ^ 2) - (z * a ^ 2) + (x * c * a) + (y * c * b)) * sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) - ((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2) * ((-x * u0 + z * fDu) * b + y * (-c * fDu + u0 * a)) * sin(sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) + (((z * u0 + x * fDu) * b ^ 2 - y * (c * u0 + a * fDu) * b + (-c * fDu + u0 * a) * (z * a - x * c)) * cos(sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) + (((tx + x) * fDu + u0 * (z + tz)) * abs(a) ^ 2) + (((tx + x) * fDu + u0 * (z + tz)) * abs(b) ^ 2) + (((tx + x) * fDu + u0 * (z + tz)) * abs(c) ^ 2) + ((-x * fDu - z * u0) * b ^ 2) + (y * (c * u0 + a * fDu) * b) - ((-c * fDu + u0 * a) * (z * a - x * c))) * sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) / ((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2) * (-b * x + y * a) * sin(sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) + ((z * b ^ 2 - x * c * a - y * c * b + z * a ^ 2) * cos(sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) + ((z + tz) * abs(a) ^ 2) + ((z + tz) * abs(b) ^ 2) + ((z + tz) * abs(c) ^ 2) - (z * b ^ 2) - (z * a ^ 2) + (x * c * a) + (y * c * b)) * sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) ^ 2 * (0.2e1 * abs(b) * sign(b) * (-b * x + y * a) * sin(sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) - (abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2) * x * sin(sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) + sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2)) * (-b * x + y * a) * cos(sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) * abs(b) * sign(b) + ((2 * z * b - y * c) * cos(sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) - (z * b ^ 2 - x * c * a - y * c * b + z * a ^ 2) * sin(sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) * ((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2) ^ (-0.1e1 / 0.2e1)) * abs(b) * sign(b) + 0.2e1 * (z + tz) * abs(b) * sign(b) - (2 * z * b) + (y * c)) * sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2)) + ((z * b ^ 2 - x * c * a - y * c * b + z * a ^ 2) * cos(sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) + ((z + tz) * abs(a) ^ 2) + ((z + tz) * abs(b) ^ 2) + ((z + tz) * abs(c) ^ 2) - (z * b ^ 2) - (z * a ^ 2) + (x * c * a) + (y * c * b)) * ((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2) ^ (-0.1e1 / 0.2e1)) * abs(b) * sign(b)) (0.2e1 * abs(c) * sign(c) * ((-x * u0 + z * fDu) * b + y * (-c * fDu + u0 * a)) * sin(sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) - (abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2) * y * fDu * sin(sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) + sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2)) * ((-x * u0 + z * fDu) * b + y * (-c * fDu + u0 * a)) * cos(sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) * abs(c) * sign(c) + ((-y * u0 * b - fDu * (z * a - x * c) - (-c * fDu + u0 * a) * x) * cos(sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) - ((z * u0 + x * fDu) * b ^ 2 - y * (c * u0 + a * fDu) * b + (-c * fDu + u0 * a) * (z * a - x * c)) * sin(sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) * ((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2) ^ (-0.1e1 / 0.2e1)) * abs(c) * sign(c) + 0.2e1 * ((tx + x) * fDu + u0 * (z + tz)) * abs(c) * sign(c) + (y * u0 * b) + (fDu * (z * a - x * c)) + ((-c * fDu + u0 * a) * x)) * sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2)) + (((z * u0 + x * fDu) * b ^ 2 - y * (c * u0 + a * fDu) * b + (-c * fDu + u0 * a) * (z * a - x * c)) * cos(sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) + (((tx + x) * fDu + u0 * (z + tz)) * abs(a) ^ 2) + (((tx + x) * fDu + u0 * (z + tz)) * abs(b) ^ 2) + (((tx + x) * fDu + u0 * (z + tz)) * abs(c) ^ 2) + ((-x * fDu - z * u0) * b ^ 2) + (y * (c * u0 + a * fDu) * b) - ((-c * fDu + u0 * a) * (z * a - x * c))) * ((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2) ^ (-0.1e1 / 0.2e1)) * abs(c) * sign(c)) / ((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2) * (-b * x + y * a) * sin(sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) + ((z * b ^ 2 - x * c * a - y * c * b + z * a ^ 2) * cos(sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) + ((z + tz) * abs(a) ^ 2) + ((z + tz) * abs(b) ^ 2) + ((z + tz) * abs(c) ^ 2) - (z * b ^ 2) - (z * a ^ 2) + (x * c * a) + (y * c * b)) * sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) - ((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2) * ((-x * u0 + z * fDu) * b + y * (-c * fDu + u0 * a)) * sin(sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) + (((z * u0 + x * fDu) * b ^ 2 - y * (c * u0 + a * fDu) * b + (-c * fDu + u0 * a) * (z * a - x * c)) * cos(sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) + (((tx + x) * fDu + u0 * (z + tz)) * abs(a) ^ 2) + (((tx + x) * fDu + u0 * (z + tz)) * abs(b) ^ 2) + (((tx + x) * fDu + u0 * (z + tz)) * abs(c) ^ 2) + ((-x * fDu - z * u0) * b ^ 2) + (y * (c * u0 + a * fDu) * b) - ((-c * fDu + u0 * a) * (z * a - x * c))) * sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) / ((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2) * (-b * x + y * a) * sin(sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) + ((z * b ^ 2 - x * c * a - y * c * b + z * a ^ 2) * cos(sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) + ((z + tz) * abs(a) ^ 2) + ((z + tz) * abs(b) ^ 2) + ((z + tz) * abs(c) ^ 2) - (z * b ^ 2) - (z * a ^ 2) + (x * c * a) + (y * c * b)) * sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) ^ 2 * (0.2e1 * abs(c) * sign(c) * (-b * x + y * a) * sin(sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) + sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2)) * (-b * x + y * a) * cos(sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) * abs(c) * sign(c) + ((-x * a - y * b) * cos(sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) - (z * b ^ 2 - x * c * a - y * c * b + z * a ^ 2) * sin(sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) * ((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2) ^ (-0.1e1 / 0.2e1)) * abs(c) * sign(c) + 0.2e1 * (z + tz) * abs(c) * sign(c) + (x * a) + (y * b)) * sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2)) + ((z * b ^ 2 - x * c * a - y * c * b + z * a ^ 2) * cos(sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) + ((z + tz) * abs(a) ^ 2) + ((z + tz) * abs(b) ^ 2) + ((z + tz) * abs(c) ^ 2) - (z * b ^ 2) - (z * a ^ 2) + (x * c * a) + (y * c * b)) * ((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2) ^ (-0.1e1 / 0.2e1)) * abs(c) * sign(c)) (fDu * abs(a) ^ 2 + fDu * abs(b) ^ 2 + fDu * abs(c) ^ 2) * sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2)) / ((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2) * (-b * x + y * a) * sin(sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) + ((z * b ^ 2 - x * c * a - y * c * b + z * a ^ 2) * cos(sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) + ((z + tz) * abs(a) ^ 2) + ((z + tz) * abs(b) ^ 2) + ((z + tz) * abs(c) ^ 2) - (z * b ^ 2) - (z * a ^ 2) + (x * c * a) + (y * c * b)) * sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) 0 (u0 * abs(a) ^ 2 + u0 * abs(b) ^ 2 + u0 * abs(c) ^ 2) * sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2)) / ((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2) * (-b * x + y * a) * sin(sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) + ((z * b ^ 2 - x * c * a - y * c * b + z * a ^ 2) * cos(sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) + ((z + tz) * abs(a) ^ 2) + ((z + tz) * abs(b) ^ 2) + ((z + tz) * abs(c) ^ 2) - (z * b ^ 2) - (z * a ^ 2) + (x * c * a) + (y * c * b)) * sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) - ((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2) * ((-x * u0 + z * fDu) * b + y * (-c * fDu + u0 * a)) * sin(sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) + (((z * u0 + x * fDu) * b ^ 2 - y * (c * u0 + a * fDu) * b + (-c * fDu + u0 * a) * (z * a - x * c)) * cos(sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) + (((tx + x) * fDu + u0 * (z + tz)) * abs(a) ^ 2) + (((tx + x) * fDu + u0 * (z + tz)) * abs(b) ^ 2) + (((tx + x) * fDu + u0 * (z + tz)) * abs(c) ^ 2) + ((-x * fDu - z * u0) * b ^ 2) + (y * (c * u0 + a * fDu) * b) - ((-c * fDu + u0 * a) * (z * a - x * c))) * sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) / ((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2) * (-b * x + y * a) * sin(sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) + ((z * b ^ 2 - x * c * a - y * c * b + z * a ^ 2) * cos(sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) + ((z + tz) * abs(a) ^ 2) + ((z + tz) * abs(b) ^ 2) + ((z + tz) * abs(c) ^ 2) - (z * b ^ 2) - (z * a ^ 2) + (x * c * a) + (y * c * b)) * sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) ^ 2 * ((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2) ^ (0.3e1 / 0.2e1));];
    k=k+1;
    JF(k,:)=[0 ((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2) * (z * a - x * c) * sin(sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) - sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2)) * ((y * a ^ 2 - x * b * a - c * (z * b - y * c)) * cos(sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) + ((y + ty) * abs(a) ^ 2) + ((y + ty) * abs(b) ^ 2) + ((y + ty) * abs(c) ^ 2) - (y * a ^ 2) + (x * b * a) + (c * (z * b - y * c)))) / ((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2) * (-b * x + y * a) * sin(sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) + ((z * b ^ 2 - x * c * a - y * c * b + z * a ^ 2) * cos(sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) + ((z + tz) * abs(a) ^ 2) + ((z + tz) * abs(b) ^ 2) + ((z + tz) * abs(c) ^ 2) - (z * b ^ 2) - (z * a ^ 2) + (x * c * a) + (y * c * b)) * sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) 0 ((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2) * (-b * x + y * a) * sin(sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) - sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2)) * ((-z * a ^ 2 + x * c * a - b * (z * b - y * c)) * cos(sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) + ((-z - tz) * abs(a) ^ 2) + ((-z - tz) * abs(b) ^ 2) + ((-z - tz) * abs(c) ^ 2) + (z * a ^ 2) - (x * c * a) + (b * (z * b - y * c)))) / ((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2) * (-b * x + y * a) * sin(sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) + ((z * b ^ 2 - x * c * a - y * c * b + z * a ^ 2) * cos(sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) + ((z + tz) * abs(a) ^ 2) + ((z + tz) * abs(b) ^ 2) + ((z + tz) * abs(c) ^ 2) - (z * b ^ 2) - (z * a ^ 2) + (x * c * a) + (y * c * b)) * sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) (0.2e1 * abs(a) * sign(a) * ((z * fDv + y * v0) * a - x * (v0 * b + c * fDv)) * sin(sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) + (abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2) * (z * fDv + y * v0) * sin(sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) + sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2)) * ((z * fDv + y * v0) * a - x * (v0 * b + c * fDv)) * cos(sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) * abs(a) * sign(a) - ((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2) ^ (-0.1e1 / 0.2e1)) * (((y * fDv - z * v0) * a ^ 2 - x * (b * fDv - c * v0) * a - (v0 * b + c * fDv) * (z * b - y * c)) * cos(sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) + (((y + ty) * fDv - v0 * (z + tz)) * abs(a) ^ 2) + (((y + ty) * fDv - v0 * (z + tz)) * abs(b) ^ 2) + (((y + ty) * fDv - v0 * (z + tz)) * abs(c) ^ 2) + ((z * v0 - y * fDv) * a ^ 2) + (x * (b * fDv - c * v0) * a) + ((v0 * b + c * fDv) * (z * b - y * c))) * abs(a) * sign(a) - sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2)) * ((2 * (y * fDv - z * v0) * a - x * (b * fDv - c * v0)) * cos(sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) - ((y * fDv - z * v0) * a ^ 2 - x * (b * fDv - c * v0) * a - (v0 * b + c * fDv) * (z * b - y * c)) * sin(sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) * ((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2) ^ (-0.1e1 / 0.2e1)) * abs(a) * sign(a) + 0.2e1 * ((y + ty) * fDv - v0 * (z + tz)) * abs(a) * sign(a) + (2 * (z * v0 - y * fDv) * a) + (x * (b * fDv - c * v0)))) / ((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2) * (-b * x + y * a) * sin(sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) + ((z * b ^ 2 - x * c * a - y * c * b + z * a ^ 2) * cos(sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) + ((z + tz) * abs(a) ^ 2) + ((z + tz) * abs(b) ^ 2) + ((z + tz) * abs(c) ^ 2) - (z * b ^ 2) - (z * a ^ 2) + (x * c * a) + (y * c * b)) * sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) - ((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2) * ((z * fDv + y * v0) * a - x * (v0 * b + c * fDv)) * sin(sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) - sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2)) * (((y * fDv - z * v0) * a ^ 2 - x * (b * fDv - c * v0) * a - (v0 * b + c * fDv) * (z * b - y * c)) * cos(sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) + (((y + ty) * fDv - v0 * (z + tz)) * abs(a) ^ 2) + (((y + ty) * fDv - v0 * (z + tz)) * abs(b) ^ 2) + (((y + ty) * fDv - v0 * (z + tz)) * abs(c) ^ 2) + ((z * v0 - y * fDv) * a ^ 2) + (x * (b * fDv - c * v0) * a) + ((v0 * b + c * fDv) * (z * b - y * c)))) / ((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2) * (-b * x + y * a) * sin(sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) + ((z * b ^ 2 - x * c * a - y * c * b + z * a ^ 2) * cos(sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) + ((z + tz) * abs(a) ^ 2) + ((z + tz) * abs(b) ^ 2) + ((z + tz) * abs(c) ^ 2) - (z * b ^ 2) - (z * a ^ 2) + (x * c * a) + (y * c * b)) * sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) ^ 2 * (0.2e1 * abs(a) * sign(a) * (-b * x + y * a) * sin(sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) + (abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2) * y * sin(sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) + sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2)) * (-b * x + y * a) * cos(sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) * abs(a) * sign(a) + ((-x * c + 2 * z * a) * cos(sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) - (z * b ^ 2 - x * c * a - y * c * b + z * a ^ 2) * sin(sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) * ((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2) ^ (-0.1e1 / 0.2e1)) * abs(a) * sign(a) + 0.2e1 * (z + tz) * abs(a) * sign(a) - (2 * z * a) + (x * c)) * sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2)) + ((z * b ^ 2 - x * c * a - y * c * b + z * a ^ 2) * cos(sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) + ((z + tz) * abs(a) ^ 2) + ((z + tz) * abs(b) ^ 2) + ((z + tz) * abs(c) ^ 2) - (z * b ^ 2) - (z * a ^ 2) + (x * c * a) + (y * c * b)) * ((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2) ^ (-0.1e1 / 0.2e1)) * abs(a) * sign(a)) (0.2e1 * abs(b) * sign(b) * ((z * fDv + y * v0) * a - x * (v0 * b + c * fDv)) * sin(sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) - (abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2) * x * v0 * sin(sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) + sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2)) * ((z * fDv + y * v0) * a - x * (v0 * b + c * fDv)) * cos(sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) * abs(b) * sign(b) - ((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2) ^ (-0.1e1 / 0.2e1)) * (((y * fDv - z * v0) * a ^ 2 - x * (b * fDv - c * v0) * a - (v0 * b + c * fDv) * (z * b - y * c)) * cos(sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) + (((y + ty) * fDv - v0 * (z + tz)) * abs(a) ^ 2) + (((y + ty) * fDv - v0 * (z + tz)) * abs(b) ^ 2) + (((y + ty) * fDv - v0 * (z + tz)) * abs(c) ^ 2) + ((z * v0 - y * fDv) * a ^ 2) + (x * (b * fDv - c * v0) * a) + ((v0 * b + c * fDv) * (z * b - y * c))) * abs(b) * sign(b) - sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2)) * ((-x * fDv * a - v0 * (z * b - y * c) - (v0 * b + c * fDv) * z) * cos(sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) - ((y * fDv - z * v0) * a ^ 2 - x * (b * fDv - c * v0) * a - (v0 * b + c * fDv) * (z * b - y * c)) * sin(sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) * ((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2) ^ (-0.1e1 / 0.2e1)) * abs(b) * sign(b) + 0.2e1 * ((y + ty) * fDv - v0 * (z + tz)) * abs(b) * sign(b) + (x * fDv * a) + (v0 * (z * b - y * c)) + ((v0 * b + c * fDv) * z))) / ((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2) * (-b * x + y * a) * sin(sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) + ((z * b ^ 2 - x * c * a - y * c * b + z * a ^ 2) * cos(sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) + ((z + tz) * abs(a) ^ 2) + ((z + tz) * abs(b) ^ 2) + ((z + tz) * abs(c) ^ 2) - (z * b ^ 2) - (z * a ^ 2) + (x * c * a) + (y * c * b)) * sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) - ((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2) * ((z * fDv + y * v0) * a - x * (v0 * b + c * fDv)) * sin(sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) - sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2)) * (((y * fDv - z * v0) * a ^ 2 - x * (b * fDv - c * v0) * a - (v0 * b + c * fDv) * (z * b - y * c)) * cos(sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) + (((y + ty) * fDv - v0 * (z + tz)) * abs(a) ^ 2) + (((y + ty) * fDv - v0 * (z + tz)) * abs(b) ^ 2) + (((y + ty) * fDv - v0 * (z + tz)) * abs(c) ^ 2) + ((z * v0 - y * fDv) * a ^ 2) + (x * (b * fDv - c * v0) * a) + ((v0 * b + c * fDv) * (z * b - y * c)))) / ((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2) * (-b * x + y * a) * sin(sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) + ((z * b ^ 2 - x * c * a - y * c * b + z * a ^ 2) * cos(sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) + ((z + tz) * abs(a) ^ 2) + ((z + tz) * abs(b) ^ 2) + ((z + tz) * abs(c) ^ 2) - (z * b ^ 2) - (z * a ^ 2) + (x * c * a) + (y * c * b)) * sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) ^ 2 * (0.2e1 * abs(b) * sign(b) * (-b * x + y * a) * sin(sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) - (abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2) * x * sin(sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) + sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2)) * (-b * x + y * a) * cos(sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) * abs(b) * sign(b) + ((2 * z * b - y * c) * cos(sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) - (z * b ^ 2 - x * c * a - y * c * b + z * a ^ 2) * sin(sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) * ((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2) ^ (-0.1e1 / 0.2e1)) * abs(b) * sign(b) + 0.2e1 * (z + tz) * abs(b) * sign(b) - (2 * z * b) + (y * c)) * sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2)) + ((z * b ^ 2 - x * c * a - y * c * b + z * a ^ 2) * cos(sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) + ((z + tz) * abs(a) ^ 2) + ((z + tz) * abs(b) ^ 2) + ((z + tz) * abs(c) ^ 2) - (z * b ^ 2) - (z * a ^ 2) + (x * c * a) + (y * c * b)) * ((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2) ^ (-0.1e1 / 0.2e1)) * abs(b) * sign(b)) (0.2e1 * abs(c) * sign(c) * ((z * fDv + y * v0) * a - x * (v0 * b + c * fDv)) * sin(sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) - (abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2) * x * fDv * sin(sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) + sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2)) * ((z * fDv + y * v0) * a - x * (v0 * b + c * fDv)) * cos(sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) * abs(c) * sign(c) - ((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2) ^ (-0.1e1 / 0.2e1)) * (((y * fDv - z * v0) * a ^ 2 - x * (b * fDv - c * v0) * a - (v0 * b + c * fDv) * (z * b - y * c)) * cos(sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) + (((y + ty) * fDv - v0 * (z + tz)) * abs(a) ^ 2) + (((y + ty) * fDv - v0 * (z + tz)) * abs(b) ^ 2) + (((y + ty) * fDv - v0 * (z + tz)) * abs(c) ^ 2) + ((z * v0 - y * fDv) * a ^ 2) + (x * (b * fDv - c * v0) * a) + ((v0 * b + c * fDv) * (z * b - y * c))) * abs(c) * sign(c) - sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2)) * ((x * v0 * a - fDv * (z * b - y * c) + (v0 * b + c * fDv) * y) * cos(sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) - ((y * fDv - z * v0) * a ^ 2 - x * (b * fDv - c * v0) * a - (v0 * b + c * fDv) * (z * b - y * c)) * sin(sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) * ((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2) ^ (-0.1e1 / 0.2e1)) * abs(c) * sign(c) + 0.2e1 * ((y + ty) * fDv - v0 * (z + tz)) * abs(c) * sign(c) - (x * v0 * a) + (fDv * (z * b - y * c)) - ((v0 * b + c * fDv) * y))) / ((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2) * (-b * x + y * a) * sin(sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) + ((z * b ^ 2 - x * c * a - y * c * b + z * a ^ 2) * cos(sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) + ((z + tz) * abs(a) ^ 2) + ((z + tz) * abs(b) ^ 2) + ((z + tz) * abs(c) ^ 2) - (z * b ^ 2) - (z * a ^ 2) + (x * c * a) + (y * c * b)) * sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) - ((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2) * ((z * fDv + y * v0) * a - x * (v0 * b + c * fDv)) * sin(sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) - sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2)) * (((y * fDv - z * v0) * a ^ 2 - x * (b * fDv - c * v0) * a - (v0 * b + c * fDv) * (z * b - y * c)) * cos(sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) + (((y + ty) * fDv - v0 * (z + tz)) * abs(a) ^ 2) + (((y + ty) * fDv - v0 * (z + tz)) * abs(b) ^ 2) + (((y + ty) * fDv - v0 * (z + tz)) * abs(c) ^ 2) + ((z * v0 - y * fDv) * a ^ 2) + (x * (b * fDv - c * v0) * a) + ((v0 * b + c * fDv) * (z * b - y * c)))) / ((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2) * (-b * x + y * a) * sin(sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) + ((z * b ^ 2 - x * c * a - y * c * b + z * a ^ 2) * cos(sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) + ((z + tz) * abs(a) ^ 2) + ((z + tz) * abs(b) ^ 2) + ((z + tz) * abs(c) ^ 2) - (z * b ^ 2) - (z * a ^ 2) + (x * c * a) + (y * c * b)) * sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) ^ 2 * (0.2e1 * abs(c) * sign(c) * (-b * x + y * a) * sin(sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) + sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2)) * (-b * x + y * a) * cos(sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) * abs(c) * sign(c) + ((-x * a - y * b) * cos(sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) - (z * b ^ 2 - x * c * a - y * c * b + z * a ^ 2) * sin(sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) * ((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2) ^ (-0.1e1 / 0.2e1)) * abs(c) * sign(c) + 0.2e1 * (z + tz) * abs(c) * sign(c) + (x * a) + (y * b)) * sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2)) + ((z * b ^ 2 - x * c * a - y * c * b + z * a ^ 2) * cos(sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) + ((z + tz) * abs(a) ^ 2) + ((z + tz) * abs(b) ^ 2) + ((z + tz) * abs(c) ^ 2) - (z * b ^ 2) - (z * a ^ 2) + (x * c * a) + (y * c * b)) * ((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2) ^ (-0.1e1 / 0.2e1)) * abs(c) * sign(c)) 0 -sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2)) * (fDv * abs(a) ^ 2 + fDv * abs(b) ^ 2 + fDv * abs(c) ^ 2) / ((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2) * (-b * x + y * a) * sin(sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) + ((z * b ^ 2 - x * c * a - y * c * b + z * a ^ 2) * cos(sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) + ((z + tz) * abs(a) ^ 2) + ((z + tz) * abs(b) ^ 2) + ((z + tz) * abs(c) ^ 2) - (z * b ^ 2) - (z * a ^ 2) + (x * c * a) + (y * c * b)) * sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) -sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2)) * (-v0 * abs(a) ^ 2 - v0 * abs(b) ^ 2 - v0 * abs(c) ^ 2) / ((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2) * (-b * x + y * a) * sin(sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) + ((z * b ^ 2 - x * c * a - y * c * b + z * a ^ 2) * cos(sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) + ((z + tz) * abs(a) ^ 2) + ((z + tz) * abs(b) ^ 2) + ((z + tz) * abs(c) ^ 2) - (z * b ^ 2) - (z * a ^ 2) + (x * c * a) + (y * c * b)) * sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) - ((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2) * ((z * fDv + y * v0) * a - x * (v0 * b + c * fDv)) * sin(sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) - sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2)) * (((y * fDv - z * v0) * a ^ 2 - x * (b * fDv - c * v0) * a - (v0 * b + c * fDv) * (z * b - y * c)) * cos(sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) + (((y + ty) * fDv - v0 * (z + tz)) * abs(a) ^ 2) + (((y + ty) * fDv - v0 * (z + tz)) * abs(b) ^ 2) + (((y + ty) * fDv - v0 * (z + tz)) * abs(c) ^ 2) + ((z * v0 - y * fDv) * a ^ 2) + (x * (b * fDv - c * v0) * a) + ((v0 * b + c * fDv) * (z * b - y * c)))) / ((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2) * (-b * x + y * a) * sin(sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) + ((z * b ^ 2 - x * c * a - y * c * b + z * a ^ 2) * cos(sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) + ((z + tz) * abs(a) ^ 2) + ((z + tz) * abs(b) ^ 2) + ((z + tz) * abs(c) ^ 2) - (z * b ^ 2) - (z * a ^ 2) + (x * c * a) + (y * c * b)) * sqrt((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2))) ^ 2 * ((abs(a) ^ 2 + abs(b) ^ 2 + abs(c) ^ 2) ^ (0.3e1 / 0.2e1));];
end
