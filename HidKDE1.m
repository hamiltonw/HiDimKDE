disp('Running MATLAB script file HidKDE1.m') ;
%
%    Explores High Dimensional Kernel Density Estimation
%    Using straightforward calculation by MidKDEgaussSM

ipart = 37 ;    %  1 - 2-d example, good h = 1 
               %  2 - 2-d example, small h = 0.3
               %  3 - 2-d example, large h = 3
               %  11 - 25-d example, Gaussian, n = 100, Summaries
               %  12 - 25-d example, h = 1
               %  13 - 25-d example, h = 4
               %  14 - 25-d example, h = 2
               %  15 - 25-d example, h = 1.3
               %  16 - 25-d example, h = 8
               %  17 - 25-d example, h = 16
               %  18 - 25-d example, h = 2.6
               %  19 - 25-d example, explore grid of Coeff of Var
               %  21 - 25-d example, Bimodal #1, n = 100, Summaries
               %  22 - Bimodal #1, explore grid of Coeff of Var 
               %  23 - Bimodal #1, h = 1.3 ;
               %  24 - Bimodal #1, h = 2.6 ;
               %  25 - Bimodal #1, h = 5.2 ;
               %  26 - Bimodal #1, h = 2 ;
               %  27 - Bimodal #1, h = 4 ;
               %  31 - 25-d example, Bimodal #2, n = 100, Summaries
               %  32 - Bimodal #2, explore grid of Coeff of Var 
               %  33 - Bimodal #2, h = 1.3 ;
               %  34 - Bimodal #2, h = 2.6 ;
               %  35 - Bimodal #2, h = 5.2 ;
               %  36 - Bimodal #2, h = 2 ;
               %  37 - Bimodal #2, h = 4 ;



