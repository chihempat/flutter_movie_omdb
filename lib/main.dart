import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'model.dart';
import 'second.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_)=>MovieModel())
    ],
    
      child:MyApp()
      )
  );
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {


    String movietitle=context.watch<MovieModel>().title;
    Map<dynamic,dynamic> list1=context.watch<MovieModel>().movieList??{"title1":"Movie"};
    bool isl=context.watch<MovieModel>().isLoading;

    // void startTimer() {
    //   new Timer.periodic(
    //     Duration(seconds: 1),
    //         (Timer timer) => setState(
    //           () {
    //         if (_progress == 1) {
    //           timer.cancel();
    //         } else {
    //           _progress += 0.2;
    //         }
    //       },
    //     ),
    //   );
    // }
    return Scaffold(
      appBar: AppBar(
        actions: [
          Expanded(
            child: TextField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(labelText: "title",),
            onChanged: (value){
              setState(() {
                  context.read<MovieModel>().getMovie(value);
                  movietitle=value;
                  print(value);
                  }
                );
              },
            ),
          ),
        ],
      ),
      body:
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                isl?
                  Padding(
                  padding: const EdgeInsets.all(100.0),
                  child: Center(child: CircularProgressIndicator(
                    strokeWidth: 5,
                    backgroundColor: Colors.cyanAccent,
                    valueColor: new AlwaysStoppedAnimation<Color>(Colors.blue),
                    value: context.watch<MovieModel>().progress,
                  ),),
                ):
                Image.network(context.watch<MovieModel>().poster??"new",
                height: 200),
                SizedBox(
                  height: 1000,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: context.watch<MovieModel>().movieList.length,
                      itemBuilder: (BuildContext context, int index) {
                        String key = list1.keys.elementAt(index);
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              width:MediaQuery.of(context).size.width,
                              child: ListTile(
                                leading: new Text("$key"),
                                trailing: new Text("${list1[key]??key}"),
                              ),
                            ),
                            new Divider(
                              height: key=="plot"?10.0:2.0,
                            ),
                          ],
                        );
                      }
                  ),
                ),
              ],
            ),
          ),

        floatingActionButton: FloatingActionButton(
          onPressed: ()=>context.read<MovieModel>().getMovie(movietitle),
          tooltip: 'Show',
          child: Icon(Icons.slideshow),
      ),
    );
  }
}



