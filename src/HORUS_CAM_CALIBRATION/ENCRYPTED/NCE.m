function E=NCE(u,v,x,y,z,B)
%
% E=NCE(u,v,x,y,z,B)
% Normalized Calibration Error calculation. This function uses either the
% ideal Pinhole model without distortion or the model with radial
% distortion as presented in P�rez (2009) and P�rez et al (2011).
% Inputs:
%   u: coordinates u of the GCPs on the image (nx1 matrix).
%   v: coordinates v of the GCPs on the image (nx1 matrix).
%   x: coordinates x of the GCPs in the space (nx1 matrix).
%   y: coordinates y of the GCPs in the space (nx1 matrix).
%   z: coordinates z of the GCPs in the space (nx1 matrix).
%   B: Parameter vector. If distortion is used corresponds to [fDu fDv u0
%   v0 k1 k2 a b c tx ty tz] or to [fDu fDv u0 v0 a b c tx ty tz] when no
%   distortion is used.
% Outputs:
%  E: NCE of the Pinhole model.
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
