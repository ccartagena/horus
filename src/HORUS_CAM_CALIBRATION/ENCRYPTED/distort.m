function [u v]=distort(K,D,uv)
%
% [u v]=distort(K,D,uv)
% This funtion distorts the coordinates of a group of points on the image,
% using the radial distortion parameters and the intrinsec parameters of
% the camera as presented in P�rez (2009).
% Inputs:
%   K: Intrinsec parameter matrix as presented in P�rez et al (2011).
%   D: Radial distortion parameters D=[k1 k2] as presented in P�rez et al
%   (2011).
%   uv: nx2 matrix with the distortion-free coordinates of the points in
%   the image [u(1) v(1);u(2) v(2);...;u(n) v(n)]
% Outputs:
%   u: distorted u coordinates of the points.
%   v: distorted v coordiantes of the points.
%
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
