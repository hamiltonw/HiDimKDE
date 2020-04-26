function [vkde,vkmax,mker] = HidKDEgaussSM(mdata,mxgrid,h) 
% HIgh Dimensional KDE, with GAUSSian kernel
%     A direct implemetation of a Gaussian kernel density estimate
%     Intended for high dimensions,
%     Spherically symmetric kernel, with bandwidth h
%     Evaluated at a grid of points in mgrid
%     Also allows output of kernel functions
%     and of maxima (over mxgrid) of kernel functions for diagnostic use
%     Caution:   creates d x n x ng 3-d array, 
%                which could be bigger than workspace
%     Caution:   requires n > 1 and ng > 1   (but d = 1 is OK)
%   Steve Marron's matlab function
% Inputs:
%     mdata     - d x n matrix of multivariate input data
%                       (each col is a data vector)
%                       d = dimension of each data vector
%                       n = number of data vectors
%
%     mxgrid    - d x ng matrix of multivariate locations to evaluate KDE
%                       Often use points a long a single line to give
%                       a slice of the KDE surface
%
%     h         - bandwidth, a positive integer
%
% Outputs:
%     vkde      - ng x 1 vector of KDE values , at points in columns of mxgrid
%
%     vkmax     - 1 x n vector of max (over mxgrid) kernel heights
%
%     mker      - ng x n matrix of kernel heights, 
%                         at points in columns of mxgrid
%

%    Copyright (c) J. S. Marron 2020


d = size(mdata,1) ;
n = size(mdata,2) ;
ng = size(mxgrid,2) ;


%  Check Inputs
%
if size(mxgrid) ~= ng ;
  disp('!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!') ;
  disp('!!!   Error from HidKDEgauss.m:          !!!') ; 
  disp('!!!   Dimension of mxgrid invalid        !!!') ;
  disp('!!!   Stopping Execution                 !!!') ; 
  disp('!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!') ;
  return ;
end ;

if n <= 1 ;
  disp('!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!') ;
  disp('!!!   Error from HidKDEgauss.m:          !!!') ; 
  disp('!!!   Requires n > 1                     !!!') ;
  disp('!!!   Stopping Execution                 !!!') ; 
  disp('!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!') ;
  return ;
end ;

if ng <= 1 ;
  disp('!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!') ;
  disp('!!!   Error from HidKDEgauss.m:          !!!') ; 
  disp('!!!   Requires ng > 1                     !!!') ;
  disp('!!!   Stopping Execution                 !!!') ; 
  disp('!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!') ;
  return ;
end ;


%  Create 3d array of input data
%
a3data = mdata ;
for i = 2:ng ;
  a3data = cat(3,a3data,mdata) ;
end ;     %  d x n x ng array
a3data = permute(a3data,[1 3 2]) ;    %  d x ng x n version 


%  Create 3d array of mxgrid
%
a3xgrid = mxgrid ;
for i = 2:n ;
  a3xgrid = cat(3,a3xgrid,mxgrid) ;
end ;     %  d x ng x n array

a3exparg = a3data - a3xgrid ;
a3data = [] ;    %  to save space
a3xgrid = [] ;    %  to save space

a3exparg = a3exparg.^2 ;          %  d x ng x n array
a3exparg = sum(a3exparg,1) ;      %  1 x ng x n array
a3exparg = squeeze(a3exparg) ;    %  ng x n array
a3exparg = -a3exparg / (2 * h^2) ;


%  Create matrix of kernels
%
mker = ((1 / n) * (sqrt(2 * pi) * h)^(-d)) * exp(a3exparg) ;


%  Add up to get kde
%
vkde = sum(mker,2) ;


%  create output vmax if needed
%
if nargout > 1 ;
  vkmax = max(mker,[],1) ;
end ;


