#### 06/01/2024

Curso de Flutter: implementando testes de integração

@01-Realizando teste de integração

@@01
Apresentação

Boas-vindas ao nosso curso de Flutter: Testes de integração! Meu nome é Caio Couto Moreira, mas você pode me chamar de Kako.
Autodescrição: Sou um homem branco com nariz longo e olhos castanhos esverdeados. Meus cabelos são curtos e cacheados e, no momento, estão pintados de vermelho. Ao fundo, há uma parede com iluminação roxa e rosa.
Para quem é este curso?
Este curso é para pessoas que:

aprenderem os conceitos básicos do Flutter
sabem produzir um aplicativo
começaram a fazer os primeiros testes de unidade e widgets
conhecem sobre gerenciamento de estados, em especial, o Provider
Antes de continuar, vamos conferir a interface do aplicativo de banco que usaremos ao longo deste curso.

O aplicativo
A tela inicial é uma página de clientes em branco. No topo, há uma barra azul com o título "Clientes". No canto esquerdo da barra, há um ícone de menu, que exploraremos em breve.

No canto inferior direito da tela, há um botão flutuante redondo e azul com o símbolo de mais (floating action button). Ao clicar nele, uma caixa de diálogo surgirá no centro da tela com um formulário e podemos preenchê-lo para adicionar um cliente. Como exemplo, vamos adicionar o cliente Kako, informando seu e-mail e o tipo de cliente "Diamond":

Nome: Kako
Email: kako@alura.com
Tipo: Diamond
Clicando no botão "Salvar" no canto inferior direito do formulário, o cliente "Kako (Diamond)" instantanemente será listado na página de clientes.

A seguir, pressionaremos o ícone de menu no canto superior esquerdo, para abrir o Drawer na lateral esquerda da tela. Esse menu facilitará nossa navegação para outras telas do aplicativo. Nele, temos listados:

Gerenciar clientes
Tipos de clientes
Sair
Vamos navegar até a tela "Tipos de clientes", onde há uma lista padrão de tipos de clientes:

Platinum
Golden
Titanium
Diamond
No canto inferior direito, vamos clicar no floating action button para acessar o formulário de adição de um novo tipo de cliente. Usaremos o nome "Bronze" e selecionaremos o ícone de uma pessoa correndo. Ao pressionar o botão "Salvar" no canto inferior direito, o novo tipo será instantaneamente listado na tela "Tipos de cliente".

Este é o nosso aplicativo! Ele não parece complexo, mas o funcionamento dele requer muitos conhecimentos (inclusive, de gerenciamento). Nosso objetivo será testar esse aplicativo de ponta a ponta, usando testes de integração!

Dica para acompanhar o curso
A melhor forma de estudar este curso é assistir aos vídeos, fazer as atividades e, depois, tentar replicar os resultados por conta própria, sem acompanhar o material. Caso você tenha dúvidas, então você pode voltar ao vídeo para revisar e descobrir quais pontos esqueceu.

Se tiver dúvidas, você pode nos acionar no fórum ou no Discord! O engajamento com outros alunos te ajudará no seu crescimento profissional e no desenvolvimento de habilidades para o mercado de trabalho.

Vamos mergulhar em novo projeto?

@@02
Preparando o ambiente

O que preciso saber para fazer este curso?
Neste curso, é imprescindível que você tenha uma IDE para trabalhar enquanto acompanha nossos vídeos. Recomendamos o uso do Android Studio ou do VSCode.

A instrução de como instalar a IDE já foi dada no primeiro curso de Flutter, mas caso precise relembrar, acesse aqui a aula de preparação de ambiente inicial.

Onde baixo o projeto?
Sugerimos que você baixe o código do projeto que será utilizado nesse curso!, nesse curso iremos receber um projeto pronto e aprender como ele funciona assim como alterá-lo para treinar os nossos conceitos de teste de integração.

Qual é o projeto do curso?
Vamos utilizar o Client Control, um aplicativo que simula a criação de Clientes em um banco assim como a criação de tipos de conta. Será uma ótima forma de aplicar os conceitos de testes de integração!

Bons estudos!

@@03
Conhecendo o projeto

Antes de começar a explorar os testes de integração, é importante revisar conceitos sobre testes de unidade e testes de widget. Eles precisam estar bem frescos na nossa memória para conseguirmos produzir testes de integração e entender a importância deles. Além disso, precisamos contextualizar nosso aprendizado. Vamos usar um exemplo concreto, por meio do storytelling.
Você se lembra da Dandara? Ela é nossa persona que conhecia apenas lógica de programação e se propôs a estudar Dart do início, passando por todos os cursos da Formação de Dart.

Ela foi evoluindo seus conhecimentos e também fez todos os cursos de Flutter. Agora, Dandara começou a se inserir no mercado de trabalho como freelancer — isto é, com trabalhos autônomos. Navegando pela internet, ela encontrou uma pessoa que fez o seguinte pedido:

Eu tenho um aplicativo de banco, pronto, bem simples. Eu quero garantir a qualidade do meu aplicativo, desenvolvendo testes. Só que eu não tenho tempo, então posso te pagar para você fazer esses testes para mim. Pode ser?
Assim, a Dandara conseguiu uma demanda, um freela! Então, nossa missão é realizar testes em um aplicativo que já está pronto. Não precisamos implementar novas funcionalidades, apenas garantir que o que foi implementado continue funcionando com a melhor qualidade possível.

Qual será nosso primeiro passo? Explorar o aplicativo e entender como ele funciona! O download dele está disponível na plataforma.

Vale ressaltar que já estamos em um nível mais intermediário de Flutter. Caso necessário, você pode voltar aos cursos anteriores da Formação de Flutter para revisar alguns conteúdos dos quais falaremos adiante.

Explorando o aplicativo
Vamos abrir o Android Studio e usar o emulador para explorar o aplicativo. Ele consiste em apenas duas páginas, com alguns diálogos e algumas informações sendo gerenciadas. Vamos analisá-lo em detalhes, a seguir.

A tela inicial é a página de clientes, atualmente vazia, com o fundo branco:

Página inicial do aplicativo, também chamada de tela de clientes. A descrição é feita na transcrição, a seguir.

No canto inferior direito, temos um floating action button (ou "FAB") azul para adicionar clientes, com o símbolo de mais. No topo, há uma barra azul com o título "Clientes". No canto superior esquerdo, há um ícone de menu.

Ao clicar no ícone de menu, o widget Drawer será aberto na lateral esquerda do aplicativo. Trata-se de um menu para navegação, onde temos listados:

Gerenciar clientes
Tipos de clientes
Sair
Menu de navegação lateral do aplicativo, também chamado Drawer. Na parte superior, há uma área azul com o título "Menu". Abaixo, há uma área com fundo branco, onde temos a lista de telas navegáveis.

Clicando em "Gerenciar clientes", voltamos para a página inicial de clientes. Clicando em "Tipos de clientes", somos redirecionados para a página "Tipos de clientes". Ou seja, acontece uma navegação, então é importante termos noções de navegação.

Na tela "Tipos de clientes", temos uma lista padrão de tipos sobre um fundo branco:

Platinum
Golden
Titanium
Diamond
Tela de tipos de clientes. No topo, há uma barra azul com o título "Tipos de clientes". No canto superior esquerdo, temos o ícone de menu. Na parte principal da tela, temos a lista de tipos. Cada tipo tem um ícone laranja à esquerda. No canto direito inferior, há um botão laranja redondo com símbolo de mais.

No canto inferior direito, há um floating action button (FAB) laranja, para adicionar um novo tipo de cliente. Clicando nesse botão, uma caixa de diálogo (alert dialog) surgirá no centro da tela com um formulário.

Como exemplo, vamos criar um tipo com o nome "Ferro" e selecionar o primeiro ícone — um gift card com um laço na parte superior. Na parte inferior da caixa de diálogo, temos os botões "Salvar" e "Cancelar" Clicando em "Salvar", o tipo "Ferro" será adicionado instantaneamente ao final da lista na tela "Tipos de clientes".

Como a atualização foi instantânea, sabemos que há algum mecanismo que faz nossa tela ser rebuildada quando um tipo de cliente é criado! Ou seja, também é importante termos noções de gerenciamento de estados, mais especificamente, o Provider.

Utilizando o menu lateral, voltaremos para a página de clientes. Atualmente, a tela está vazia, então vamos interagir com o FAB no canto inferior direito para criar um cliente.

Uma caixa de diálogo será aberta no centro da tela, com um formulário para cadastro de novo cliente:

