# Desenvolvimento_de_Aplicação_Mobile_para_Auxílio_a_Navegação_de_JETSKIS

#### Aluno: [Rafael de Almeida Peçanha](https://github.com/Rafaelpecan)

#### Orientador: [Manoela kohler](https://github.com/manoelakohler)

---

Trabalho apresentado ao curso [BI MASTER](https://ica.puc-rio.ai/bi-master) como pré-requisito para conclusão de curso e obtenção de crédito na disciplina "Projetos de Sistemas Inteligentes de Apoio à Decisão".

- [Link para o código](https://github.com/Rafaelpecan/projeto_final/tree/master)


Este trabalho consistiu no desenvolvimento de um protótipo de aplicação mobile em flutter para o auxilio a navegação de jetskis, é sabido que algumas variáveis necessitam ser avaliadas previamente e durante o uso desse tipo de embarcação miúda (até 5 metros de comprimento) e a não avaliação dessas variáveis podem comprometer a segurança não somente do piloto mas como também de outras pessoas ao redor. O desenvolvimento da aplicação passou pelo uso (consulta) de um webservice de condições meteorológicas fornecido pelo centro de previsão de tempo e estudos climáticos (CPTEC) e a criação de uma inteligência artificial para identificar eventos de perigos adjacentes a embarcação.

Abstract

This work consisted in the development of a prototype of a mobile application in flutter in order help the navigation of jetskis, it is known that some variables need to be evaluated before and during the use of this type of small vessel (up to 5 meters in length) and the non-evaluation of these variables can compromise the safety not only of the pilot but also of other people around it. The development of the application included the use of a weather conditions webservice provided by centro de previsão de tempo e estudos climáticos (CPTEC) and the development of an artificial intelligence to identify dangerous events close to the vessel.


### 1. Introdução

O Jetski é um equipamento de transporte marítimo que quase sempre está relacionado somente a diversão em finais de semana de verão. Porém não é incomum notícias de acidentes envolvendo tais embarcações, isso ocorre na maioria dos casos não por problemas mecânicos do jetski, mas sim por negligências e/ou falta de informações de quem pilota tal equipamento. Existem algumas informações mínimas que são necessárias buescar antes de se decidir usar o jetski em um dia qualquer, são elas: Previsão do tempo, pois não é uma boa ideia ficar pegar um temporal em um jetski, pois é uma embarcação aberta, previsão de mar (altura das ondas) por ser difícil manter o controle caso as ondas estejam altas (mais de 1.5 metros), correndo risco do jetski virar e arremessar o piloto no mar e por último, outra variável importante de se checar antes de entrar no mar, seriam as condições de maré alta ou baixa, pois existe o risco do jetski não conseguir passar em regiões de maré muito baixa ou se chocar com pedras em marés altas. Resumindo temos 3 principais pontos de checagem antes de decidir utilizar o jetski, são elas:

1 - Condições meteorológicas.

2 – Condições de mar (altura das ondas).

3 – Condições de maré (alta ou baixa).


De posse das informações prévias acima, mesmo supondo que com todas elas estão contornadas e as condições são ideias para a utilização da embarcação, outros riscos ainda fazem parte do processo de pilotar um jetski. Durante a utilização do equipamento, provavelmente você não será a única embarcação no dia em que estiver andando e diferentemente de uma rodovia onde os carros andam em caminhos específicos (faixas), em alto mar não existem essas marcações (faixas) podendo as embarcações surgirem a partir qualquer ponto no mar, outra problemática comum seriam os banhistas que muitas das vezes, ao entrar no mar (praia por exemplo), dificultam a visualização do piloto que já possui outras informações ao qual deve prestar atenção. Por último, o lixo no mar também é outro ponto de atenção e deve ser evitado, pois pode entrar pela captação do jetski e travar o eixo da turbina impossibilitando o funcionamento dele. Resumindo temos mais 3 pontos de atenção principais que se deve ter, agora durante a utilização do mesmo, são eles:

4 –Perigo de abalroamento com outra embarcação.

5 – Perigo de acidente com banhista.

6 – Perigo de travamento da turbina devido a absorção de lixo.


### 2. Modelagem

Dado a problemática exposta acima esse trabalho propõe uma PoC de uma aplicação que possa funcionar em qualquer celular e ao ser acoplado ao jetski deve ajudar o piloto a mitigar as questões supracitadas. A Modelagem do trabalho se deu em um tripé: Consulta em webservice; desenvolvimento de uma IA para identificar eventos de interesse e desenvolvimento de uma interface em flutter. O webservice foi realizado através da consulta ao CPTEC e possibilitou a aquisição de dados meteorológicos e de mar (temperatura durante a semana, previsão do tempo, altura de onda etc) em um arquivo .XML que após ser convertido em .JSON pode ser trabalhado com facilidade dentro na linguagem dart (flutter). No Desenvolvimento da IA, o primeiro passo foi a aquisição de imagens de interesse no google imagens através de um plugin do navegador chrome que possibilita o downloading de imagens pesquisadas, abaixo pode-se ver uma amostra das imagens baixadas. 

![image](https://user-images.githubusercontent.com/44373449/139498518-67742e39-e1bd-4b99-b94b-20516550b30f.png)

Banhista: 1700 imagens

![image](https://user-images.githubusercontent.com/44373449/139499846-5d1dea4e-c72b-43a4-a167-3b9e38e39364.png)

Lixo: 1000 imagens

![image](https://user-images.githubusercontent.com/44373449/139499891-1cb4c036-9b11-4454-8b6d-01ac0d80968e.png)

Jetski: 3000 imagens

De posse dessas imagens foi lançado mão usando python de um transfer learning de uma vgg-16 treinada no IMAGENET para o ajuste de uma nova rede que obteve 82% de acurácia no dataset de teste. Por fim, um desenvolvimento em flutter foi feito com o objetivo de levar ao usuário uma experiencia final agradável das variáveis (informações) geradas pelo webservice e pela rede neural. 


### 3. Resultados

O resultado do trabalho é algo prático, um painel em um aplicativo onde pode ser visto as condições meteorológicas e de mar em através de uma interface agradável, como ilustrado abaixo:  

  
![image](https://user-images.githubusercontent.com/44373449/139498277-02193bfc-d97b-4460-a479-6fd454bd1190.png)
   
   
E o migração de uma rede neural também para o ambiente um ambiente de produção, nesse caso a migração do python para o flutter através do tensorflowlite, a imagem abaixo ilustra uma classificação feita pela rede:
   

![image](https://user-images.githubusercontent.com/44373449/139499936-0a2abbbe-ba84-482f-8c4e-bc973135774c.png)


### 4. Conclusão


O projeto em questão mostrou ser viável a construção de um aplicativo que pudesse ajudar um piloto de jetski a entrar no mar com mais segurança. Enquanto os dados de condições de clima e mar aquisitadas do CPTEC ajudam na avaliação prévia do piloto as informações da rede neural ajudariam durante uma navegação em si. No desenvolvimento feito foi um protótipo carecendo ainda de um desenvolvimento mais profissional tanto na parte do painel e mais ainda na parte da inteligência artificial que deveria funcionar de maneira continua e otimizada para alertar o piloto em tempo hábil dele efetuar um manobrar de escape do perigo. 

---


Pontifícia Universidade Católica do Rio de Janeiro

Curso de Pós Graduação *Business Intelligence Master*





