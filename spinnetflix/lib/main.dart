import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:spinnetflix/models/film.dart';
import 'package:spinnetflix/services/film_service.dart';

void main() {
  runApp(const MyApp());
}

final FilmService _filmService = FilmService();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Film Spinner: Mohcine Amzyl"),
        ),
        body: Container(
          alignment: Alignment.center,
          child: FutureBuilder(
              future: _filmService.getUsers(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  Film data = snapshot.data as Film;
                  inspect(data);
                  //test si c'est un film ou serie
                  String type = data.type == 'm' ? 'movie' : 'show';
                  return SingleChildScrollView(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.network(
                            "https://img.reelgood.com/content/$type/${data.identifiant}/poster-780.jpg",
                            height: 500,
                            width: 500,
                          ),
                          RichText(
                            text: TextSpan(
                                style: const TextStyle(
                                  fontSize: 25,
                                ),
                                children: [
                                  TextSpan(
                                      text: ('${data.titre}'),
                                      style: const TextStyle(
                                          color: Color.fromARGB(
                                              255, 255, 255, 255))),
                                ]),
                          ),
                          const SizedBox(height: 10),
                          Center(
                            child: RichText(
                              text: TextSpan(
                                  style: const TextStyle(
                                    fontSize: 25,
                                  ),
                                  children: [
                                    TextSpan(
                                        text: ('${data.description}'),
                                        style: const TextStyle(
                                            color: Color.fromARGB(
                                                255, 255, 255, 255))),
                                  ]),
                            ),
                          ),
                          ElevatedButton(
                              onPressed: () {
                                setState(() {});
                              },
                              child: const Text("Spin")),
                        ],
                      ),
                    ),
                  );
                } else {
                  return const CircularProgressIndicator();
                }
              }),
        ));
  }
}
