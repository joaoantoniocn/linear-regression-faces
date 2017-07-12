function [ projecao ] = projetarPCA( imagem, pca_treino, media_treino, numero_features )
%PROJETARPCA Projeta a imagem no PCA
%   numero_features = quantas dimensoes queremos projetar no pca
%   imagem = imagem convertida em vetor

    projecao = [];
    
    for i = 1 : numero_features
        iDimension = 0;
        for j = 1 : length(imagem)
            iDimension = iDimension + ((imagem(j) - media_treino(j)) * pca_treino(j, i));
        end
        
        projecao = [projecao iDimension];
    end

end

