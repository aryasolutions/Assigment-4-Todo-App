import 'dart:async';

import 'package:flutter/material.dart';

import 'package:hello/todo.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Arya Solutions',
      home: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text('Arya Solutions Todo App'),
          ),
          body: 
      //     Center(
      //         child: ElevatedButton(
      //   onPressed: (){
      //     Navigator.push(context,
      //         MaterialPageRoute(builder: (context)=>MobileList()));
      //   },
      //   child: Text('Next page'),
      // )
      // )
          Todo()
          ),
    );
  }
}

// // // // // // Stack use ase Z-index
class stackclass extends StatefulWidget {
  const stackclass({Key? key}) : super(key: key);

  @override
  _stackclassState createState() => _stackclassState();
}

class _stackclassState extends State<stackclass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
              alignment: Alignment.bottomRight,
              child: Container(
                color: Colors.amber,
                // use MediaQuery for responsive
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width * 0.2,
              )),
          Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                color: Colors.lightGreenAccent,
                height: 54,
                width: 34,
              )),
          Align(
              alignment: Alignment.center,
              child: Container(
                color: Colors.red,
                height: 54,
                width: 34,
              )),
          Positioned(
              top: 143,
              right: 142,
              child: Container(
                color: Colors.amber,
                height: 54,
                width: 34,
              )),
        ],
      ),
    );
  }
}
// // // // // // type stf for create full class

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CircleAvatar(
            radius: 100,
            // backgroundImage: AssetImage('assets/bg.jpg')
            backgroundImage: NetworkImage(
                'https://images.unsplash.com/photo-1523527692532-b7811d223c53?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8bG92ZWx5fGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&w=1000&q=80'),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              //  margin: EdgeInsets.all(50),
              padding: EdgeInsets.all(40),
              child: Text(
                "Mudassir",
                style: TextStyle(
                    color: Colors.purple,
                    fontSize: 43,
                    fontWeight: FontWeight.bold),
              ),
              height: 143,
              width: 143,
              decoration: BoxDecoration(
                //  color: Colors.deepPurpleAccent,
                borderRadius: BorderRadius.circular(30),
                gradient: LinearGradient(colors: [Colors.red, Colors.yellow]),
              ),
            ),
          ),
          SizedBox(
            height: 42,
          )
        ],
      ),
    );
  }
}