if  ipart == 1  | ...
    ipart == 2  | ...
    ipart == 3  ;

  %  Generate data
  %
  rng(19246109) ;
  mdata = [3; 3] * ones(1,10) + randn(2,10) ;
  mdata = [mdata ([-3; -3] * ones(1,10) + 0.5 * randn(2,10))] ;
  n = size(mdata,2) ;

  %   Set bandwidth
  % 
  if ipart == 1 ;    %  2-d example, good h = 1 
    h = 1 ;
    hstr = 'Goodh' ;
  elseif ipart == 2 ;    %  2-d example, small h = 0.3
    h = 0.3 ;
    hstr = 'Smallh' ;
  elseif ipart == 3 ;    %  2-d example, large h = 3
    h = 3 ;
    hstr = 'Largeh' ;
  end ;

  titstr = ['2d Toy, h = ' num2str(h)] ;


  %  Make contour plot
  %
  figure(1) ;
  clf ;
  vxgrid = linspace(-6,8,100) ;
  mxg = meshgrid(vxgrid,vxgrid) ;
  vxg1 = reshape(mxg,1,100*100) ;
  vxg2 = reshape(mxg',1,100*100) ;
  mxgrid = [vxg1; vxg2] ;
  vkde = HidKDEgaussSM(mdata,mxgrid,h) ;
  contour(reshape(vkde,100,100)) ;
  hold on ;
    plot([1;100],[1,100],'k--') ;
    plot([1;100],[50,50],'k--') ;
  hold off ;
  title([titstr ', Contour']) ; 
  orient landscape ;
  pstr = ['HidKDE1p' num2str(ipart) 'Toy2dContour' hstr] ;
  print('-dpsc2',pstr) ;


  %  Make 45 degree line slice
  %
  figure(2) ;
  clf ;
  mxgrid = [1; 1] * linspace(-6,8,400) ;
  [vkde,vkmax,mker] = HidKDEgaussSM(mdata,mxgrid,h) ;
  plot(mxgrid(1,:)',vkde,'k--','LineWidth',3)
  title([titstr ', 45 degree slice']) ; 
  hold on ;
    plot(mxgrid(1,:)',mker,'b-')
  hold off ;
  orient landscape ;
  pstr = ['HidKDE1p' num2str(ipart) 'Toy2d45slice' hstr] ;
  print('-dpsc2',pstr) ;


  %  Make x-axis slice
  %
  figure(3) ;
  clf ;
  mxgrid = [linspace(-6,8,400); zeros(1,400)] ;
  [vkde,vkmax,mker] = HidKDEgaussSM(mdata,mxgrid,h) ;
  plot(mxgrid(1,:)',vkde,'k--','LineWidth',3)
  title([titstr ', x-axis slice']) ; 
  hold on ;
    plot(mxgrid(1,:)',mker,'b-')
  hold off ;
  orient landscape ;
  pstr = ['HidKDE1p' num2str(ipart) 'Toy2dXslice' hstr] ;
  print('-dpsc2',pstr) ;


  %  Make bar plot of kenel heights
  %
  figure(4) ;
  clf ;
  h = 1 ;
  mxgrid = [1; 1] * linspace(-6,8,400) ;
  [vkde,vkmax,mker] = HidKDEgaussSM(mdata,mxgrid,h) ;
  bar(vkmax') ;
  title([titstr ', 45 degree slice, kernel maxima']) ; 
  vax = axis ;
  axis([0 (n + 1) 0 vax(4)]) ;
  orient landscape ;
  pstr = ['HidKDE1p' num2str(ipart) 'Toy2dBars' hstr] ;
  print('-dpsc2',pstr) ;


elseif  ipart == 11  | ...
        ipart == 12  | ...
        ipart == 13  | ...
        ipart == 14  | ...
        ipart == 15  | ...
        ipart == 16  | ...
        ipart == 17  | ...
        ipart == 18  | ...
        ipart == 19  | ...
        ipart == 21  | ...
        ipart == 22  | ...
        ipart == 23  | ...
        ipart == 24  | ...
        ipart == 25  | ...
        ipart == 26  | ...
        ipart == 27  | ...
        ipart == 31  | ...
        ipart == 32  | ...
        ipart == 33  | ...
        ipart == 34  | ...
        ipart == 35  | ...
        ipart == 36  | ...
        ipart == 37  ;    %  25-d examples, n = 100


  %  Generate data
  %
  if  ipart == 11  | ...
      ipart == 12  | ...
      ipart == 13  | ...
      ipart == 14  | ...
      ipart == 15  | ...
      ipart == 16  | ...
      ipart == 17  | ...
      ipart == 18  | ...
      ipart == 19  ;    %  25-d example, Gaussian, n = 100

    rng(73947341) ;
    n = 100 ;
    d = 25 ;
    vhmin = sqrt(2) ;
    vhmax = 8 ;
    mdata = randn(d,n) ;
    diststr = 'Gaussd25' ;
    dtitstr = ['Gaussian, 25d, n = ' num2str(n)] ;

  elseif  ipart == 21  | ...
          ipart == 22  | ...
          ipart == 23  | ...
          ipart == 24  | ...
          ipart == 25  | ...
          ipart == 26  | ...
          ipart == 27  ;    %  25-d example, Bimodal #1, n = 100

    rng(96004753) ;
    n = 100 ;
    d = 25 ;
    vhmin = sqrt(2) ;
    vhmax = 16 ;
    mdata = randn(d,n) ;
    mdata(:,1:(n / 2)) = mdata(:,1:(n / 2)) + 2 * ones(d,n / 2) ;
        %  Moves means marginally by 2, along diagonal by sqrt(100) = 10
    diststr = 'Bimod1d25' ;
    dtitstr = ['Bimodal #1, 25d, n = ' num2str(n)] ;

  elseif  ipart == 31  | ...
          ipart == 32  | ...
          ipart == 33  | ...
          ipart == 34  | ...
          ipart == 35  | ...
          ipart == 36  | ...
          ipart == 37  ;    %  25-d example, Bimodal #2, n = 100

    rng(31009273) ;
    n = 100 ;
    d = 25 ;
    vhmin = sqrt(2) ;
    vhmax = 16 ;
    mdata = randn(d,n) ;
    mdata(:,1:35) = 0.5 * mdata(:,1:35) + 2 * ones(d,35) ;
        %  Moves means marginally by 2, along diagonal by sqrt(100) = 10
        %  and scales by 1/2
    mdata(:,66:100) = 2 * mdata(:,66:100) - 4 * ones(d,35) ;
        %  Moves means marginally by 4, along diagonal by sqrt(400) = 20
        %  and scales by 2
    diststr = 'Bimod2d25' ;
    dtitstr = ['Bimodal #2, 25d, n = ' num2str(n)] ;

  end ;

  if  ipart == 11  | ...
      ipart == 21  | ...
      ipart == 31  ;    %  Summaries

    vdist0 = sqrt(sum(mdata.^2)) ;

    a3data = mdata ;
    for i = 2:n ;
      a3data = cat(3,a3data,mdata) ;
    end ;     %  d x n x n array
    a3diff = a3data - permute(a3data,[1 3 2]) ; 
    mpwdist = sum(a3diff.^2,1) ;
    mpwdist = sqrt(mpwdist) ;
    mpwdist = squeeze(mpwdist) ;
    vpwdist = [] ;
    for i = 1:(n - 1) ;
      vpwdist = [vpwdist; diag(mpwdist,i)] ;
    end ;

%{
    %  use these line to check
    %
    disp(' ') ;
    disp('Check these are 0') ;
    diff0 = abs(norm(mdata(:,1)) - vdist0(1)) 
    diffpw = abs(norm(mdata(:,1) - mdata(:,2)) - mpwdist(1,2)) 
%}

    %  Show distribution of distances to origin
    %
    figure(1) ;
    clf ;
    titstr = ['Distr''n of Distances to Origin, ' dtitstr] ;
    paramstruct = struct('titlestr',titstr, ...
                         'xlabelstr','Distances to 0') ;
    kdeSM(vdist0',paramstruct) ;
    hold on ;
      vax = axis ;
      plot(sqrt(25) * ones(2,1),[vax(3) vax(4)],'k--','LineWidth',2) ;
    hold off ;
    orient landscape ;
    pstr = ['HidKDE1p' num2str(ipart) diststr 'SumDist0'] ;
    print('-dpsc2',pstr) ;


    %  Show distribution of pairwise distances
    %
    figure(2) ;
    clf ;
    titstr = ['Distr''n of Pairwise Distances, ' dtitstr] ;
    paramstruct = struct('ndatovlay',2, ...
                         'datovlaymin',0.1, ...
                         'datovlaymax',0.9, ...
                         'titlestr',titstr, ...
                         'xlabelstr','Pairwise Distances') ;
    kdeSM(vpwdist,paramstruct) ;
    hold on ;
      vax = axis ;
      plot(sqrt(50) * ones(2,1),[vax(3) vax(4)],'k--','LineWidth',2) ;
      if  ipart == 21 | ipart == 31 ;
        plot(sqrt(150) * ones(2,1),[vax(3) vax(4)],'k:','LineWidth',2) ;
            %  Expected distance = sqrt(100 + 25 + 25)
      end ;
    hold off ;
    orient landscape ;
    pstr = ['HidKDE1p' num2str(ipart) diststr 'SumPWDist'] ;
    print('-dpsc2',pstr) ;


  elseif  ipart == 12  | ...
          ipart == 13  | ...
          ipart == 14  | ...
          ipart == 15  | ...
          ipart == 16  | ...
          ipart == 17  | ...
          ipart == 18  | ...
          ipart == 23  | ...
          ipart == 24  | ...
          ipart == 25  | ...
          ipart == 26  | ...
          ipart == 27  | ...
          ipart == 33  | ...
          ipart == 34  | ...
          ipart == 35  | ...
          ipart == 36  | ...
          ipart == 37  ;    %  kde on PC1 slice, different hs

    %  Do PCA
    %
    paramstruct = struct('npc',1, ...
                         'iscreenwrite',1, ...
                         'viout',[0 1 1 0 1]) ;
    outstruct = pcaSM(mdata,paramstruct) ;
    veigvec = getfield(outstruct,'meigvec') ;
    vmean = getfield(outstruct,'vmean') ; 
    vscores = getfield(outstruct,'mpc') ; 
    vscores = vscores + veigvec' * vmean ;
        %  since output is centered at 0


    %   Set bandwidth
    % 
    if ipart == 12 ;  
      h = 1 ;
      hstr = 'h1' ;
    elseif ipart == 13 ;
      h = 4 ;
      hstr = 'h4' ;
    elseif ipart == 14 ;
      h = 2 ;
      hstr = 'h2' ;
    elseif ipart == 15 ;
      h = 1.3 ;
      hstr = 'h13' ;
    elseif ipart == 16 ;
      h = 8 ;
      hstr = 'h8' ;
    elseif ipart == 17 ;
      h = 16 ;
      hstr = 'h16' ;
    elseif ipart == 18 ;
      h = 2.6 ;
      hstr = 'h26' ;
    elseif ipart == 23 ;
      h = 1.3 ;
      hstr = 'h13' ;
    elseif ipart == 24 ;
      h = 2.6 ;
      hstr = 'h26' ;
    elseif ipart == 25 ;
      h = 5.2 ;
      hstr = 'h52' ;
    elseif ipart == 26 ;
      h = 2 ;
      hstr = 'h2' ;
    elseif ipart == 27 ;
      h = 4 ;
      hstr = 'h4' ;
    elseif ipart == 33 ;
      h = 1.3 ;
      hstr = 'h13' ;
    elseif ipart == 34 ;
      h = 2.6 ;
      hstr = 'h26' ;
    elseif ipart == 35 ;
      h = 5.2 ;
      hstr = 'h52' ;
    elseif ipart == 36 ;
      h = 2 ;
      hstr = 'h2' ;
    elseif ipart == 37 ;
      h = 4 ;
      hstr = 'h4' ;
    end ;


    %  Construct kde
    %
    left = min(vscores) - 3 * h ;
    right = max(vscores) + 3 * h ;
    vsgrid = linspace(left,right,100) ;
    mxgrid = veigvec * vsgrid ;
    [vkde,vkmax,mker] = HidKDEgaussSM(mdata,mxgrid,h) ;

    %  Plot kde on PC1 slice
    %
    figure(1) ;
    clf ;
    plot(vsgrid',vkde,'k--','LineWidth',3)
    title([dtitstr ', x-axis slice']) ; 
    hold on ;
      plot(vsgrid',mker,'b-')
    hold off ;
    axis([left right 0 (1.05 * max(vkde))]) ;
    title([dtitstr ', PC1 slice, h = ' num2str(h)]) ; 
    orient landscape ;
    pstr = ['HidKDE1p' num2str(ipart) diststr 'PC1slice' hstr] ;
    print('-dpsc2',pstr) ;

    %  Make bar plot of kernel heights
    %
    figure(2) ;
    clf ;
    bar(vkmax') ;
    title([dtitstr ', PC1 slice, kernel maxima, h = ' num2str(h)]) ; 
    vax = axis ;
    axis([0 (n + 1) 0 vax(4)]) ;
    orient landscape ;
    pstr = ['HidKDE1p' num2str(ipart) diststr 'Bars' hstr] ;
    print('-dpsc2',pstr) ;

    %  Study distribution of KDE at all data points
    %
    figure(3) ;
    clf ;
    vkde = HidKDEgaussSM(mdata,mdata,h) ;
    bar(vkde') ;
    title([dtitstr ', heights at data points, h = ' num2str(h)]) ; 
    vax = axis ;
    axis([0 (n + 1) 0 vax(4)]) ;
    coeffvar = std(vkde) / mean(vkde) ;
    text((n / 5),0.9 * vax(4), ...
         ['Coeff of Varn = ' num2str(coeffvar)], ...
         'Color',[1 0 0]) ;
    orient landscape ;
    pstr = ['HidKDE1p' num2str(ipart) diststr 'Hts' hstr] ;
    print('-dpsc2',pstr) ;


  elseif  ipart == 19  | ...
          ipart == 22  | ...
          ipart == 32  ;    %  Explore grid of Coeff of Var

    ng = 51 ;
    vh = 2.^linspace(log2(vhmin),log2(vhmax),ng) ;

    vcv = [] ;
    for ig = 1:ng ;
      disp(['    Working on h # ' num2str(ig) ' of ' num2str(ng)]) ;
      h = vh(ig) ;
      vkde = HidKDEgaussSM(mdata,mdata,h) ;
      coeffvar = std(vkde) / mean(vkde) ;
      vcv = [vcv; coeffvar] ;
    end ;
    [temp,mind] = max(vcv) ;
    figure(1) ;
    clf ;
    plot(log2(vh),vcv,'r-','LineWidth',3)
    title([dtitstr ', Coeff''s of Var''n of KDE heights at data']) ;
    xlabel('log_2(h)') ;
    ylabel('Coefficient of Variation') ;
    vax = axis ;
    text(2,0.9 * vax(4), ...
         ['Max at h = ' num2str(vh(mind))]) ;
    orient landscape ;
    pstr = ['HidKDE1p' num2str(ipart) diststr 'CoeffOfVars'] ;
    print('-dpsc2',pstr) ;



  end ;



end ;





