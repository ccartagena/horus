function [H]=DLT_non_homogeneus(u,v,x,y,z)
%
% [H]=DLT_non_homogeneus(u,v,x,y,z)
% This function calculates the non homogeneous DLT as presented in P�rez
% (2009) and P�rez et al (2011). It needs at least 6 GCPs to calculate the
% non homogeneous solution of the DLT using an approach based on Singular
% Value Decomposition as presented in P�rez (2009). The DLT, H satisfies
% the condition h34=1.
% Inputs:
%   u: coordinates u of the GCPs on the image (nx1 matrix).
%   v: coordinates v of the GCPs on the image (nx1 matrix).
%   x: coordinates x of the GCPs in the space (nx1 matrix).
%   y: coordinates y of the GCPs in the space (nx1 matrix).
%   z: coordinates z of the GCPs in the space (nx1 matrix).
% Outputs:
%   H: DLT of the camera, satisfying the condition h31^2+h32^2+h33^2=1.
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
