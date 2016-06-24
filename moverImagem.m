function [ ] = moverImagem( file_name  )

img01 = '+000E+00';
img02 = '+000E+20';
img03 = '+000E+45'; 
img04 = '+005E+10'; 
img05 = '+005E-10'; 
img06 = '+010E+00';
img07 = '+015E+20'; 
img08 = '+020E-10';
img09 = '+070E+00'; 
img10 = '+070E-35'; 
img11 = '+110E+15'; 
img12 = '+130E+20';
img13 = '+035E-20';
img14 = '-050E-40';
img15 = '-060E-20'; 
img16 = '-070E-35';
img17 = '-110E+65';
img18 = '-110E-20'; 
img19 = '-120E+00';


file_name = [file_name, '/'];
pastas = dir(file_name);

for i = 3 : length(pastas)
    
    nome_pasta = pastas(i).name;
    nome_pasta_completo = [file_name, nome_pasta, '/'];
    nome_fotos = dir([nome_pasta_completo, '/*pgm']);
    
    mkdir(['./treino/', nome_pasta]);
    for j = 1 : length(nome_fotos)
        
        if((size(strfind(nome_fotos(j).name, img01)) > 0))
                movefile([ nome_pasta_completo, '/', nome_fotos(j).name ], ['./treino/', nome_pasta, '/', nome_fotos(j).name ])
        end
       
   end
 end
end
