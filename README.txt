--- Terminações dos arquivos ---

Arquivos sem terminações exclusivas:	Usam a extração de Características normal do artigo "./linear Regression.pdf".
					Trabalham com as pastas "./test/" e "./treino" que contem os arquivos em formato de imagem que serão usados para treino e teste das bases.
					Feito para trabalhar com folders, onde os resultados serão extraídos 1 fold por rodada, ou seja, se existem N folders, o arquivo terá que 
					ser N vezes e o conteudo das pastas "./test/" e "./treino" terá que ser substituido em cada rodada.
					
Arquivos com terminações em *File:	Trabalham com holdouts em vez de folders. Nesse caso as classes da base a ser rodada terá que estar na pasta "./base/" e os arquivos terão
					estar em formato de imagem.
					Usa um arquivo "*.txt" que contem as informações necessárias para separar as bases de treino e teste de cada holdout.
					
Arquivos com terminações em *Cropped:	Usam a extração de Características normal do artigo "./linear Regression.pdf". Porém faz isso de forma modular, onde cada classe em vez de
					ser representada por apenas 1 modelo, será representada por numeroCortes*2 modelos. numeroCortes indica quantos cortes horizontais serão
					feitos na imagem, por padrão será feito apenas um corte na vertical separando a imagem em 2.
					
					O "Models" (variavel que contem os Modelos de cada classe) é uma Matriz com 4 dimensoes (ao invés de 3, número usado pelos arquivos sem a
					terminação "*Crooped") onde cada 3" dimensão representa uma classe e a 4" dimensao representa os modelos daquela classe. Cada classe tera
                              		numeroCortes*2 modelos.

Arquivos com terminações em *Wavelet: 	Usam uma variação da extração de caracteríticas encontrada em "./linear Regression.pdf", onde a redução de dimensionalidade em vez de ser
					feito por um resize ou downsample é feito atravez do wavelets.
					
					Apesar de não conter a terminação *File, também carregam a base a partir de um arquivo igual os com a terminação *File.
                              
                             

--- Configuração dos holdouts ---

Serão carregadas de um arquivo "*.txt".

A configuração que eu usei foi a seguinte:

Cada linha contem um holdout;
Dentro de cada holdout a parte de treino e teste está separada por ';' ponto de vírgula;
Dentro do treino/teste, cada classe está separada por '|' e o primeiro elemento da classe é o nome da classe;
Dentro de cada classe, as amostras estão separadas por ',' vírgula.

