// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// import 'main.dart';
//
//
// class SecondPage extends StatelessWidget
// {
//   final int data;
//   SecondPage({this.data});
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<Counter>(builder: (context, counter, child){
//       return Scaffold(
//         floatingActionButton: FloatingActionButton(onPressed: ()=>counter.increment(),),
//         appBar: AppBar(title: Text("The Counter is ${counter.count}"),),
//         body: Column(
//           children: [
//             RaisedButton(
//                 onPressed: ()=>Navigator.pop(context),
//               child: Text('${counter.count}'),
//             ),
//           ],
//         ),
//
//       );
//   }
//     );
//
//   }
//
// }