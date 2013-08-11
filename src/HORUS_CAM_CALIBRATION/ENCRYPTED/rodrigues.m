function [y]=rodrigues(x)
%
% y=rodrigues(x) 
% This function uses the Rodrigues formula (P�rez (2009), chapter 2.1.5) to
% find the rotation matriz asociated to the vector x or the vector y
% asociated with the rotation matrix x. The vector asociated with the
% rotation matrix is parallel to the rotation axis and its norm is equal to
% the rotation angle in mod(2pi).
% Inputs:
%   x: 3x3 Matrix or 3x1 vector
% Outputs:
%   y: Vector parallel to the rotation axis (3x1) or rotation matrix (3x3)
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
