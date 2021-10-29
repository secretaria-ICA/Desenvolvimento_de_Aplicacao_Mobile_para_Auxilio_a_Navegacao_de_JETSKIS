# ProjetoFinalBI

O Jetski é um equipamento de transporte marítimo que quase sempre está relacionado somente a diversão em finais de semana de verão. Porém não é incomum notícias de acidentes envolvendo tais embarcações, isso ocorre na maioria dos casos não por problemas mecânicos do jetski, mas sim por negligências e/ou falta de informações de quem pilota tal equipamento. Existem algumas informações mínimas que são necessárias buescar antes de se decidir usar o jetski em um dia qualquer, são elas: Previsão do tempo, pois não é uma boa ideia ficar pegar um temporal em um jetski, pois é uma embarcação aberta, previsão de mar (altura das ondas) por ser difícil manter o controle caso as ondas estejam altas (mais de 1.5 metros), correndo risco do jetski virar e arremessar o piloto no mar e por último, outra variável importante de se checar antes de entrar no mar, seriam as condições de maré alta ou baixa, pois existe o risco do jetski não conseguir passar em regiões de maré muito baixa ou se chocar com pedras em marés altas. Resumindo temos 3 principais pontos de checagem antes de decidir utilizar o jetski, são elas:

1 - Condições meteorológicas.

2 – Condições de mar (altura das ondas).

3 – Condições de maré (alta ou baixa).


De posse das informações prévias acima, mesmo supondo que com todas elas estão contornadas e as condições são ideias para a utilização da embarcação, outros riscos ainda fazem parte do processo de pilotar um jetski. Durante a utilização do equipamento, provavelmente você não será a única embarcação no dia em que estiver andando e diferentemente de uma rodovia onde os carros andam em caminhos específicos (faixas), em alto mar não existem essas marcações (faixas) podendo as embarcações surgirem a partir qualquer ponto no mar, outra problemática comum seriam os banhistas que muitas das vezes, ao entrar no mar (praia por exemplo), dificultam a visualização do piloto que já possui outras informações ao qual deve prestar atenção. Por último, o lixo no mar também é outro ponto de atenção e deve ser evitado, pois pode entrar pela captação do jetski e travar o eixo da turbina impossibilitando o funcionamento dele. Resumindo temos mais 3 pontos de atenção principais que se deve ter, agora durante a utilização do mesmo, são eles:

4 –Perigo de abalroamento com outra embarcação.

5 – Perigo de acidente com banhista.

6 – Perigo de travamento da turbina devido a absorção de lixo.

Dado a problemática exposta acima esse trabalho propõe uma PoC de uma aplicação que possa funcionar em qualquer celular e ao ser acoplado ao jetski deve ajudar o piloto a mitigar as questões supracitadas. O desenvolvimento pode ser dividido em duas etapas:

1 – Consulta as informações de clima e mar através de webservice do centro de previsão de tempo e estudos climáticos (CPTEC). A partir dessa consulta um painel explicativo com tais informações foi desenvolvido, como pode ser visto abaixo:

  
   ![image](https://user-images.githubusercontent.com/44373449/139498277-02193bfc-d97b-4460-a479-6fd454bd1190.png)
   
2 – Modelo em tensorFlow para classificação dos eventos: Jetski, lixo no mar e banhista. Fez-se uma busca extensa no google de imagens dos eventos acima que poderiam ajudar no processo de ajusta de uma rede neural para classificar tais eventos, abaixo tem-se exemplos das imagens extraídas:

![image](https://user-images.githubusercontent.com/44373449/139498518-67742e39-e1bd-4b99-b94b-20516550b30f.png)

Banhista: 1700 imagens

![image](https://user-images.githubusercontent.com/44373449/139499846-5d1dea4e-c72b-43a4-a167-3b9e38e39364.png)

Lixo: 1000 imagens

![image](https://user-images.githubusercontent.com/44373449/139499891-1cb4c036-9b11-4454-8b6d-01ac0d80968e.png)

Jetski: 3000 imagens

A partir desse banco de imagens, fez-se um transfer learning de uma VGG-16 treinada no banco de dados do IMAGENET. Assim foi ajustado um novo modelo com os novos dados (utilizou-se também a técnica de data augmentation) gerando uma acurácia de 82%. O modelo foi criado em python (google colab) e depois exportado para o flutter através do tensorflowlite. A imagem abaixo ilustra uma classificação feita pela rede em flutter.

![image](https://user-images.githubusercontent.com/44373449/139499936-0a2abbbe-ba84-482f-8c4e-bc973135774c.png)







