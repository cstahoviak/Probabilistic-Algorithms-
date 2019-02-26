function [ eln_beta ] = backward_eln( trans_prob, obs_prob, y_obs )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

% use Mann notation
trans_prob = trans_prob';

n = size(trans_prob,1);
T = size(y_obs,1);

% initialization
eln_beta = zeros(n,T);

for k=(T-1):-1:1
    for i=1:n
        logbeta = NaN;
        for j=1:n 
            logbeta = elnsum( logbeta, ...
                elnprod( eln(trans_prob(i,j)), ...
                elnprod( obs_prob(y_obs(k+1),j), eln_beta(j,k+1) )));
        end
        eln_beta(i,k) = logbeta;
    end
end

eln_beta = eln_beta';

end