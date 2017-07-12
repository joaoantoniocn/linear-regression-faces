function [ vetoresOrdenados, valoresOrdenados ] = ordenar( autovetores, autovalores )
%ORDENAR ordena os autovetores em relacao aos autovalores
%   ?1 ? ?2 ? . . . ?d; onde ? é um autovalor
   
    for i = 1 : length(autovetores)
        for j = i : length(autovetores)
          if autovalores(i,i) < autovalores(j,j)
             tempValores =  autovalores(i,i);
             tempVetores =  autovetores(:, i);
             
             autovalores(i,i) = autovalores(j,j);
             autovetores(:, i) = autovetores(:, j);
             
             autovalores(j,j) = tempValores;
             autovetores(:, j) = tempVetores;
          end    
        end    
    end    
    
    vetoresOrdenados = autovetores;
    valoresOrdenados = autovalores;

end

