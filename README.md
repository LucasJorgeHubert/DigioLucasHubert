## Digio App challenge

### Lucas Hubert
Sr iOS developer
5 Anos de experiência com desenvolvimento iOS
Swift / SwiftUI / Objective-C

### Setup

O projeto é simples, e utiliza o SPM como gerenciador de dependências, tornando o processo de build muito mais simples, basta aguardar a instalação das libs e rodar o aplicativo

## Exteral libs

Foi necessário apenas duas Libs para o desenvolvimento do app, sendo elas:
- **[SwiftLint](https://github.com/realm/SwiftLint)**: Para auxiliar na padronização do código
- **[SkeletonUI](https://github.com/CSolanaM/SkeletonUI)**: Para visualização de loading durante as requisições

## Arquitetura
Utilizei da arquitetura MVVM, implementando o Clean Code e Clean Archtecture. O que viabiliza a escalabilidade e facilita a manutenção

## Network
Como todas as informações vem de um mesmo endpoint, e cada UseCase deve ser especifico, foi utilizado o cache, para que o app não faça a requisição para cada Case, se tiver cache, ele utiliza o cache. E o gerenciamento de cache fica isolado na camada de DataSource da requisição, o que previne cache indevido.

## Outros projetos
- **[Sharegram (Instagram Clone)](https://github.com/LucasJorgeHubert/SwiftUI-Sharegram-App)**
- **[eUber (Uber Clone)](https://github.com/LucasJorgeHubert/SwiftUI-Uber-App)**
