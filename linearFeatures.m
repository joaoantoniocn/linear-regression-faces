function [ features ] = linearFeatures( image, downsamplesize )
%LINEARFEATURES Summary of this function goes here
%   Detailed explanation goes here

    features = double(image);
    %x = rgb2gray(x); % tons de cinza
    features = downsample(features, downsamplesize); % downsample
    features = features(:); % transforma em um vetor atravez de concatenacao de coluna
    features = normc(features); % normaliza
end