Nome: Kako
Email: kako@alura.com.br
Tipo: Ferro
Na parte inferior do formulário, clicaremos no botão "Salvar" e o cliente "Kako (Ferro)" será adicionado instantaneamente à lista. À direita dele, há um ícone que corresponde ao tipo Ferro.

Por fim, vamos acessar o menu lateral e selecionar a opção "Sair". Como esperado, o aplicativo será fechado.

Assim, conseguimos interagir com o aplicativo, conhecer suas funcionalidades e ter um melhor entendimento do projeto como um todo.

O código
Já checamos como o aplicativo funciona no dispositivo, então o próximo passo é explorar o código! Como estamos em um nível intermediário de conhecimento de Flutter e já temos experiência em análise de códigos, recomendamos que você explore o código por conta própria.

Neste vídeo, vamos conferir rapidamente alguns desses arquivos e indicar alguns pontos para serem avaliados.

Na pasta "lib", vamos abrir o main.dart. Esse arquivo possui um MultiProvider, então é importante que tenhamos conhecimentos sobre ele.

Temos também as pastas de telas, componentes e modelos. Como essas telas funcionam, como essas páginas navegam entre si? Será que é por rota, pelo Navigator com os métodos push() e pop()? É um ponto importante para se avaliar.

Na pasta "models", temos os modelos de clientes — como cada um deles funciona, como são adicionados ou modificados. Na linha 4 do arquivo clients.dart, reparamos que ele possui um ChangeNotifier, então é necessário compreender gerenciamento de estados com Provider.

Analisando os arquivos client.dart e client_type.dart, notamos que são modelos simples de informações que vamos manipular.

Portanto, recomendamos que você confira todos os arquivos e leia o código para ter uma ideia de como o projeto funciona. Caso não tenha familiaridade com algum elemento, você pode nos perguntar no fórum!

Após essa avaliação, nossa missão (e a da Dandara) será criar testes que garantam que o aplicativo funcione como deve funcionar! Começaremos com os testes mais simples (os testes de unidade) e depois escalaremos até os testes de integração!

@@04
Criando testes de unidade

Vamos começar com os testes mais fáceis: os testes de unidade.
Além de ser uma boa estratégia começar com o mais e progredir para o mais complexo, os testes de unidade garantem a qualidade da base do aplicativo. Se não garantirmos a base, todo o resto pode desmoronar! Logo, é importante fazer testes de unidade nos modelos do nosso projeto.

Vamos abrir nosso projeto no Android Studio. Na estrutura de arquivos à esquerda, temos uma pasta chamada "models" com quatro modelos:

client.dart
client_type.dart
clients.dart
types.dart
No arquivo client.dart, temos um modelo simples que recebe um nome, um e-mail e um tipo. Essas informações são obrigatórias.

No arquivo clients.dart, temos uma lista de clientes. Nós podemos manipulá-la, adicionando ou removendo clientes de algumas posições da lista.

No arquivo client_type.dart, temos uma classe que recebe um nome e um ícone, correspondente ao tipo do cliente.

No arquivo types.dart, temos uma lista de tipos que podemos manipular, adicionando ou removendo elementos, conforme seu index.

Criando testes de unidade
A seguir, realizaremos testes de unidade nesses modelos. Não vamos fazer o passo a passo desse processo, pois trata-se de um assunto que já estudamos no curso Flutter: aplicando testes de unidade, de Widget e Mocks.

Em vez disso, vamos revisar rapidamente o código já pronto para recapitular como esses testes são estruturados. Na pasta "test", criaremos um arquivo chamado unit_test.dart com o seguinte conteúdo:

import 'package:client_control/models/client.dart';
import 'package:client_control/models/client_type.dart';
import 'package:client_control/models/clients.dart';
import 'package:client_control/models/types.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Clients Test', () {
    final kako = Client(
        name: 'Kako',
        email: 'kako@alura.com.br',
        type: ClientType(name: 'Gold', icon: Icons.star));

    test('Clients model should add new client', () {
      var clients = Clients(clients: []);
      clients.add(kako);
      clients.add(kako);
      expect(clients.clients, [kako, kako]);
    });

    test('Clients model should remove old client', () {
      var clients = Clients(clients: [kako, kako, kako]);
      clients.remove(0);
      clients.remove(1);
      expect(clients.clients, [kako]);
    });
  });

  group('Types Test', () {
    final gold = ClientType(name: 'Gold', icon: Icons.star);

    test('Types model should add new type', () {
      var types = Types(types: []);
      types.add(gold);
      types.add(gold);
      expect(types.types, [gold, gold]);
    });
    test('Types model should remove old type ', () {
      var types = Types(types: [gold, gold, gold]);
      types.remove(0);
      types.remove(1);
      expect(types.types, [gold]);
    });
  });
}
COPIAR CÓDIGO
A seguir, vamos conferir esse código por partes.

Da linha 1 a 6, temos todos as importações necessárias para que os testes funcionem — todos os clientes, o material.dart e o flutter_test.dart:

import 'package:client_control/models/client.dart';
import 'package:client_control/models/client_type.dart';
import 'package:client_control/models/clients.dart';
import 'package:client_control/models/types.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
COPIAR CÓDIGO
A partir da linha 8, temos o void main(), no qual criamos dois grupos de testes:

a partir da linha 9, o grupo de testes de cliente
a partir da linha 29, o grupo de testes de tipos
No primeiro grupo, criamos o cliente kako. Seu nome é "Kako", seu e-mail é "kako@alura.com.br" e seu tipo é "Gold", com o ícone de uma estrela:

// ...

