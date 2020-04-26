disp('Running MATLAB script file HidKDEgaussSMtest.m') ;
%
%    FOR DEVELOPMENT AND TESTING OF MATLAB FUNCTION HidKDEgaussSMtestSM,
%    which does High Dimensional Kernel Density Estimation

itest = 17 ;     %  1,...,17


if  itest == 1  | ... 
    itest == 2  | ... 
    itest == 3  | ... 
    itest == 4  | ... 
    itest == 5  | ... 
    itest == 6  | ... 
    itest == 7  | ... 
    itest == 8  | ... 
    itest == 9  | ... 
    itest == 10  | ... 
    itest == 11  | ... 
    itest == 12  ;    %  Create & Work with 2-d toy test set

  rng(19246109) ;
  mdata = [3; 3] * ones(1,10) + randn(2,10) ;
  mdata = [mdata ([-3; -3] * ones(1,10) + 0.5 * randn(2,10))] ;

  if itest == 1 ;    %  45 degree line slice, good h
    h = 1 ;
    mxgrid = [1; 1] * linspace(-6,8,400) ;
    [vkde,vkmax,mker] = HidKDEgaussSM(mdata,mxgrid,h) ;
    figure(1) ;
    clf ;
    plot(mxgrid(1,:)',vkde,'k--','LineWidth',3)
    title(['2-d toy example, 45 slice, good h = ' num2str(h)]) ; 
    hold on ;
      plot(mxgrid(1,:)',mker,'b-')
    hold off ;

  elseif itest == 2 ;    %  45 degree line slice, small h
    h = 0.3 ;
    mxgrid = [1; 1] * linspace(-6,8,400) ;
    [vkde,vkmax,mker] = HidKDEgaussSM(mdata,mxgrid,h) ;
    figure(1) ;
    clf ;
    plot(mxgrid(1,:)',vkde,'k--','LineWidth',3)
    title(['2-d toy example, 45 slice, small h = ' num2str(h)]) ; 
    hold on ;
      plot(mxgrid(1,:)',mker,'b-')
    hold off ;

  elseif itest == 3 ;    %  45 degree line slice, large h
    h = 3 ;
    mxgrid = [1; 1] * linspace(-6,8,400) ;
    [vkde,vkmax,mker] = HidKDEgaussSM(mdata,mxgrid,h) ;
    figure(1) ;
    clf ;
    plot(mxgrid(1,:)',vkde,'k--','LineWidth',3)
    title(['2-d toy example, 45 slice, large h = ' num2str(h)]) ; 
    hold on ;
      plot(mxgrid(1,:)',mker,'b-')
    hold off ;

  elseif itest == 4 ;    %  x-axis slice, good h
    h = 1 ;
    mxgrid = [linspace(-6,8,400); zeros(1,400)] ;
    [vkde,vkmax,mker] = HidKDEgaussSM(mdata,mxgrid,h) ;
    figure(1) ;
    clf ;
    plot(mxgrid(1,:)',vkde,'k--','LineWidth',3)
    title(['2-d toy example, x slice, good h = ' num2str(h)]) ; 
    hold on ;
      plot(mxgrid(1,:)',mker,'b-')
    hold off ;

  elseif itest == 5 ;    %  x-axis slice, small h
    h = 0.3 ;
    mxgrid = [linspace(-6,8,400); zeros(1,400)] ;
    [vkde,vkmax,mker] = HidKDEgaussSM(mdata,mxgrid,h) ;
    figure(1) ;
    clf ;
    plot(mxgrid(1,:)',vkde,'k--','LineWidth',3)
    title(['2-d toy example, x slice, small h = ' num2str(h)]) ; 
    hold on ;
      plot(mxgrid(1,:)',mker,'b-')
    hold off ;

  elseif itest == 6 ;    %  x-axis slice, large h
    h = 3 ;
    mxgrid = [linspace(-6,8,400); zeros(1,400)] ;
    [vkde,vkmax,mker] = HidKDEgaussSM(mdata,mxgrid,h) ;
    figure(1) ;
    clf ;
    plot(mxgrid(1,:)',vkde,'k--','LineWidth',3)
    title(['2-d toy example, x slice, large h = ' num2str(h)]) ; 
    hold on ;
      plot(mxgrid(1,:)',mker,'b-')
    hold off ;

  elseif itest == 7 ;    %  x-axis slice, good h
    h = 1 ;
    vxgrid = linspace(-6,8,100) ;
    mxg = meshgrid(vxgrid,vxgrid) ;
    vxg1 = reshape(mxg,1,100*100) ;
    vxg2 = reshape(mxg',1,100*100) ;
    mxgrid = [vxg1; vxg2] ;
    vkde = HidKDEgaussSM(mdata,mxgrid,h) ;
    figure(1) ;
    clf ;
    contour(reshape(vkde,100,100)) ;
    hold on ;
      plot([1;100],[1,100],'k--') ;
      plot([1;100],[50,50],'k--') ;
    hold off ;
    title(['2-d toy example, good h = ' num2str(h)]) ; 

  elseif itest == 8 ;    %  x-axis slice, small h
    h = 0.3 ;
    vxgrid = linspace(-6,8,100) ;
    mxg = meshgrid(vxgrid,vxgrid) ;
    vxg1 = reshape(mxg,1,100*100) ;
    vxg2 = reshape(mxg',1,100*100) ;
    mxgrid = [vxg1; vxg2] ;
    [vkde,vkmax,mker] = HidKDEgaussSM(mdata,mxgrid,h) ;
    figure(1) ;
    clf ;
    contour(reshape(vkde,100,100)) ;
    hold on ;
      plot([1;100],[1,100],'k--') ;
      plot([1;100],[50,50],'k--') ;
    hold off ;
    title(['2-d toy example, small h = ' num2str(h)]) ; 

  elseif itest == 9 ;    %  x-axis slice, large h
    h = 3 ;
    vxgrid = linspace(-6,8,100) ;
    mxg = meshgrid(vxgrid,vxgrid) ;
    vxg1 = reshape(mxg,1,100*100) ;
    vxg2 = reshape(mxg',1,100*100) ;
    mxgrid = [vxg1; vxg2] ;
    [vkde,vkmax,mker] = HidKDEgaussSM(mdata,mxgrid,h) ;
    figure(1) ;
    clf ;
    contour(reshape(vkde,100,100)) ;
    hold on ;
      plot([1;100],[1,100],'k--') ;
      plot([1;100],[50,50],'k--') ;
    hold off ;
    title(['2-d toy example, large h = ' num2str(h)]) ; 

  elseif itest == 10 ;    %  max dist, x-axis slice, goog h
    h = 1 ;
    mxgrid = [1; 1] * linspace(-6,8,400) ;
    [vkde,vkmax,mker] = HidKDEgaussSM(mdata,mxgrid,h) ;
    figure(1) ;
    clf ;
    bar(vkmax') ;
    title(['Kernel Maxima, 2-d toy, 45 slice, good h = ' num2str(h)]) ; 

  elseif itest == 11 ;    %  max dist, x-axis slice, small h
    h = 0.3 ;
    mxgrid = [1; 1] * linspace(-6,8,400) ;
    [vkde,vkmax,mker] = HidKDEgaussSM(mdata,mxgrid,h) ;
    figure(1) ;
    clf ;
    bar(vkmax') ;
    title(['Kernel Maxima, 2-d toy, 45 slice, small h = ' num2str(h)]) ; 

  elseif itest == 12 ;    %  max dist, x-axis slice, large h
    h = 3 ;
    mxgrid = [1; 1] * linspace(-6,8,400) ;
    [vkde,vkmax,mker] = HidKDEgaussSM(mdata,mxgrid,h) ;
    figure(1) ;
    clf ;
    bar(vkmax') ;
    title(['Kernel Maxima, 2-d toy, 45 slice, large h = ' num2str(h)]) ; 

  end ;

elseif itest == 13 ;    %  test n = 1
  h = 1 ;
  mdata = [0; 0] ;
  mxgrid = [[-1 0 2]; [0 0 0]] ;
  disp(' ') ;
  disp('Check for n = 1 error message') ;
  disp(' ') ;
  HidKDEgaussSM(mdata,mxgrid,h) ;

elseif itest == 14 ;    %  test n = 10, h = 1, d = 1, against kdeSM
  h = 1 ;
  mdata = randn(1,10) ;
  mxgrid = linspace(-3,3,20) ;
  vkde = HidKDEgaussSM(mdata,mxgrid,h) ;
  paramstruct = struct('vh',h, ...
                       'vxgrid',mxgrid',...
                       'imptyp',1) ; 
  oldkde = kdeSM(mdata',paramstruct) ;
  disp(' ') ; 
  disp('Check these are 0s') ; 
  absdiff = abs(vkde - oldkde)' 

elseif itest == 15 ;    %  test ng = 10, h = 0.1, d = 1, against kdeSM
  h = 0.1 ;
  mdata = randn(1,10) ;
  mxgrid = linspace(-4,4,20) ;
  vkde = HidKDEgaussSM(mdata,mxgrid,h) ;
  paramstruct = struct('vh',h, ...
                       'vxgrid',mxgrid',...
                       'imptyp',1) ; 
  oldkde = kdeSM(mdata',paramstruct) ;
  disp(' ') ; 
  disp('Check this is 0') ; 
  maxabsdiff = max(abs(vkde - oldkde)) 

elseif itest == 16 ;    %  test ng = 1
  h = 2 ;
  mdata = randn(2,10) ;
  mxgrid = 0 ;
  disp(' ') ;
  disp('Check for ng = 1 error message') ;
  disp(' ') ;
  HidKDEgaussSM(mdata,mxgrid,h) ;

elseif itest == 17 ;    %  test against normpdf
  h = 0.5 ;
  mdata = [[-10 10]; [-10 10]] ;    %  Far apart, so normpdf should be OK
  mxgrid = [[-10 10]; [-10 10]] ;
  vkde = HidKDEgaussSM(mdata,mxgrid,h) ;
  disp(' ') ; 
  disp('Check these are 0') ; 
  diff1 = abs(vkde(1) - normpdf(0,0,h)^2 / 2)  
  diff2 = abs(vkde(2) - normpdf(0,0,h)^2 / 2)  


end ;






