function In=undistort_Image(K,D,name,idg,ids)
%
% In=undistort_Image(K,D,name,idg,ids)
% This function uses the method presented in P�rez (2009) to correct the
% distortion in an image using the Pinhole model with radial distortion.
% Inputs:
%  K: Intrinsec parameter matrix
%  D: Radial distortion parameters: [k1 k2]
%  name: Complete path of the image as character array. For example
%  'C:\MyDB\images\MyImage.jpg'
%  idg: control parameter used to identify with 1 when the plots should be
%  plotted and 0 when no plots are required.
%  ids: control parameter used to identify with 1 when the result should be
%  saved and 0 when no saving is required.
% Outputs:
%  In: Distortion-free image.
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
