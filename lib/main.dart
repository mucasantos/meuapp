import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:meuapp/mycard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Meu Aplicativo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  List<Widget> listImage = [
    myContainer(
        'https://images.freeimages.com/images/large-previews/a31/colorful-umbrella-1176220.jpg'),
    myContainer(
        'https://images.freeimages.com/images/large-previews/1d2/music-nightclub-1420666.jpg'),
    myContainer(
        'https://images.freeimages.com/images/large-previews/5f1/beach-resort-1395730.jpg'),
    myContainer(
        'https://images.freeimages.com/images/large-previews/a31/colorful-umbrella-1176220.jpg'),
    myContainer(
        'https://images.freeimages.com/images/large-previews/a31/colorful-umbrella-1176220.jpg')
  ];
  TextEditingController nome = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController telefone = TextEditingController();

  List<Mycard> meusContatos = [];

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //Text('Novo Contato'),

            CarouselSlider(
              items: listImage,
              options: CarouselOptions(
                height: 180.0,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                viewportFraction: 0.7,
              ),
            ),

            Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextField(
                    controller: nome,
                    decoration: InputDecoration(
                      hintText: 'Nome',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                  TextField(
                    controller: email,
                    decoration: InputDecoration(
                      hintText: 'E-mail',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                  TextField(
                    controller: telefone,
                    decoration: InputDecoration(
                      hintText: 'Telefone',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      meusContatos.add(Mycard(
                        nome: nome.text,
                        email: email.text,
                        telefone: telefone.text,
                      ));

                      listImage.add(Mycard(
                        nome: nome.text,
                        email: email.text,
                        telefone: telefone.text,
                      ));
                    });
                  },
                  child: const Text('Salvar')),
            ),

            SizedBox(
              height: 280,
              // width: 200,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  // physics: ScrollPhysics(),
                  itemCount: meusContatos.length,
                  itemBuilder: ((context, index) {
                    return meusContatos[index];
                  })),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

Widget myContainer(String imageUrl) {
  return Container(
    margin: const EdgeInsets.all(8.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16.0),
      image: DecorationImage(
        image: NetworkImage(imageUrl),
        fit: BoxFit.cover,
      ),
    ),
    //  child: Text('Samuca Santos'),
  );
}
