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
        primarySwatch: Colors.purple,
      ),
      home: const MyHomePage(title: 'Première page Flutter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

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
  String _result = "";
  int _valueInt = 0;
  void _incrementCounter() {
    setState(() {
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

  void _showToast(BuildContext context, String _message) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(_message),
      ),
    );
  }

  List<String> listDeValeur = List.generate(20, (i) => (i + 1).toString());
  int _valueDropDown = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                onChanged: (value) {
                  setState(() {
                    _valueInt = int.parse(value);
                  });
                },
              ),
              TextButton(
                onPressed: (() {
                  setState(() {
                    if (_valueInt == (_randomNumber1 + _randomNumber2)) {
                      _result = "Bravo !";
                      _showToast(context, "Bravo !");
                    } else {
                      _result = "Le résultat est incorrect !";
                      _showToast(context, "Le résultat est incorrect !");
                    }
                  });
                }),
                child: Text('Valider'),
              ),
              Text("$_result"),
              DropdownButton(
                  icon: Icon(MyFlutterApp.perspective_dice_random),
                  value: _valueDropDown.toString(),
                  items: listDeValeur
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: ((value) {
                    setState(() {
                      _valueDropDown = int.parse(value!);
                      _counter = int.parse(value);
                    });
                  }))
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
