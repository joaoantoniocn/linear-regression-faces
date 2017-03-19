function [ features ] = linearFeaturesCrooped( image)
%LINEARFEATURES Summary of this function goes here
%   Detailed explanation goes here

    features = double(image);
    %x = rgb2gray(x); % tons de cinza
%     features = downsample(features, downsampleX); % downsampleX
%     features = features';
%     features = downsample(features, downsampleY); % downsampleY
%     features = features';
    features = features(:); % transforma em um vetor atraves de concatenacao de coluna
    features = normc(features); % normaliza
end

