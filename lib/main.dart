// ignore_for_file: deprecated_member_use

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import './Utilities/TitleTexts.dart';
import './models/List_cards.dart';
import './models/textcolor_model.dart';

import 'models/todo_model.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var txtTitleController = TextEditingController();

  var txtBodyController = TextEditingController();

  List<Color> randomColor = [
    Colors.green,
    Colors.blue,
    Colors.deepOrange,
    Colors.amber,
    Colors.white,
    Colors.lime,

    Colors.teal,
    Colors.cyan,
    Colors.indigo,
    Colors.red
  ];



  List<Todo> modelist = [
    Todo(body: 'Hey, my dog gave birth', title: 'Puppies', dat: DateTime.now()),
    Todo(body: 'Hey, my dog gave birth', title: 'Puppies', dat: DateTime.now()),
    Todo(body: 'Hey, my dog gave birth', title: 'Puppies', dat: DateTime.now()),
    Todo(body: 'Hey, my dog gave birth', title: 'Puppies', dat: DateTime.now()),
  ];

  void insertData(String title, String body, BuildContext context) {
    if (title.isNotEmpty && body.isNotEmpty) {
      modelist.add(Todo(body: body, title: title, dat: DateTime.now()));
      Navigator.pop(context);
    }
  }

  void showBottomSheet(BuildContext context) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return SingleChildScrollView(
            //  padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              decoration: const BoxDecoration(
                  color: Color.fromARGB(179, 206, 205, 205)),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    padding: const EdgeInsets.all(10),
                    child: TitleText('Add Note'),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(10, 40, 10, 10),
                    padding: const EdgeInsets.all(15),
                    color: Colors.white,
                    child: TextField(
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(9),
                      ],
                      controller: txtTitleController,
                      maxLines: 1,
                      decoration: const InputDecoration.collapsed(
                        hintText: 'Enter Title',
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(10, 40, 10, 10),
                    padding: const EdgeInsets.all(10),
                    color: Colors.white,
                    child: TextField(
                      controller: txtBodyController,
                      maxLines: 5,
                      decoration:
                          InputDecoration.collapsed(hintText: 'Enter body'),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    width: 250,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          insertData(txtTitleController.text,
                              txtBodyController.text, context);
                        });
                      },
                      child: const Text('Save'),
                      style: ElevatedButton.styleFrom(
                          shape: const StadiumBorder()),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                ],
              ),
            ),
          );
        });
  }

  // const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(
            centerTitle: true,
            textTheme: TextTheme(
              headline1: TextStyle(color: Colors.deepPurpleAccent),
              headline2: TextStyle(color: Colors.deepPurpleAccent),
              bodyText2: TextStyle(color: Colors.deepPurpleAccent),
              subtitle1: TextStyle(color: Colors.pinkAccent),
            )),
        //  textTheme: Theme.of(context).textTheme.copyWith
        //  (
        //   titleMedium: Theme.of(context).textTheme.titleMedium?.apply(
        //     color: Colors.black,

        //   ),

        //  )
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Sticky Note',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: modelist.isNotEmpty ? HomeScreen(modelist) : no_todo(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: (() => showBottomSheet(context)),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

Widget no_todo() {
  return Center(
      child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: const [
      Text(
        'Ooops...',
        style: TextStyle(fontFamily: 'OpenSans', fontSize: 26),
      ),
      Text(
        'No task listed....click on the fab to add a new item.',
        style: TextStyle(fontWeight: FontWeight.normal),
      ),
    ],
  ));
}

class HomeScreen extends StatelessWidget {

    List<TextColorModel> colorList = [
    TextColorModel(background: Colors.green, textColor: Colors.black),
    TextColorModel(background: Colors.blue, textColor: Colors.black),
    TextColorModel(background: Colors.deepOrange, textColor: Colors.black),
    TextColorModel(background: Colors.yellow, textColor: Colors.black),
    TextColorModel(background: Colors.white, textColor: Colors.black),
    TextColorModel(background: Colors.green, textColor: Colors.black),
    TextColorModel(background: Colors.black, textColor: Colors.white),
    TextColorModel(background: Colors.lime, textColor: Colors.black),
    TextColorModel(background: Colors.red, textColor: Colors.white),
    TextColorModel(background: Colors.purple,textColor: Colors.white),
    TextColorModel(background: Colors.green, textColor: Colors.black),



  ];
  // HomeScreen({ Key? key }) : super(key: key);

  List<Todo> modelist;
  HomeScreen(this.modelist);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: StaggeredGridView.countBuilder(
            // gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            //     maxCrossAxisExtent: 200,
            //     childAspectRatio: 3 / 2,
            //     crossAxisSpacing: 20,
            //     mainAxisSpacing: 20),
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            crossAxisCount: 2,
            staggeredTileBuilder: (index) => StaggeredTile.fit(1),
            itemCount: modelist.length,
            itemBuilder: (BuildContext ctx, index) {
              return ListCards(modelist[index].body, modelist[index].dat,
                  modelist[index].title, colorList[Random().nextInt(colorList.length)]);
            }),
      ),
    );
  }
}
