function [ features ] = linearFeaturesPCA( image, pca_treino, media_treino, numero_features)
%LINEARFEATURES Summary of this function goes here
%   Detailed explanation goes here

    image = rgb2gray(image);
    features = double(image);
    % --- essa linha é exclusivamente para a base GTech ---
%     features = imresize(features, [150, 150]);
    % ---
    features = features(:); % transforma em um vetor atraves de concatenacao de coluna

    % --- PCA ---
    features = projetarPCA(features, pca_treino, media_treino, numero_features);
    % ---
    features = features';
    features = normc(features); % normaliza
end

