function [ features ] = linearFeatures( image, downsampleX, downsampleY )
%LINEARFEATURES Summary of this function goes here
%   Detailed explanation goes here

    image = rgb2gray(image);
    features = double(image);
    % --- essa linha � exclusivamente para a base GTech ---
%     features = imresize(features, [150, 150]);
    % --- downsample ---
    features = downsample(features, downsampleX); % downsampleX
    features = features';
    features = downsample(features, downsampleY); % downsampleY
    features = features';
    % --- resize ---
%     features = imresize(features, [downsampleX, downsampleY]); % resize
    % ---
    features = features(:); % transforma em um vetor atraves de concatenacao de coluna
    features = normc(features); % normaliza
end

