% nIn = the number of inputs
% nHidden = the number of hidden neurons
% nOut = the number of output neurons
% Weights (and biases) should take values in the range [-wMax,wMax]

% we have two matrices, one corresponding to weights between in and hidden 
% the other one between hidden and out 

% clc, clearvars; 



function [wIH, wHO] = DecodeChromosome(chromosome, nIn, nHidden, nOut, wMax)
    % wIH = ones(nHidden, nIn+1);
    % 
    % wHO = ones(nOut, nHidden+1);

    cutPoint = (nIn+1) * nHidden; 

    chromosomePartI = chromosome(1:cutPoint);
    chromosomePartII = chromosome(cutPoint+1:end);

    wIHTransposed = reshape(chromosomePartI, [nIn+1, nHidden]);
    wHOTransposed = reshape(chromosomePartII, [nHidden+1, nOut]);
    
    wIH = wIHTransposed.';
    wHO = wHOTransposed.';
    
    

end