void main() {
  group('Clients Test', () {
    final kako = Client(
        name: 'Kako',
        email: 'kako@alura.com.br',
        type: ClientType(name: 'Gold', icon: Icons.star));

// ...
COPIAR CÓDIGO
O primeiro teste serve para garantir que é possível adicionar um cliente na lista de clientes. Criamos uma variável chamada clients, que é uma lista de clientes Clients(). Inicialmente, a lista está vazia.

Nas linhas 17 e 18, usamos o método add() para adicionar o cliente kako duas vezes. Na linha 19, indicamos que o resultado esperado é que a variável clients tenha dois elementos kako na lista:

// ...

test('Clients model should add new client', () {
    var clients = Clients(clients: []);
    clients.add(kako);
    clients.add(kako);
    expect(clients.clients, [kako, kako]);
});

// ...
COPIAR CÓDIGO
O segundo teste serve para garantir que é possível remover clientes. Criamos uma lista de clientes com três clientes kako. Nas linhas 24 e 25, usamos o método remove() para remover os clientes das posições 0 e 1. Por fim, indicamos que o resultado esperado é uma lista com apenas um cliente kako:

// ...

test('Clients model should remove old client', () {
    var clients = Clients(clients: [kako, kako, kako]);
    clients.remove(0);
    clients.remove(1);
    expect(clients.clients, [kako]);
});

// ...
COPIAR CÓDIGO
Na sequência, temos o grupo de testes de tipo, que têm lógicas semelhantes às que acabamos de conferir. De início, criamos um tipo chamado "Gold", com o ícone de estrela:

// ...

group('Types Test', () {
    final gold = ClientType(name: 'Gold', icon: Icons.star);

// ...
COPIAR CÓDIGO
O primeiro teste checa se é possível adicionar um novo tipo à lista de tipos. Começamos com uma lista vazia e adicionamos o tipo "gold" duas vezes. Depois, indicamos que o resultado esperado é que a lista de tipos tenha dois elementos "gold":

// ...

test('Types model should add new type', () {
    var types = Types(types: []);
    types.add(gold);
    types.add(gold);
    expect(types.types, [gold, gold]);
});

// ...
COPIAR CÓDIGO
O segundo teste checa a funcionalidade de remoção de tipos. Criamos uma lista com três tipos "gold"; removemos os elementos das posições 0 e 1; e espera-se que sobre apenas um tipo "gold":

// ...

test('Types model should remove old type ', () {
    var types = Types(types: [gold, gold, gold]);
    types.remove(0);
    types.remove(1);
    expect(types.types, [gold]);
});

// ...
COPIAR CÓDIGO
Esses são nossos testes de unidade! Nosso objetivo era passar rapidamente pelo código, então sinta-se à vontade para analisá-lo com calma e em detalhes.

Executando testes de unidade
A seguir, executaremos os testes para conferir se eles passarão. No canto esquerdo da linha 8, vamos clicar no ícone verde de play e selecionar "Run tests in unit_test.dart". Alternativamente, podemos usar o atalho "Ctrl + Shift + F10". No terminal, após alguns segundos, notaremos que os quatro testes passaram!

Vale lembrar que não vamos alterar o projeto! O projeto não é nosso, somos responsáveis apenas por desenvolver os testes!

Para entender melhor, vamos pensar em um exemplo. Vamos supor que a pessoa responsável pelo projeto decidiu alterar o modelo de cliente e inserir um campo booleano obrigatório para informar se a pessoa cliente é canhota ou destra. Por exemplo:

// CÓDIGO DE EXEMPLO

import 'package:client_control/models/client_type.dart';

class Client {
  String name;
  String email;
  ClientType type;
  bool destro;

  Client({
    required this.name,
    required this.email,
    required this.type,
    required this.destro
  });
}
COPIAR CÓDIGO
Com essa mudança, os testes que desenvolvemos param de passar. Na linha 10 do arquivo unit_test.dart, a palavra Client fica sublinhada em vermelho como indicação de erro, pois o parâmetro destroé obrigatório, mas não o informamos.

Em outras palavras, caso haja alterações no futuro, os testes nos avisarão se é possível fazer determinadas alterações e garantir que tudo continuará funcionando.

No caso, este foi só um exemplo. Não vamos implementar esse campo no projeto! O arquivo client.dart continua assim:

import 'package:client_control/models/client_type.dart';

class Client {
  String name;
  String email;
  ClientType type;

  Client({
    required this.name,
    required this.email,
    required this.type
  });
}
COPIAR CÓDIGO
Portanto, realizamos os testes de unidade. O próximo passo é fazer testes de widget para conferir se tudo está funcionando como esperado.

@@05
Criando testes de widget

A seguir, vamos focar nos testes de widget.
Não é preciso fazer testes em widgets padrões do Flutter, como Column, Row, Floating-Action-Button e Scaffold. No entanto, é importante o realizarmos nos componentes criados no projeto.

Ao clicar no ícone de menu no canto superior esquerdo do aplicativo, o menu é aberto na lateral esquerda da tela. Esse menu é um widget Drawer customizado e é ele que vamos testar. O código referente a ele está no arquivo hamburger_menu.dart, na pasta "lib > components":

import 'dart:io';
import 'package:flutter/material.dart';

class HamburgerMenu extends StatelessWidget {
  const HamburgerMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.indigo,
            ),
            child: Text(
            'Menu',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 20
            )),
          ),
          ListTile(
            title: const Text('Gerenciar clientes'),
            onTap: () {
              Navigator.pushNamed(context, '/');
            },
          ),
          const Divider(),
          ListTile(
            title: const Text('Tipos de clientes'),
            onTap: () {
              Navigator.pushNamed(context, '/tipos');
            },
          ),
          const Divider(),
          ListTile(
            title: const Text('Sair'),
            onTap: () {
              exit(0);
            },
          ),
        ],
      ),
    );
  }
}
COPIAR CÓDIGO
Na linha 9, reparamos que se trata de um Drawer. Nele, consta uma lista com várias informações, entre elas: o cabeçalho escrito "Menu" (linha 18), a navegação para "Gerenciar clientes" (linha 26) e "Tipos de Clientes" (linha 33), e a funcionalidade de sair.

Portanto, precisamos garantir que esse Drawer customizado funcione em todas as etapas. Se alguém alterar esse widget, os testes terão que avisar o que continua ou não funcionando, para garantir a qualidade do código.

Existem outros widgets que podemos testar em nosso projeto, como o icon_picker.dart. Neste curso, vamos focar apenas no menu, pois demandaria muito tempo testar todos os componentes. Contudo, em um cenário real, é importante sempre testarmos todos os componentes!

Inclusive, fica como desafio: você pode desenvolver testes de widget para o icon_picker.dart e nos mostrar os resultados no fórum ou no Discord.

Teste de widget
Assim como fizemos com os testes de unidade, não vamos focar em como desenvolver os testes de widget, pois estudamos esse assunto em cursos anteriores. Em vez disso, vamos recapitular rapidamente o código já pronto.

Na pasta "test", criaremos o arquivo widget_test.dart com o seguinte conteúdo:

import 'dart:math';

import 'package:client_control/components/hamburger_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Testing the Menu', () {
    testWidgets('Hamburguer Menu should have "Menu"', (tester) async {
      await tester.pumpWidget(MaterialApp(
        home: HamburgerMenu(),
      ));
      expect(find.text('Menu'), findsOneWidget);
    });

    testWidgets('Hamburguer Menu should have "Gerenciar clientes"', (tester) async {
      await tester.pumpWidget(MaterialApp(
        home: HamburgerMenu(),
      ));
      expect(find.text('Gerenciar clientes'), findsOneWidget);
    });
    testWidgets('Hamburguer Menu should have "Tipos de clientes"', (tester) async {
      await tester.pumpWidget(MaterialApp(
        home: HamburgerMenu(),
      ));
      expect(find.text('Tipos de clientes'), findsOneWidget);
    });

    testWidgets('Hamburguer Menu should have "Sair"', (tester) async {
      await tester.pumpWidget(MaterialApp(
        home: HamburgerMenu(),
      ));
      expect(find.text('Sair'), findsOneWidget);
    });
  });
}
COPIAR CÓDIGO
Para testar o menu, criamos apenas um grupo. Na linha 9, verificarmos se a informação "Menu" consta no componente. Vale lembrar que estamos lidando com testWidgets(), que possui um tester e um assincronismo. Precisamos esperar o tester renderizar a tela, que começa com MaterialApp, dado que é um requisito para a existência do HamburgerMenu.

Após o carregamento da tela, na linha 13, pedimos para o tester buscar o texto "Menu" — que aparece no canto superior esquerdo do menu:

// ...

