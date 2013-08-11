function [R t]=Rt_estimate_linear(H,K)
%
% [R t]=Rt_estimate_linear(H,K)
% This function estimates the rotation matrix and the translation vector
% t=-RC using the Pinhole model matrix or the DLT given by H and an
% estimate of the matrix of intrinsec parameters K. The procedure is the
% one presented in P�rez (2009), using SVD to obtain an orthonormal matrix
% R with determinant 1.
% Inputs:
%  H: Model matrix or DLT of the camera.
%  K: Intrinsec parameters matrix
% Outputs:
%  R: Rotation matrix
%  t: Translation matrix
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
%

alpha=1/norm(inv(K)*H(:,1),2);
r1=alpha*inv(K)*H(:,1);
r2=alpha*inv(K)*H(:,2);
r3=cross(r1,r2);
if size(H,2)==3
    t=alpha*inv(K)*H(:,3);
else
    t=alpha*inv(K)*H(:,4);
end

R1=[r1 r2 r3];
[U,S,V] = svd(R1);
R=U*V';