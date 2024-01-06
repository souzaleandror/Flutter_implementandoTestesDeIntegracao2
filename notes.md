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