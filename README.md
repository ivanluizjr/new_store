# :shield: New Store

Este projeto foi um desafio para construir um app do zero, onde o objetivo era desenvolver um app de uma loja virtual ou marketplace, contendo uma lista de produtos na tela principal com pesquisa ativa, uma tela de detalhes dos produtos e uma tela com a lista de produtos favoritos caso existam produtos favoritados.
  
## :computer: Tecnologias, APIs, Packages utilizados:
  
  * Flutter / Dart
  * VSCode IDE
  * Flutter Modular
  * Package Dio
  * Package Google Fonts
  * Package Auto Size Text
  * Package Intl
  * Package Shimmer
  * Package Shared Preferences
  * Package Moktail
  * Package Flutter SVG
  
## :file_folder: Organização de pastas e arquivos do projeto:

![image](https://github.com/ivanluizjr/new_store/assets/41458938/6df6d6a6-bb41-458a-b8b7-c944e4b8b9c9)
 
## :keyboard: Estágios de desenvolvimento do projeto:

  - Seguindo os conceitos de uma arquitetura limpa, fiz a organização das pastas do nosso projeto e configurações de pacotes e widgets 
  que utilizariamos durante o desenvoltimento, como também toda a configuração inicial necessária para um app.

  - A arquitetura escolhida foi o Clean Architecture, como boas práticas comecei pelas camadas internas, ou seja, a camada de usecases, 
  implementando após a camada de repositories e por ultimo a camada de datasource que é nossa camada de comunicação externa com banco de 
  dados e Apis, com isso modelando a regra de negócio do projeto.
  
  - O desenvolvimento foi baseado em um mockup de loja online ou marketplace.
  
  - Umas observações, a gerência de estado das telas é feita com ValueNotifier, sendo assim, criei um próprio service de gerenciamento de 
  estado baseado em outros conceituados no mercado, exemplo Bloc, nossa gerência de estado utiliza o ValueNotifier simulando e parecendo 
  o Bloc/Cubit, deixando assim bem mais limpo de se gerenciar e entender os estados.

  - Também junto no design system, que está concentrado na pasta Core, criei vários serviços e widgets necessários para melhorar o 
  desenvolvimento, desde meu próprio média query por exemplo, como também meu próprio either.

  - Teste fiz os teste das camadas principais que envolve nossa regra de negócio, testando nosso usecase, nosso repository implementação 
  e nosso datasource implementação.

  - Resumindo o app, ele é composto de uma tela principal com lista de produtos, uma tela de detalhes dos produtos e uma tela com os 
  produtos que são favoritos pelo usuário. Na tela principal temos um filtro da lista de produtos em tempo real, não fazendo diferença 
  entre letras maiúsculas ou minúsculas para pesquisa, ao navegar para tela de detalhe por exemplo e voltar a pesquisa não é apagada, a 
  lista de produtos só recarrega novamente quando o usuário apaga a pesquisa atual. A tela de favoritos só é navegável caso existam 
  produtos com favoritos, senão uma mensagem de aviso é exibida ao usuário de orientação e que não existe produtos favoritos naquele 
  momento.

  - Para rodar o projeto vou deixar uma apk gerada para Android, mais se você tem conhecimento basta fazer um clone do projeto e rodar 
  ele pelo emulador android ou emulador ios em macOs.

  - **IMPORTANTE**, o projeto foi desenvolvido na SDK 3.0.6 do Dart, podendo talvez não rodar em SDKs inferiores.
  
  - Link do APK do projeto para teste em aparelhos com sistema operacional Android: 
  https://drive.google.com/file/d/1RRCm36ePtyXPlUEwSuWtcCuxg8OVBAsM/view?usp=drive_link
 
##

 # :iphone: Layout do App
  
  
 ![new_store](https://github.com/ivanluizjr/new_store/assets/41458938/c131d50c-7fa3-47c6-bca7-2773761541e7)

 #
  
  ![FLutter-1](https://user-images.githubusercontent.com/41458938/161364495-d0dbe155-75f3-4a03-a58f-307d9212b8aa.png)



