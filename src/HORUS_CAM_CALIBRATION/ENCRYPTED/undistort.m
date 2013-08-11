function [u v]=undistort(K,D,uv)
%
% [u v]=undistort(K,D,uv)
% This function corrects the radial distortion of ONE point in the image
% using the Pinhole model. The method is the one presented in P�rez (2009).
% Inputs:
%  K: Intrinsec parameters matrix
%  D: Radial distortion parameters: [k1 k2]
%  uv: 1x2 matrix with the distorted coordinates of the point [u v].
% Outputs:
%  u: distortion free u coordinate
%  v: distortion free v coordinate
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
