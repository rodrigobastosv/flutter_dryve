### Flutter Dryve
Implementação em Flutter do protótipo https://app.zeplin.io/project/5f18990c4922d46ca5fa5dad .  
  
Adicionei um ponto que achei legal e não tem no protótipo. Ao clicar em um carro ele leva para uma tela de detalhamento do carro :)  
    
## Como rodar o App
 Para rodar o projeto basta dar um flutter pub get e depois um flutter run no terminal    
    
## Testes    
 Os testes foram implementados e divididos em três tipos:    
    
# Testes de Widgets
Testa os widgets e as interações deles    
    
# Testes de BloCs
Testa a regra de negócio do aplicativo. É possível testar todos os estados da aplicação e como chegar    
um deles.    
    
# Testes de Integração (driver tests)
Teste que roda em um emulador e mostra visualmente a integração dos componentes com a regra de negócio implementada.    
    
# Como rodar os testes:
Criei um script para rodar os testes de widgets e de blocs. Para rodá-los basta rodar o script `tests.sh` dentro do diretório de scripts. Após rodar os testes vai ser gerado um diretório chamado coverage com as informações da cobertura de testes. Todas as linhas foram cobertas com testes, atingindo assim uma cobertura de **100%**. Já para rodar os testes de integração (driver) abra o emulador e rode o script `testsDriver.sh` que está dentro do diretório de scripts.
    
# Cobertura  
A cobertura pode ser vista de maneira mais completa dentro do diretório coverage (gerado ao rodar os testes). Mas segue uma imagem do reporte de coverage gerado.  
![coverage](https://i.ibb.co/Lz5Jnd9/coverage.png)