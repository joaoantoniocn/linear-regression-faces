function [ projecao ] = projetarPCA( imagem, pca_treino, media_treino, numero_features, r )
%PROJETARPCA Projeta a imagem no PCA
%   numero_features = quantas dimensoes queremos projetar no pca
%   imagem = imagem convertida em vetor

%     projecao = pca_treino(:,1:numero_features)' * (imagem - media_treino');
    projecao = [];
    imagem = power(imagem, r); % fracionario
    
    for i = 1 : numero_features
        iDimension = 0;
        for j = 1 : length(imagem)
            iDimension = iDimension + ((imagem(j) - media_treino(j)) * pca_treino(j, i));
        end
        
        projecao = [projecao iDimension];
    end

end