void main() {
  group('Testing the Menu', () {
    testWidgets('Hamburguer Menu should have "Menu"', (tester) async {
      await tester.pumpWidget(MaterialApp(
        home: HamburgerMenu(),
      ));
      expect(find.text('Menu'), findsOneWidget);
    });

// ...
COPIAR CÓDIGO
Ou seja, caso alguém delete essa informação, o teste acusará um erro.

Na linha 16, realizamos um teste para verificar se temos "Gerenciar clientes". Trata-se de um processo semelhante ao anterior — vamos buildar a tela e procurar pelo texto em questão:

// ...

testWidgets('Hamburguer Menu should have "Gerenciar clientes"', (tester) async {
    await tester.pumpWidget(MaterialApp(
        home: HamburgerMenu(),
    ));
    expect(find.text('Gerenciar clientes'), findsOneWidget);
});

// ...
COPIAR CÓDIGO
É imprescindível encontrar o texto "Gerenciar clientes", exatamente da forma que foi digitado! Além disso, espera-se que seja encontrado apenas um widget onde esse texto apareça.

Na sequência, realizamos o mesmo teste com "Tipos de clientes" e "Sair":

// ...

testWidgets('Hamburguer Menu should have "Tipos de clientes"', (tester) async {
    await tester.pumpWidget(MaterialApp(
        home: HamburgerMenu(),
    ));
    expect(find.text('Tipos de clientes'), findsOneWidget);
});

testWidgets('Hamburguer Menu should have "Sair"', (tester) async {
    await tester.pumpWidget(MaterialApp(
        home: HamburgerMenu(),
    ));
    expect(find.text('Sair'), findsOneWidget);
});

// ...
COPIAR CÓDIGO
Assim, estamos verificando se o menu está funcionando como esperado. Então, vamos executar os testes. No canto esquerdo da linha 7, pressionaremos o ícone de play e selecionamos "Run tests in widget_test.dart". Alternativamente, podemos usar o atalho "Ctrl + Shift + F10". No terminal, vamos conferir que todos os testes passaram.

Novamente, vamos supor que a pessoa responsável pelo projeto decidiu alterar o aplicativo depois da entrega dos testes. Ela modificou os nomes dos menus, substituindo "Gerenciar clientes" por "Clientes" e "Tipos de clientes" por "Tipos".

O arquivo hamburger_menu.dart ficaria assim:

// CÓDIGO DE EXEMPLO

ListTile(
    title: const Text('Clientes'),
    onTap: () {
        Navigator.pushNamed(context, '/');
    },
),
const Divider(),
ListTile(
    title: const Text('Tipos'),
    onTap: () {
        Navigator.pushNamed(context, '/tipos');
    },
)

// ...
COPIAR CÓDIGO
Imediatamente, nossos testes param de passar! Voltando ao arquivo widget_test.dart, vamos pressionar "Ctrl + Shift + F10" para executar todos os testes. Como resultado, teremos uma mensagem de erro indicando que não foi encontrado nenhum widget com o nome "Gerenciar cliente", como esperado:

The following TestFailure was thrown running a test:
Expected: exactly one matching node in the widget tree

Actual: _TextFinder : <zero widgets with text "Gerenciar clientes" (ignoring offstage widgets)>

Which means none were found but one was expected

Ou seja, os testes garantem a qualidade do código. Uma pessoa só consegue alterar o projeto se confirmar que os testes devem ser alterados também.

Mais testes
Testes de unidade são únicos, não dependem de outros elementos. Testes de widget também não dependem de muitos outros recursos, apenas alguns detalhes. Contudo, o aplicativo depende de muitos detalhes, então é preciso desenvolver testes de integração.

Por exemplo: anteriormente, acessamos o menu "Tipo de clientes" e adicionamos o tipo de cliente "Ferro". Uma vez criado, esse novo tipo deve estar disponível no momento de cadastro de clientes. Essa comunicação entre tipos e clientes necessita de um gerenciamento de informações.

Quando passamos a testar o aplicativo como um todo, os testes ficam um pouco mais complicados. Se tentarmos averiguar tudo só com testes de unidade e de widget, não será o suficiente, pois há uma codependência entre os elementos. Então, vamos começar a usar os testes de integração!

@@06
Testes

No decorrer desta aula, revisamos conceitos importantes dos testes!
Acompanhamos a “saga” da Dandara em busca de garantir a qualidade do app Client Control e os diversos testes aplicados: de unidade e de widgets.

Vamos repassar os pontos mais relevantes? Assinale apenas as alternativas verdadeiras:

Para criar um teste de unidade, precisamos utilizar o método test(), que necessita de uma descrição e de um corpo responsável por conter os testes de unidades simples.
 
Corretíssimo! O método test() é essencial para a construção de um teste de unidade e nele precisamos colocar uma descrição bem definida e. no body , devemos criar a lógica do que desejamos testar.
Alternativa correta
Quando utilizamos a função expect(find.text('Sair'),findsOneWidget); , significa que, em nosso teste, esperamos encontrar apenas um elemento com o texto “Sair”.
 
Perfeito! O expect é uma função que precisa de um finder e de um matcher que são responsáveis por procurar um elemento na tela renderizada e comparar com o que desejamos encontrar, respectivamente.
Alternativa correta
Para criar um teste de unidade, precisamos utilizar o método group(), que necessita de uma descrição e de um corpo responsável por conter os testes de unidades simples.
 
Alternativa correta
Ao criar um teste de Widget, devemos usar o método testWidget() . Não é obrigatório que implementemos o assincronismo, dado que a função await tester.pumpWidget() não precisa ser utilizada sempre.

@@07
Realizando testes de integração

A Dandara está trabalhando conosco no desenvolvimento de testes de unidade e de widget. Além dos que implementamos nos vídeos anteriores, ela foi além e desenvolveu todos os testes de unidade e todos os testes de widget possíveis, como o icon picker.
Ainda assim, Dandara está insegura. Será que esses testes são suficientes para garantir a qualidade do aplicativo? Será que esquecemos de testar algum ponto?

Na verdade, esquecemos de algo muito importante! Não há como testarmos todos os elementos separadamente e garantir que tudo funcionará quando estiverem juntos. O aplicativo funciona a partir da integração de vários componentes e é preciso testar essa integração.

Exemplo de integração
Para entender melhor, vamos pensar em um exemplo. No aplicativo, vamos abrir o menu e acessar a tela "Tipos de clientes". Nela, temos os quatro clientes padrões listados:

Platinum
Golden
Titanium
Diamond
Vamos clicar no botão do canto inferior direito para adicionar um novo tipo de nome "Bronze" com um ícone qualquer, como o de uma pessoa correndo. Depois, clicaremos em "Salvar" ao final do formulário.

Agora, vamos conferir se esse novo tipo aparece como opção no cadastro de um novo cliente. Vamos abrir o menu, acessar a tela "Gerenciar clientes" e clicar no botão no canto inferior direito para checar o formulário de cadastro de cliente. No campo de tipo, o tipo "Bronze" aparece como última opção.

Este é um exemplo de integração entre os tipos e os clientes!

Teste de integração
Nós precisamos garantir que, ao adicionar um novo tipo de cliente, ele aparecerá como opção no cadastro de clientes. Não se trata de um teste simples, dado que temos elementos diferentes integrados.

Então, é hora de produzir um teste de integração! Diferentemente dos testes padrões, começaremos abrindo o arquivo pubspec.yaml, pois é necessário adicionar alguns pontos nele.

Na linha 39, temos o dev_dependencies com flutter_test. Vamos adicionar uma nova dependência, chamada integration_test:

# ...

dev_dependencies:
  integration_test:
    sdk: flutter 
  flutter_test:
    sdk: flutter

# ...
COPIAR CÓDIGO
Para nos certificar de que esses recursos funcionarão, é importante conferir se não há erros de digitação e usar a indentação corretamente.

Na parte superior, clicaremos em "Pub get". Assim, implementaremos a possibilidade de criar testes de integração.

Idealmente, o teste de integração deve ficar separado dos demais testes. Então, na raiz do projeto, criaremos um diretório chamado "integration_test". Ao criá-lo, notaremos que ele já tem um ícone de teste (uma seta vermelha para esquerda e um seta verde para a direita).

É importante ressaltar: esta nova pasta chamada "integration_test" não está dentro de "lib" e não está dentro de "tests". Ela está na raiz do projeto!
Dentro de "integration_test", criaremos um arquivo chamado app_test.dart, onde desenvolveremos nossos testes de integração!

O primeiro passo é criar o void main().:

void main() {

}
COPIAR CÓDIGO
Em seguida, chamaremos a função ensureInitialized() da classe IntegrationTestWidgetFlutterBinding. Uma importação será feita automaticamente no início do arquivo:



import 'package:integration_test/integration_test.dart';

void main(){
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
}
COPIAR CÓDIGO
Essa função é essencial, pois garante que o aplicativo rodará no emulador, antes de fazer os testes. Esse é um dos pontos legais dos testes de integração: nós podemos acompanhá-lo em tempo real no emulador! Inclusive, é possível realizar testes em diversos dispositivos!

Na sequência, no início do arquivo, vamos importar a função main do nosso projeto, que está no client_control. Ao final da importação, adicionaremos as app para atribuir o nome "app":



import 'package:integration_test/integration_test.dart';
import 'package:client_control/main.dart' as app;
void main(){
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

}
COPIAR CÓDIGO
Depois de chamar a função ensureInitialized(), criaremos um testWidgets() para produzir o teste de integração. Sua descrição será "Integration Test". Assim como os demais testes, precisaremos de um tester assíncrono:



import 'package:integration_test/integration_test.dart';
import 'package:client_control/main.dart' as app;
void main(){
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Integration Test', (tester) async {

  });

}
COPIAR CÓDIGO
A seguir, não vamos rodar apenas um widget, nós executaremos o projeto inteiro! Ou seja, chamaremos o método main() de app:



import 'package:integration_test/integration_test.dart';
import 'package:client_control/main.dart' as app;
void main(){
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Integration Test', (tester) async {
    app.main();
  });

}
COPIAR CÓDIGO
Antes de rodar os testes, precisamos garantir que todos os microprocessos foram realizados com validade e todas as animações do main() acabaram. Portanto, usaremos await tester.pumpAndSettle():



import 'package:integration_test/integration_test.dart';
import 'package:client_control/main.dart' as app;
void main(){
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Integration Test', (tester) async{
    app.main();
    await tester.pumpAndSettle();
  });

}
COPIAR CÓDIGO
O primeiro teste será bem simples: na tela inicial do aplicativo, vamos verificar se o menu abre quando clicamos no ícone de menu no canto superior esquerdo.

Primeiramente, vamos aplicar a função expect(). Ao usar o método find.text() para buscar a palavra "Menu", esperamos não encontrar nada, porque inicialmente estamos na tela de clientes e não consta a palavra "Menu":



import 'package:integration_test/integration_test.dart';
import 'package:client_control/main.dart' as app;
void main(){
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Integration Test', (tester) async{
    app.main();
    await tester.pumpAndSettle();
    expect(find.text('Menu'), findsNothing);
  });

}
COPIAR CÓDIGO
Depois, vamos programar o tester para dar um tap no ícone de menu. Para tanto, será necessário importar o pacote Material no início do arquivo:



