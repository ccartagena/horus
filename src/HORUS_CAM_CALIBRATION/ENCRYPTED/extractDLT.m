function [K,R,t,P]=extractDLT(H,u,v,x,y,z)
%
% [K,R,t,P]=extractDLT(H)
% This function estimates the distortion-free Pinhole parameters using the
% DLT of the camera H. The algorthim to estimates the parameters is the one
% presented in P�rez (2009).
% Inputs:
%   H: DLT obtained with the GPPs given by u,v,x,y,z (3x4 matrix).
%   u: coordinates u of the GCPs on the image (nx1 matrix).
%   v: coordinates v of the GCPs on the image (nx1 matrix).
%   x: coordinates x of the GCPs in the space (nx1 matrix).
%   y: coordinates y of the GCPs in the space (nx1 matrix).
%   z: coordinates z of the GCPs in the space (nx1 matrix).
% Outputs:
%   K: Intrinsic parameter matrix (3x3 matrix).
%   R: Rotation matrix of the camera model.
%   t: Translation vector of the optical center t=-RC, where C is the
%   position vector of the optical center in the reference frame. Using K,
%   R and t is posible to approximate H as H=K[R t].
%   P: Structure with all the parameters obtained as presented in P�rez
%   (2009) fDu, fDv, u0, v0, tao, sigma, phi, tx, ty, tz.
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
