function [ features ] = linearFeatures( image, downsampleX, downsampleY )
%LINEARFEATURES Summary of this function goes here
%   Detailed explanation goes here

    image = rgb2gray(image);
    features = double(image);
    %x = rgb2gray(x); % tons de cinza
%     features = downsample(features, downsampleX); % downsampleX
%     features = features';
%     features = downsample(features, downsampleY); % downsampleY
%     features = features';
    features = imresize(features, [downsampleX, downsampleY]); % resize
    features = features(:); % transforma em um vetor atraves de concatenacao de coluna
    features = normc(features); % normaliza
end