import 'package:flutter/material.dart';
import 'package:integration_test/integration_test.dart';
import 'package:client_control/main.dart' as app;
void main(){
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Integration Test', (tester) async{
    app.main();
    await tester.pumpAndSettle();
    expect(find.text('Menu'), findsNothing);
    await tester.tap(find.byIcon(Icons.menu));
  });

}
COPIAR CÓDIGO
O tester buscará o ícone do menu e dará um tap nele. Depois, usaremos o método pumpAndSettle() para aguardar o término de todos os microprocessos novamente. Em seguida, vamos buscar pela palavra "Menu" mais uma vez e, dessa vez, esperamos encontrar um widget:



import 'package:flutter/material.dart';
import 'package:integration_test/integration_test.dart';
import 'package:client_control/main.dart' as app;
void main(){
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Integration Test', (tester) async{
    app.main();
    await tester.pumpAndSettle();
    expect(find.text('Menu'), findsNothing);
    await tester.tap(find.byIcon(Icons.menu));
    await tester.pumpAndSettle();
    expect(find.text('Menu'), findsOneWidget);
  });

}
COPIAR CÓDIGO
Este é o nosso teste de integração! Vamos executá-lo, clicando no ícone de play à esquerda linha em que declaramos void main() e selecionando "Run tests in app_test.dart". Alternativamente, podemos usar o atalho "Ctrl + Shift + F10".

Vamos abrir o emulador para acompanhar os testes em tempo real. A inicialização pode demorar um pouco, mas no momento em que os testes começarem, eles acabarão em praticamente 2 segundos! É tão rápido que nem dá tempo de acompanhar! A ideia dos testes automatizados é justamente serem rápidos e eficientes.

Para podermos visualizar os testes, vamos acrescentar algumas linhas no nosso código com Future.delayed() para fazer pausas de 2 segundos e dar tempo de acompanharmos o que o tester realizou:



import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:client_control/main.dart' as app;
void main(){
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Integration Test', (tester) async{
    app.main();
    await tester.pumpAndSettle();
    expect(find.text('Menu'), findsNothing);
    await Future.delayed(Duration(seconds: 2));
    await tester.tap(find.byIcon(Icons.menu));
    await Future.delayed(Duration(seconds: 2));
    await tester.pumpAndSettle();
    expect(find.text('Menu'), findsOneWidget);
    await Future.delayed(Duration(seconds: 2));
  });

}
COPIAR CÓDIGO
Após salvar as alterações, vamos rodar o teste novamente e acompanhá-lo no emulador.

O tester abrirá o aplicativo, procurará pela palavra "Menu" e não encontrará. Então, ele buscará pelo ícone de menu, clicará nele, procurará a palavra "Menu", achará e o teste será finalizado. No terminal do Android Studio, vamos reparar que o teste passou.

A nossa missão agora é criar um teste de integração para o aplicativo inteiro! Vamos testar todas as possíveis funcionalidades, desde criar tipos e clientes até sair do aplicativo.

@@08
Para saber mais: testes focados em performance

Agora que já exploramos os diversos tipos de testes, podemos entrar no mundo avançado da performance!
Pensa comigo: o objetivo dos testes é garantir a qualidade do aplicativo, correto? E o que mais pode ser associado à qualidade de uma Aplicativo? Isso mesmo: a performance!

E, para lembrar você desse tópico, separei um tópico da documentação do Flutter que trabalha com os testes focados em performa

https://docs.flutter.dev/cookbook/testing/integration/profiling

@@09
Faça como eu fiz

Vimos em aula como nosso projeto base funciona, relembramos os conceitos de teste de unidade e testes de Widget e, por último, implementamos um teste de integração que roda diretamente no nosso emulador!
Agora é a sua vez de praticar e explorar o os testes vistos em aula.

Assim, sugiro que você:

Produza um teste de Unidade;
Crie um teste de Widget (se quiser se desafiar, pode fazer do Widget que não testamos, o icon_picker.dart);
Implemente um teste de integração e verifique a eficácia do tester em primeira mão.
Caso você tenha feito alterações no projeto, mostre pra gente! Adoramos ver seu progresso no fórum e no Discord!

Se preferir, você pode conferir o commmit da aula no Github.
Caso você tenha dificuldade para entender os conceitos revisados, sugiro olhar o nosso curso Flutter: aplicando testes de unidade, de Widget e Mocks.

Você pode conferir as videoaulas anteriores.

Se ainda ficou algum dúvida, você pode pedir um auxílio no Fórum ou no Discord!

https://github.com/alura-cursos/alura_flutter_intermediario_curso_1

https://cursos.alura.com.br/course/flutter-testes-unidade-widget-mocks

@@10
O que aprendemos?

Nessa aula, você aprendeu:
Fazer testes de unidade:
Revimos alguns conceitos de testes de unidade para refrescar a memória, e utilizamos alguns métodos para testar as classes Type e Client.
Implementar testes de widget:
Relembramos os conceitos de teste de Widget e criamos um teste para verificar um dos Widgets customizados do projeto que nos foi entregue, o hamburguer_menu.dart.
Aplicar testes de integração:
Aprendemos um novo conceito e produzimos um teste de integração, capaz de verificar a dependência entre dois elementos distintos e ainda visualizar a ação ocorrendo em tempo real através do nosso emulador!

#### 07/01/2023

@02-Implementando testes de ponta a ponta

@@01
Projeto da aula anterior
PRÓXIMA ATIVIDADE

Você pode ir acompanhando o passo a passo do desenvolvimento do nosso projeto e, caso deseje, pode baixar o projeto da aula anterior.
Bons estudos!

@@02
Criando teste manual

Já criamos o nosso primeiro teste de integração, porém ele está bastante simples. A ideia agora é analisarmos o que precisamos testar no aplicativo do início ao fim (de uma ponta até a outra ponta).
Para isso, faremos um teste manual listando passo a passo cada uma das ações. Com isso, vamos testando todas essas ações conforme for listado.

O que precisamos testar?
Tela inicial (tela de clientes)
Verificar se o drawer está completo
Testar a navegação
Verificar a tela "Tipos de clientes"
Criar um novo tipo de cliente
Criar um novo cliente com o novo tipo
Verificar o que não é necessário testar
Vamos testar a tela inicial, para verificarmos se ela realmente com os elementos detalhados, como se os ícones de menu e do floating action button estão clicáveis. Depois vamos clicar no ícone de menu para verificar se drawer está completo, analisando se está com todas as informações (Gerenciar clientes, Tipos de clientes e Sair).

Logo após, iniciamos os testes de navegação. Será que ao clicarmos em "Gerenciar clientes" do menu do aplicativo, seremos redirecionados para a tela de clientes? Precisamos verificar essa navegação!

Se voltarmos no drawer (ícone do menu) e clicarmos em "Tipos de clientes", ele vai para essa tela de clientes mesmo? Se a navegação estiver funcionando, passamos para o próximo teste.

O próximo passo é justamente a tela "Tipos de clientes". Estamos com todos os elementos? Esses elementos estão funcionando? Temos os tipos de clientes? Temos o ícone de menu e o floating action button? Em tipos de clientes, precisamos ter:

Tipos de clientes
Platinum
Golden
Titanium
Diamond
Após verificarmos e concluirmos que está tudo certo, o próximo teste é criar no floating action button e criar um novo tipo de cliente.

Após clicarmos no floating action button da página "Tipos de clientes", será exibido uma janela solicitando um nome, escrevemos "Ferro". Depois clicamos em "Selecionar ícone" e escolhemos o gift card.

Tipos de clientes
Platinum
Golden
Titanium
Diamond
Ferro
Ao clicarmos no botão "Salvar" para adicionarmos um novo tipo, ele é exibido na nossa tela "Tipos de clientes"? Se sim, passamos para o próximo passo.

Será que conseguimos criar um cliente com esse novo tipo? Vamos precisar navegar para a tela "Gerenciar clientes" (através do drawer) e na tela de clientes clicamos no floating action button no canto inferior direito e, desta vez, cadastrar um novo cliente.

Ao clicarmos, será exibida uma tela intitulada "Cadastrar cliente" com os campos "Nome" e "Email", com outro campo para selecionarmos o tipo de cliente. Abaixo e mais à direita, os botões "Salvar" e "Cancelar". Em "Tipo" observe que já consta o novo tipo que acabamos de criar!

Preencheremos:

Cadastrar cliente
Nome: Kako
Email: kako@alura.com
Ferro
Ou seja, estamos integrando o tipo com o cliente. Logo após, clicamos em "Salvar". Observe que na página "Clientes" agora temos o "Kako(Ferro)" listado.

