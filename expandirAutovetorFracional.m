function [ autovetores_transformados ] = expandirAutovetorFracional( autovetores, autovalores, base_treino, media_treino )
%EXPANDIRAUTOVETORFRACIONAL transformando os autovetores do eigenfaces de
%acordo com a equação (9) do artigo "FRACTIONAL EIGENFACES" situado na
%pasta ./artigos/
    
    autovetores_transformados = [];

    for i = 1 : length(autovetores)
        Xi = base_treino(:, i);
        Xi = Xi - media_treino;
        base_treino(:,i) = Xi;
    end
    
    for i = 1 : length(autovetores)
        e = autovetores(:,i);
        e = base_treino * e;
        e = e/sqrt(length(autovetores) * autovalores(i,i));
        autovetores_transformados = [autovetores_transformados, e ];
    end    

    
    
    
end

