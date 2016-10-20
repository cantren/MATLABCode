function Price = OptionPrice_BS(spotPrice, strikePrice, noRiskRate, ...,
    Volatility, Maturity)
% -------------------------------------------------------------------------
% Summary: To calculate vanilla option price by B/S
% Original Author: Zhang Wei (eileen.wei.zhang@gmail.com)
% Modification Author: Nick Cantrell(nickcantrell@gmail.com)
% Last Modified: October 20 2016
% Example: Price = OptionPrice_BS(100, 100, 0.01, 0.25, 1)
%          Price = 10.3957
% -------------------------------------------------------------------------
	d1 = (log(spotPrice/strikePrice) + ( (+0.5) * Volatility * Volatility) * Maturity) / Volatility / sqrt(Maturity);
	d2 = (log(spotPrice/strikePrice) + ( (-0.5) * Volatility * Volatility) * Maturity) / Volatility / sqrt(Maturity);
	Price = spotPrice * normcdf(d1) - strikePrice * exp(-noRiskRate * Maturity) * normcdf(d2);