Com isso, falta testarmos apenas mais alguns detalhes, como o botão de "Sair". Para sair, clicamos no ícone de menu no canto superior esquerdo e depois em "Sair". Pronto!

O instrutor logará novamente no aplicativo para seguir com a lista de testes.
Até o momento foram listados sete passos, faltou verificarmos quais testes não vamos precisar realizar. Precisamos garantir o que não é tão importante assim, como testar se o ícone no floating action button é o ícone de mais. Será que precisamos testar se a cor ao clicarmos no drawer é azul? Precisamos testar se a tipagem e o tamanho da fonte são as especificadas?

É fundamental entendermos qual o nosso trabalho, por questão de demanda e tempo. Precisamos listar o que faremos e o que não faremos.

Neste curso, vamos testar as coisas básicas do funcionamento do nosso aplicativo. Assim, ajudaremos a Dandara a produzir todos os testes para ela entregar para o cliente, garantindo a qualidade do conteúdo do projeto. Não tudo o que contém no projeto, somente o funcionamento e o que pode dificultar a navegação da pessoa usuária do aplicativo.

Com a nossa lista de testes montada, vamos iniciar o nosso projeto.

Vamos lá?

@@03
Verificando navegação

Já sabemos o que precisamos fazer, então vamos lá!
O primeiro passo é verificarmos se ao abrirmos o aplicativo a nossa tela inicial de clientes contém o título, o ícone de menu e o floating action button.

Tela inicial de aplicativo. Na parte superior da tela temos a app bar na cor azul com o título "Clientes" escrito em branco e alinhado à esquerda temos o ícone de menu. Abaixo da app bar temos uma tela em branco. No canto inferior direito, temos um botão flutuante redondo e azul com um "+" escrito em branco dentro dele.

Então voltando ao nosso teste de integração, vamos buscar por esses elementos no teste automatizado.

No projeto, vamos em "integration_test > app_test", sendo onde temos os testes de integração.

app_test.dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:client_control/main.dart' as app;
void main(){
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Integration Test', (tester) async{
    app.main();
    await tester.pumpAndSettle();
    expect(find.text('Menu'), findsNothing);
    await Future.delayed(Duration(seconds: 2));
    await tester.tap(find.byIcon(Icons.menu));
    await Future.delayed(Duration(seconds: 2));
    await tester.pumpAndSettle();
    expect(find.text('Menu'), findsOneWidget);
    await Future.delayed(Duration(seconds: 2));
  });


}COPIAR CÓDIGO
Faremos algumas alterações. Nas linhas 14, 16 e 19 podemos remover o future delayed, nós o colocamos para conseguirmos visualizar o teste de integração (que foi tão rápido que não conseguimos acompanhar).

Por enquanto o nosso arquivo ficará:

app_test.dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:client_control/main.dart' as app;
void main(){
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Integration Test', (tester) async{
    app.main();
    await tester.pumpAndSettle();
    expect(find.text('Menu'), findsNothing);

    await tester.tap(find.byIcon(Icons.menu));

    await tester.pumpAndSettle();
    expect(find.text('Menu'), findsOneWidget);
  });

}COPIAR CÓDIGO
O nosso teste verificava se havia um menu da tela inicial, e não tinha. Depois clicava no ícone do menu e logo após se existia o texto "Menu". Era isso que ele fazia, e não é isso que desejamos agora.

Vamos verificar se ao invés de "Menu" existe o texto "Clientes". Por isso, em "find.text('')" digitamos "Clientes". E ele espera um matcher chamado "findsOneWidget".

app_test.dart
//código omitido

void main(){
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Integration Test', (tester) async{
    app.main();
    await tester.pumpAndSettle();
    expect(find.text('Clientes'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.menu));

    await tester.pumpAndSettle();
    expect(find.text('Menu'), findsOneWidget);
  });

}COPIAR CÓDIGO
Com isso, verificamos se existe o título "Clientes".

Agora vamos copiar (Ctrl + C) a linha 13 e colar (Ctrl + V) nas duas linhas seguintes:

app_test.dart
    expect(find.text('Clientes'), findsOneWidget);
        expect(find.text('Clientes'), findsOneWidget);
        expect(find.text('Clientes'), findsOneWidget);COPIAR CÓDIGO
Fizemos isso porque desejamos procurar por mais elementos. O outro elemento que queremos buscar não é um texto, e sim um ícone. Por isso, ao invés de "find.text" usaremos "find.byIcon()" passando "Icons.menu".

app_test.dart
//código omitido

void main(){
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Integration Test', (tester) async{
    app.main();
    await tester.pumpAndSettle();
    expect(find.text('Clientes'), findsOneWidget);
    expect(find.byIcon(Icons.menu), findsOneWidget);

    await tester.tap(find.byIcon(Icons.menu));

    await tester.pumpAndSettle();
    expect(find.text('Menu'), findsOneWidget);
  });

}COPIAR CÓDIGO
Por fim, buscaremos pelo floating action button. Por isso, vamos utilizar "find.byType()" passando o tipo floating action button.

app_test.dart
//código omitido

void main(){
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Integration Test', (tester) async{
    app.main();
    await tester.pumpAndSettle();
    expect(find.text('Clientes'), findsOneWidget);
    expect(find.byType(FloatingActionButton), findsOneWidget);

    await tester.tap(find.byIcon(Icons.menu));

    await tester.pumpAndSettle();
    expect(find.text('Menu'), findsOneWidget);
  });

}COPIAR CÓDIGO
Concluímos o nosso primeiro passo de testar a tela inicial (buscar por clientes, menu e o floating action button).

O que precisamos testar?
Tela inicial (tela de clientes) ✔
Verificar se o drawer está completo
Testar a navegação
Verificar a tela "Tipos de cliente"
Criar um novo tipo de cliente
Criar um novo cliente com o novo tipo
Verificar o que não é necessário testar
Agora o nosso próximo passo é verificarmos se quando clicarmos no ícone de menu o drawer é aberto com todos os elementos. Clicando no ícone menu do lado superior esquerdo do aplicativo, temos:

Gerenciar clientes
Tipos de clientes
Sair
Tela de Menu. Abaixo do cabeçalho com o título "Menu", dentro do drawer, temos uma lista de opções, sendo elas as telas Gerenciar clientes e Tipos de cliente e o botão "Sair". No canto inferior direito, temos o botão "+" que continua visível abaixo da camada do menu de drawer.

É isso que vamos verificar!

Voltando ao código, no arquivo "app_test", até o momento temos:

app_test.dart
//código omitido

    await tester.tap(find.byIcon(Icons.menu));
    await tester.pumpAndSettle();

    expect(find.text('Menu'), findsOneWidget);
  });

}COPIAR CÓDIGO
Ele deu um tap no nosso ícone de menu, esperou carregar e agora ele está esperando encontrar o texto "Menu". Quais os outros textos que desejamos analisar? "Gerenciar clientes", "Tipo de clientes" e "Sair". É por isso que vamos buscar também.

Com esse fim, vamos copiar a linha que contém o "expect()" inteira e colar nas três linhas seguintes.

app_test.dart
//código omitido

    await tester.tap(find.byIcon(Icons.menu));
    await tester.pumpAndSettle();

    expect(find.text('Menu'), findsOneWidget);
        expect(find.text('Menu'), findsOneWidget);
        expect(find.text('Menu'), findsOneWidget);
        expect(find.text('Menu'), findsOneWidget);
  });

}COPIAR CÓDIGO
Vamos substituir dentro do parêntese pelos textos que desejamos procurar. No caso será "Gerenciar clientes", "Tipos de clientes" e "Sair".

app_test.dart
//código omitido

    await tester.tap(find.byIcon(Icons.menu));
    await tester.pumpAndSettle();

    expect(find.text('Menu'), findsOneWidget);
    expect(find.text('Gerenciar clientes'), findsOneWidget);
    expect(find.text('Tipos de clientes'), findsOneWidget);
    expect(find.text('Sair'), findsOneWidget);
  });

}COPIAR CÓDIGO
Pronto, testamos o drawer. Para não nos perdermos, vamos inserir os passos no nosso teste, por exemplo, na linha 13 deixaremos um comentário informando que estamos testando tela inicial.

//código omitido

await tester.pumpAndSettle();
//Testando tela inicial

//código omitidoCOPIAR CÓDIGO
Logo após, na linha 17 (antes do tester.tap) escrevemos "// Testando o Drawer".

