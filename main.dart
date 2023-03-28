import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:jokeapp/class.dart';
import 'package:jokeapp/joke.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static const String _title = 'Flutter Stateful Clicker Counter';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyWidget(),
    );
  }
}

class MyWidget extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  Future<Joke>? _futureData;

  @override
  void initState() {
    super.initState();
    _futureData = fetchJoke();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Widget'),
      ),
      body: Center(
        child: FutureBuilder<Joke>(
          future: _futureData,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return Test(title: "title", joke: snapshot.data!);
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _futureData = fetchJoke();
          });
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}


// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:jokeapp/joke.dart';
// import 'package:jokeapp/class.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});
//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     Future<Joke?>? getJoke;

//     @override
//     void initState() {
//       super.initState();
//       debugPrint("response one");
//       // getJoke = parseJoke();
//       debugPrint("response two");
//     }

//     // This widget is the root of your application.  @override  Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: Scaffold(
//         body: Center(
//           child: FutureBuilder<Joke?>(
//             initialData: null,
//             future: getJoke,
//             builder: (context, snapshot) {
//               debugPrint("snapshot1 " + snapshot.hasData.toString());
//               if (snapshot.hasData) {
//                 debugPrint("snapshot2 " + snapshot.data.toString());
//                 return Test(
//                   title: "title",
//                   joke: snapshot.data!,
//                 );
//               } else if (snapshot.hasError) {
//                 return Text('${snapshot.error}');
//               } else {
//                 return const CircularProgressIndicator();
//               }
//             },
//           ),
//         ),
//         floatingActionButton: FloatingActionButton(
//           onPressed: () {
//             //test 1
//             // parseJoke().then(
//             //   (value) => {
//             //     getJoke = Future(() => value)},
//             // );

//             //test 2
//             // setState(() {
//             //   debugPrint("Button print");x
//             //   getJoke = parseJoke();
//             //   debugPrint("Button print end");
//             // });
//           },
//           child: const Icon(Icons.replay_outlined),
//         ),
//       ),
//     );
//   }
// }
