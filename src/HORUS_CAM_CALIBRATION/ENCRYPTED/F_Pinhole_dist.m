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