app_test.dart
//código omitido

  testWidgets('Integration Test', (tester) async{
    app.main();
    await tester.pumpAndSettle();
        //Testando tela inicial
    expect(find.text('Clientes'), findsOneWidget);
    expect(find.byIcon(Icons.menu), findsOneWidget);
    expect(find.byType(FloatingActionButton), findsOneWidget);

    // Testando o Drawer
    await tester.tap(find.byIcon(Icons.menu));
    await tester.pumpAndSettle();

    expect(find.text('Menu'), findsOneWidget);
    expect(find.text('Gerenciar clientes'), findsOneWidget);
    expect(find.text('Tipos de clientes'), findsOneWidget);
    expect(find.text('Sair'), findsOneWidget);
  });

}COPIAR CÓDIGO
O que precisamos testar?
Tela inicial (tela de clientes) ✔
Verificar se o drawer está completo ✔
Testar a navegação
Verificar a tela "Tipos de cliente"
Criar um novo tipo de cliente
Criar um novo cliente com o novo tipo
Verificar o que não é necessário testar
Testamos o drawer, qual o próximo passo? Precisamos testar a navegação e a tela "Tipos de clientes". Acrescentaremos um comentário depois da última linha escrito "//Testar a Navegação e a Tela de Tipos".

app_test.dart
//código omitido

    expect(find.text('Menu'), findsOneWidget);
    expect(find.text('Gerenciar clientes'), findsOneWidget);
    expect(find.text('Tipos de clientes'), findsOneWidget);
    expect(find.text('Sair'), findsOneWidget);

            //Testar a Navegação e a Tela de Tipos
  });

}COPIAR CÓDIGO
Voltando para o aplicativo, vamos clicar em "Tipos de clientes". Observe que somos redirecionados para uma nova tela, e com isso verificamos se essa alteração de tela (navegação) foi feita com qualidade e se fomos para a tela esperada.

Tela de Tipos de cliente. À esquerda do cabeçalho temos o ícone de Menu e abaixo temos uma lista de opções dos tipos categorizados, sendo elas: Platinum, Golden, Titanium e Diamond. No canto inferior direito, temos o botão "+".

Voltando ao código, após o comentário, escrevemos "await tester.tap();". Como temos que clicar nos tipos de clientes, dentro do parêntese vamos colocar "find.text()" passando "Tipos de clientes".

app_test.dart
//código omitido

    //Testar a Navegação e a Tela de Tipos
    await tester.tap(find.text('Tipos de clientes'));
  });

}COPIAR CÓDIGO
Após clicar, agora precisamos aguardar. Para isso, usamos o "tester.pumpAndSettle()" (espera carregar as telas e os microprocessos).

app_test.dart
//código omitido

    //Testar a Navegação e a Tela de Tipos
    await tester.tap(find.text('Tipos de clientes'));
    await tester.pumpAndSettle();
  });

}COPIAR CÓDIGO
Após clicar e esperar, verificamos se os elementos estão todos sendo exibidos na tela. Analisando na tela, precisamos buscar pelos seguintes textos, ícone e botão para verificarmos:

Tipos de cliente (texto)
Platinum (texto)
Golden (texto)
Titanium (texto)
Diamond (texto)
FloatingActionButton (botão)
Icons.menu (ícone)
Para buscar por esses elementos, usaremos o expect().

app_test.dart
//código omitido

    //Testar a Navegação e a Tela de Tipos
    await tester.tap(find.text('Tipos de clientes'));
    await tester.pumpAndSettle();

    expect(find.text('Tipos de cliente'), findsOneWidget);
    expect(find.byType(FloatingActionButton), findsOneWidget);
    expect(find.byIcon(Icons.menu), findsOneWidget);
    expect(find.text('Platinum'), findsOneWidget);
    expect(find.text('Golden'), findsOneWidget);
    expect(find.text('Titanium'), findsOneWidget);
    expect(find.text('Diamond'), findsOneWidget);
  });

}COPIAR CÓDIGO
Observe que no drawer o texto que buscamos é Tipos de clientes e na tela propriamente dita o título é Tipos de cliente.
Após procurarmos por todos esses elementos no teste, agora rodaremos para verificar se ele está buscando e encontrando esses textos, ícone e botão.

Clicamos no botão "▶", na linha 7 ou usamos o atalho "Ctrl + Shift + F10".

Como retorno no terminal, temos:

Built build\app\outputs\flutter-apk\app-debug.apk.
Installing build\app\outputs\flutter-apk\app.apk…

Testou, encontrou, passou! É muito rápido, né? Mas essa é a ideia do teste automatizado (rápido e eficiente). Até o momento, testamos:

O que precisamos testar?
Tela inicial (tela de clientes) ✔
Verificar se o drawer está completo ✔
Testar a navegação ✔
Verificar a tela "Tipos de cliente" ✔
Criar um novo tipo de cliente
Criar um novo cliente com o novo tipo
Verificar o que não é necessário testar
Na sequência, vamos criar um novo tipo de cliente. Te espero lá!

@@04
Criando um novo tipo

O que precisamos testar?
Tela inicial (tela de clientes) ✔
Verificar se o drawer está completo ✔
Testar a navegação ✔
Verificar a tela "Tipos de cliente" ✔
Criar um novo tipo de cliente
Criar um novo cliente com o novo tipo
Verificar o que não é necessário testar
Agora daremos o próximo passo no nosso na criação do teste de automatização: criar um novo tipo de cliente e verificar se essa criação foi bem-sucedida.

Para isso, vamos ao emulador do aplicativo clicar no botão "+" no canto inferior direito da tela de Tipos de cliente. Precisamos verificar se ao clicarmos no floating action button o nosso AlertDialog é aberto e se ao preenchermos o campo "Nome", selecionarmos um ícone e depois o botão "Salvar" será armazenado e exibido esse novo tipo na tela.

Tela com o alert dialog de cadastrar tipo aberto. No cabeçalho temos "Cadastrar tipo", e abaixo um text form field chamado "Nome". Logo após, há um botão "Selecionar ícone" e no canto inferior direito temos os botões "Salvar" e "Cancelar". Ao fundo, temos a tela "Tipos de cliente" que continua visível abaixo do nosso alert dialog.

Tela de Tipos de cliente. À esquerda do cabeçalho temos o ícone de Menu e abaixo temos uma lista de opções dos tipos categorizados, sendo elas: Platinum, Golden, Titanium e Diamond. No canto inferior direito, temos o botão "+".

Voltando ao código, após testarmos se a tela "Tipos de cliente" está completa, na linha seguinte adicionamos mais um comentário "Testar a criação de um Tipo de Cliente".

app_test.dart
//código omitido

    expect(find.text('Golden'), findsOneWidget);
    expect(find.text('Titanium'), findsOneWidget);
    expect(find.text('Diamond'), findsOneWidget);

        // Testar a criação de um Tipo de Cliente
  });

}COPIAR CÓDIGO
A primeira etapa é buscar e tocar (tap) no floating action button, para isso usamos o await tester.tap(find.byType()) buscando pelo floating action button.

app_test.dart
// código omitido

    // Testar a criação de um Tipo de Cliente

    await tester.tap(find.byType(FloatingActionButton));

  });


}COPIAR CÓDIGO
Com isso, encontramos e tocamos no nosso botão. Após tocar, aguardamos (toda vez que fizermos uma ação que navega e builda uma nova tela, precisamos esperar), para tal usamos o tester.pumpAndSettle().

app_test.dart
// código omitido

    // Testar a criação de um Tipo de Cliente

    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle();

  });


}COPIAR CÓDIGO
O ideal é que ao clicarmos no floating action button consigamos acessar o nosso alert dialog. Por isso, o nosso próximo passo é usarmos o expect() para procurar pelo alert dialog (como há somente um alertdialog usamos findsOneWidget).

app_test.dart
// código omitido

    // Testar a criação de um Tipo de Cliente

    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle();
    expect(find.byType(AlertDialog), findsOneWidget);

  });


}COPIAR CÓDIGO
O que temos dentro do alert dialog? Temos um input de texto (campo nome), um botão para selecionar o ícone, salvar e cancelar. A nossa primeira solicitação será pedir para o nosso robô escrever no campo "Nome" a palavra "Ferro", ou seja, criaremos um tipo de cliente chamado "Ferro".

Como solicitamos ao nosso tester que ele escreva? Usamos o método "enterText()" (procura um local para inserir um texto solicitado). Ele precisa procurar pelo TextFormField (lembrando que é classe e não o objeto), usando o find by type().

