import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'add_Language.dart';
import 'language.dart';

void main() {
  runApp(const MyApp()); //Widget
}

class MyApp extends StatelessWidget {
  //{} = atributo opcional
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        "/": (context) => const MyHomePage(),
        "/add": (context) => AddLanguage()
      },
    );
  }
}

//toda widget é imutável
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //List<bool> hugeList = List.generate(5, (index) => false);
  // List<bool> selects = [false, false, false, false, false];
  // List<String> labels = [
  //   "Android Nativo",
  //   "iOS Nativo",
  //   "React Native",
  //   "Flutter",
  //   "Ionic"
  // ];

  List<Language> itens = <Language>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Minhas Linguagens"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Wrap(
              spacing: 10,
              children: buildWrapItens(),
            ),
            Expanded(
              child: ListView(children: buildListItens()),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add_circle_outline),
        onPressed: () {
          Future future = Navigator.pushNamed(context, "/add");
          future.then((value) {
            debugPrint(value.name);
            debugPrint(value.detail);
          });
        },
      ),
    );
  }

  // List<Widget> buildWrapItens() {
  //   //DART
  //   return List.generate(5, (index) => buildChoiceItem(index));
  // }

  // ChoiceChip buildChoiceItem(int position) {
  //   return ChoiceChip(
  //     label: Text(labels[position]),
  //     selected: selects[position],
  //     onSelected: (value) {
  //       setState(() {
  //         selects[position] = value;
  //       });
  //     },
  //   );
  // }

  // List<Widget> buildListItens() {
  //   //DART
  //   return [
  //     if (selects[0]) getNativeAndroidOption,
  //     if (selects[1]) getNativeiOSOption,
  //     if (selects[2]) getReactNativeOption,
  //     if (selects[3]) getFlutterOption,
  //     if (selects[4]) getIonicOption
  //   ];
  // }

  List<Widget> buildWrapItens() {
    //DART
    return itens.map((language) => buildChoiceItem(language)).toList();
  }

  ChoiceChip buildChoiceItem(Language position) {
    return ChoiceChip(
      label: Text(position.name),
      selected: position.select,
      onSelected: (value) {
        setState(() {
          position.select = !position.select;
        });
      },
    );
  }

  List<Widget> buildListItens() {
    return itens
        .where((element) => element.select)
        .map((language) => getOption(language))
        .toList();
  }

  Widget getOption(Language language) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.android),
        title: Text(language.name),
        subtitle: Text(language.detail),
      ),
    );
  }

  Widget getNativeAndroidOption = const Card(
    child: ListTile(
      leading: Icon(Icons.android),
      title: Text('Android Nativo'),
      subtitle: Text('Linguagens C, Java e Kotlin'),
    ),
  );

  Widget getNativeiOSOption = Card(
    child: ListTile(
      leading: SvgPicture.asset("images/apple.svg"),
      title: const Text('iOS Nativo'),
      subtitle: const Text('Linguagens Objective-C e Swift'),
    ),
  );

  Widget getReactNativeOption = Card(
    child: ListTile(
      leading: SvgPicture.asset("images/react.svg"),
      title: const Text('React Native'),
      subtitle: const Text('Linguagens Web'),
    ),
  );

  Widget getFlutterOption = const Card(
    child: ListTile(
      leading: FlutterLogo(),
      title: Text('Flutter'),
      subtitle: Text('Linguagens DART e nativas'),
    ),
  );

  Widget getIonicOption = const Card(
    child: ListTile(
      leading: Icon(Icons.blur_circular),
      title: Text('Ionic'),
      subtitle: Text('Linguagens Web'),
    ),
  );
}
