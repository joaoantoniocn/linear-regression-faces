function [ features ] = linearFeaturesCrooped( image, downsampleX, downsampleY)
%LINEARFEATURES Summary of this function goes here
%   Detailed explanation goes here

    features = double(image);

% --- downsample ---
%     features = downsample(features, downsampleX); % downsampleX
%     features = features';
%     features = downsample(features, downsampleY); % downsampleY
%     features = features';
    % --- resize ---
    features = imresize(features, [downsampleX, downsampleY]); % resize
    % ---

    features = features(:); % transforma em um vetor atraves de concatenacao de coluna
    features = normc(features); % normaliza
end