Como sabemos se é um Text Form Field ou um Text Field? Analisando no nosso código original (de quem nos enviou), verificamos se é um text form field e não um text field. Após encontrarmos esse text form field acrescentamos o texto "Ferro", sendo o que desejamos encontrar.

app_test.dart
// código omitido

    // Testar a criação de um Tipo de Cliente

    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle();
    expect(find.byType(AlertDialog), findsOneWidget);
    await tester.enterText(find.byType(TextFormField), 'Ferro');

  });


}COPIAR CÓDIGO
Essa é a nossa nova função para adicionar textos no text form field, ou no que quisermos adicionar textos. Agora vamos buscar e tocar no nosso botão "Selecionar ícones" (aplicamos a mesma lógica que utilizamos anteriormente).

Após usarmos o tap para abrir o "Selecionar ícone", solicitamos ao nosso tester que aguarde todos os microprocessos utilizando "tester.pumpAndSettle()". Não podemos esquecer de carregar!

app_test.dart
// código omitido

    // Testar a criação de um Tipo de Cliente

    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle();
    expect(find.byType(AlertDialog), findsOneWidget);
    await tester.enterText(find.byType(TextFormField), 'Ferro');

    await tester.tap(find.text('Selecionar icone'));
    await tester.pumpAndSettle();

  });


}COPIAR CÓDIGO
Após carregar tudo, selecionamos o ícone de presente (giftcard) (primeiro da esquerda para a direita). Observe que basta clicar no ícone que ele já abre e é exibido no alert dialog, abaixo do campo "Nome".

Aplicamos a mesma lógica do "Selecionar ícone" no gift card (clicar (tap) e aguardar o carregamento dos microprocessos). Porém, não será em um texto e sim em um ícone, portanto utilizamos o "find.byIcon()" passando o "Icons.card_giftcard".

app_test.dart
// código omitido

    // Testar a criação de um Tipo de Cliente

    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle();
    expect(find.byType(AlertDialog), findsOneWidget);
    await tester.enterText(find.byType(TextFormField), 'Ferro');

    await tester.tap(find.text('Selecionar icone'));
    await tester.pumpAndSettle();

    await tester.tap(find.byIcon(Icons.card_giftcard));
    await tester.pumpAndSettle();

  });


}COPIAR CÓDIGO
Após isso, clicamos no botão "Salvar" (que é um texto) e aguardamos (para verificar se o nosso novo tipo carregou na tela). Após clicarmos no botão "Salvar", buscamos pelo texto "Ferro" e pelo ícone "gift card" usando o expect().

app_test.dart
// código omitido

    // Testar a criação de um Tipo de Cliente

    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle();
    expect(find.byType(AlertDialog), findsOneWidget);
    await tester.enterText(find.byType(TextFormField), 'Ferro');

    await tester.tap(find.text('Selecionar icone'));
    await tester.pumpAndSettle();

    await tester.tap(find.byIcon(Icons.card_giftcard));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Salvar'));
    await tester.pumpAndSettle();
    expect(find.text('Ferro'), findsOneWidget);
    expect(find.byIcon(Icons.card_giftcard), findsOneWidget);

  });


}COPIAR CÓDIGO
Vamos testar para analisar se o nosso teste de integração está encontrando tudo que solicitamos. Para isso, clicamos no botão "▶" na cor verde do lado esquerdo da linha 7 (void main()) ou usamos o atalho "Ctrl + Shift + F10".

Na tela do emulador temos a mensagem "Test starting…", e observe que as telas são trocadas de forma bem rápida (nem conseguimos acompanhar direito). Clicou, criou o tipo "Ferro" e achou o texto! Isso significa que deu certo, foi em torno de 5 segundos de teste.

O que precisamos testar?
Tela inicial (tela de clientes) ✔
Verificar se o drawer está completo ✔
Testar a navegação ✔
Verificar a tela "Tipos de cliente" ✔
Criar um novo tipo de cliente ✔
Criar um novo cliente com o novo tipo
Verificar o que não é necessário testar
Na sequência, vamos verificar se há a possibilidade de criar um novo cliente com um novo tipo (no caso, ferro). Vamos lá?

Arquivo "app_test.dart" no GitHub

https://github.com/alura-cursos/alura_flutter_intermediario_curso_1/blob/Aula_2/integration_test/app_test.dart#L40

@@05
Entrada de texto
PRÓXIMA ATIVIDADE

Nesta aula, acompanhamos a evolução da Dandara no freela (trabalho autônomo) recebido por ela!
Assim, implementamos testes de ponta a ponta mais detalhados e iniciamos a criação de um novo tipo de cliente. Por último, vimos uma nova função do tester: a enterText() !

Vamos revisar? Assinale as alternativas verdadeiras:

O tester é o “robôzinho” que realiza ações durante o teste automatizado, a função enterText() precisa de um finder que procura o widget que recebe um texto e precisa de um segundo parâmetro que é o texto a ser inserido.
 
Perfeito, é um código simples, mas poderoso, para realizar ações durante o teste que necessitam da interação com formulários!
Alternativa correta
O enterText() é apenas mais um finder que tem como principal função localizar um widget que permite a entrada de um texto.
 
Alternativa correta
O tester utiliza do tap() para interagir com qualquer widget no teste e, ao interagir com o widget, ele pode inserir um texto utilizando o enterText().
 
Alternativa correta
O enterText() é um matcher responsável por comparar o texto com o que existe na tela!

@@06
Faça como eu fiz
PRÓXIMA ATIVIDADE

Iniciamos nossa jornada de construção de um teste de ponta a ponta, capaz de avaliar não só os widgets e telas, como também a integração entre os elementos do código e suas relações.
Agora é sua vez de reproduzir o que vimos em aula!

Assim, recomendamos que você siga os passos abaixo:

Liste todos os passos necessários para interagir com o aplicativo do inicio ao fim;
Lembre-se de verificar quais passos você deixou de testar e porque ao terminar de listá-los;
Comece a codar! Crie os testes na ordem em que você listou.
Dica: é importante que você utilize async e await.

O objetivo desta atividade é permitir que você pratique e veja se compreendeu bem a técnica abordada durante a videoaula.
Se quiser, pode consultar o commit desta implementação no GitHub.

Se tiver dúvidas, acione a gente lá no fórum ou discord!

Bons estudos!

https://github.com/alura-cursos/alura_flutter_intermediario_curso_1/commit/76ad1d90d76f81d6f3e0935e5237d9e1ad4d2d59

@@07
Para saber mais: Firebase Test
PRÓXIMA ATIVIDADE

Agora que já começamos a produzir nossos testes de integração, chegou a hora de explorarmos ferramentas externas muito usadas no mercado para facilitar os testes em diversos dispositivos!
O Firebase Test Lab é uma ferramenta que permite produzir e monitorar diversos testes em diferentes tipos de emuladores, para garantir que seu aplicativo vai funcionar com qualidade em diferentes celulares!

Para ajudar a matar sua curiosidade, separei um artigo externo, em inglês do Matt Rešetár que indica passo a passo como implementar testes usando o Firebase!

https://firebase.google.com/docs/test-lab

https://resocoder.com/2021/01/02/flutter-integration-test-tutorial-firebase-test-lab-codemagic/

@@08
O que aprendemos?
PRÓXIMA ATIVIDADE

Nesta aula, você aprendeu como:
Produzir um teste Manual:
Vimos que o primeiro passo para produzir um teste automatizado de ponta a ponta é fazer um teste manual (na mão mesmo!) e verificar quais são os passos detalhados para percorrer o aplicativo de uma ponta a outra.
Identificar os pontos necessários de testes:
Ao produzir o teste manualmente, verificamos que existem pontos importantes a ser testados (navegação, inserção de textos em formulários), assim como detalhes que não precisam da nossa atenção (a cor do menu lateral, por exemplo). Com esse senso crítico, podemos identificar e selecionar quais os passos a seguir para produzir o teste automatizado.
Testar a Navegação entre telas:
Na nossa lista, nossos passos iniciais estavam em navegar entre telas no aplicativo! Por isso, ensinamos ao nosso tester como verificar se a navegação está sendo realizada com maestria, uma vez que, ao clicar no botão que redireciona a tela, os novos elementos (informações da nova tela) aparecerão.
Utilizar o enterText() para adicionar um texto a um widget:
Durante nossa jornada, nos deparamos com uma situação inédita: a necessidade de inserir texto em um TextFormField para dar continuidade ao nosso teste. Essa necessidade foi sanada com a utilização de um novo método presente no tester : o enterText() que necessita de duas coisas: 1) um finder; e 2) do texto que será inserido no widget encontrado.