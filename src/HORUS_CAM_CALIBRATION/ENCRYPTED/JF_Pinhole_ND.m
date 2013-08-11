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
