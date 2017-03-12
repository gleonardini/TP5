%This script allows to plot the wavelet of a particular time series
x=load ('montmorency_051005.mat');
sp=x.Q(12000:end);
t=datenum(x.date(12000:end));
%monthly data
%Last comment: trying to  get t monthly values by comparing the dates.
%Seems to be hard...
%{
datadatenum(x.data)
date_Q=datestr(x.date,'mm/yyyy')%data fom file if converted to format dd/yyyy
k=0;
for j=1966:2017
    for i=01:12
        k=k+1;
      data{k} = sprintf('%02d/%04d', i,j);
    end
end
%}
%x=load ('sunspot2004.mat')
subplot(2,1,1)
%plot of time series
plot(t,sp)
title('Time series of daily streamflow')
xlabel( 'Time(day)' ) 
ylabel( 'Streamflow (m^3 s^{-1})' )
xlim([t(1) t(end)])
datetick('x','mmm/yyyy', 'keeplimits')
%set(gca,'fontsize',16)
subplot(2,1,2)
%plot of wavelet
title('Wavelet of daily streamflow')
wave_auto_amse_morlet( sp, 8, 1, 2, 'day' );
%wave_auto_amse_mexican( sp, 5, 1, 2, 'an' );
%hovmoller_debit18_amse( [2, 3.1] ) ;

