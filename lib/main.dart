import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

//toda widget é imutável
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //List<bool> hugeList = List.generate(1000, (index) => false);
  List<bool> selects = [false, false, false, false, false];
  List<String> labels = [
    "Android Nativo",
    "iOS Nativo",
    "React Native",
    "Flutter",
    "Ionic"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
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
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  List<Widget> buildWrapItens() {
    //DART
    return List.generate(5, (index) => buildChoiceItem(index));
  }

  ChoiceChip buildChoiceItem(int position) {
    return ChoiceChip(
      label: Text(labels[position]),
      selected: selects[position],
      onSelected: (value) {
        setState(() {
          selects[position] = value;
        });
      },
    );
  }

  List<Widget> buildListItens() {
    //DART
    return [
      if (selects[0]) getNativeAndroidOption,
      if (selects[1]) getNativeiOSOption,
      if (selects[2]) getReactNativeOption,
      if (selects[3]) getFlutterOption,
      if (selects[4]) getIonicOption
    ];
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
