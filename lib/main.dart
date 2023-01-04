import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutterinitiation/my_flutter_app_icons.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Découverte de Flutter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.purple,
      ),
      home: const MyHomePage(title: 'Première page Flutter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class DeBox extends StatelessWidget {
  DeBox({Key? key, this.faceDe, this.description, this.valeur, this.image})
      : super(key: key);
  final String? faceDe;
  final String? description;
  final int? valeur;
  final String? image;

  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(2),
        height: 120,
        child: Card(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
              Image.asset("images/" + image!),
              Expanded(
                  child: Container(
                      padding: EdgeInsets.all(5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(this.faceDe!,
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text(this.description!),
                          Text("Valeur: " + this.valeur.toString()),
                        ],
                      )))
            ])));
  }
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int _randomNumber = 0;
  int currentPageIndex = 0;
  int _randomNumber1 = 0;
  int _randomNumber2 = 0;
  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  void _deCrementCounter() {
    setState(() {
      _counter--;
    });
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
  }

  void _randomCounter() {
    Random random = new Random();
    setState(() {
      _randomNumber = Random().nextInt(_counter + 1);
    });
  }

  void _randomNumbers() {
    Random random = new Random();
    setState(() {
      _randomNumber1 = Random().nextInt(_counter);
      _randomNumber2 = Random().nextInt(_counter + 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: <Widget>[
        Container(
          child: ListView(
            children: <Widget>[
              const Text(
                'Nombre :',
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headline4,
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Image.network(
                    "https://i.pinimg.com/736x/ce/28/24/ce28247e6760357c77c94401c6429995.jpg",
                    width: 100,
                    height: 100),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child:
                    Image.asset("images/DEYROS.png", width: 250, height: 250),
              ),
            ],
          ),
        ),
        Container(
          child: ListView(
            children: <Widget>[
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 20),
                ),
                onPressed: _randomCounter,
                child: Text('Générer un nombre aléatoire entre 0 et $_counter'),
              ),
              Text("Nombre aléatoire : $_randomNumber"),
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 20),
                ),
                onPressed: _randomNumbers,
                child: Text(
                    'Générer un calcul aléatoire avec deux nombres entre 0 et $_counter'),
              ),
              Text("$_randomNumber1 + $_randomNumber2 = ?"),
              TextField(
                keyboardType: TextInputType.number,
                maxLength: 25,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                decoration: InputDecoration(
                    labelText: 'Entrer la solution',
                    hintText: 'Entrer un nombre',
                    border: OutlineInputBorder()),
              ),
            ],
          ),
        ),
        Container(
            color: Colors.blue,
            alignment: Alignment.center,
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.fromLTRB(2.0, 10.0, 2.0, 10.0),
              children: <Widget>[
                DeBox(
                    faceDe: "1",
                    description: "La face 1 du dé",
                    valeur: 1,
                    image: "1.png"),
                DeBox(
                    faceDe: "2",
                    description: "La face 2 du dé",
                    valeur: 2,
                    image: "2.png"),
                DeBox(
                    faceDe: "3",
                    description: "La face 3 du dé",
                    valeur: 3,
                    image: "3.png"),
                DeBox(
                    faceDe: "4",
                    description: "La face 4 du dé",
                    valeur: 4,
                    image: "4.png"),
                DeBox(
                    faceDe: "5",
                    description: "La face 5 du dé",
                    valeur: 5,
                    image: "5.png"),
                DeBox(
                    faceDe: "6",
                    description: "La face 6 du dé",
                    valeur: 6,
                    image: "6.png"),
              ],
            )),
      ][currentPageIndex],
      floatingActionButton: Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 31),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: FloatingActionButton(
                onPressed: _deCrementCounter,
                child: Icon(Icons.exposure_minus_1),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: FloatingActionButton(
              onPressed: _incrementCounter,
              child: Icon(Icons.plus_one),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 30),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: FloatingActionButton(
                onPressed: _resetCounter,
                child: Text('Reset'),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentPageIndex,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.home),
            label: "Accueil",
          ),
          NavigationDestination(
            selectedIcon: Icon(MyFlutterApp.equals),
            icon: Icon(Icons.skip_next),
            label: "Page suivante",
          ),
          NavigationDestination(
            selectedIcon: Icon(MyFlutterApp.perspective_dice_six_two),
            icon: Icon(MyFlutterApp.perspective_dice_random),
            label: "Paramètres",
          ),
        ],
      ),
    );
  }
}
