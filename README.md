# TrySearchCep
Visão Geral do Projeto: 

O projeto tem como finalidade executar um serviço utilizando Horse para a disponibilidade de um endpoint local e quando consultado será verificado em uma lista de endpoints verificando o primeiro que contiver uma resposta. Para este caso em específico a nossa consulta será para o Cep verificando se obtem resposta em algum dos endpoints da lista. Quando retornado sua resposta é devolvida para a consulta principal ou seja para o nosso endpoint criado com o Horse que disponiobilizamos localmente. Dessa forma podemos centralizar uma lista de endpoints e caso algum esteja fora do ar ele irá verificar no próximo da lista, devolveldo para nossa aplicação principal a resposta independente de saber qual a api de cep consultada. 

 

Arquitetura do Sistema: 

A arquitetura foi baseada no modelo de serviço e mensageria, devido a necessidade de trabalhar com uma espécie de fila trazendo a primeira resposta encontrada da nossa lista de apis para o cep. Entendemos que para este projeto não houve a necessidade de trabalhar com threads diretamente aguardando qual dos endpoints consultados trouxesse a resposta primeiro, nem com uma fila especificamente como no caso de utilizações com o RabbitMQ, devido o tamanho do projeto e também a sua utilização, ainda que esteja trabalhando de uma forma simplificada com uma lista se mantém performático sem complexidade para uma implementação mais robusta caso uma necessidade futura. 

Tecnologias e Ferramentas Usadas: 

 

Para a sua utilização trabalhamos com o Boss que é um gerenciador de dependências muito conhecido e utilizado, através dele fizemos a associação com o Horse para sua utilização. 

Neste projeto também para versionamento de códigos utilizamos o SourceTree, Git e GitHub para sua disponibilização de códigos. 

Na criação de modelos a serem trabalhados inicialmente até seu modelo final foi utilizado o draw.io. 
Os fontes e o diagrama será possível acesar através do repositório do projeto no
