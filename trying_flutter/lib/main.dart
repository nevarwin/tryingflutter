import 'package:flutter/material.dart';
import './transaction.dart';

import 'todo_class.dart';

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
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Transaction> transaction = [
      Transaction(
        id: 't1',
        title: 'Title1',
        amount: 12.99,
        date: DateTime.now(),
      ),
      Transaction(
        id: 't2',
        title: 'Title2',
        amount: 11.39,
        date: DateTime.now(),
      )
    ];

    final List<TodoClass> todo = [
      TodoClass(
        id: '1',
        title: 'title1',
        description: 'description1',
        date: DateTime.now(),
        color: Colors.teal,
      ),
      TodoClass(
        id: '2',
        title: 'title2',
        description: 'description2',
        date: DateTime.now(),
        color: Colors.orangeAccent,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: todo.map((todo) {
                return ListTile(
                  tileColor: Colors.grey,
                  style: ListTileStyle.list,
                  title: Text(todo.title),
                  subtitle: Text(todo.description),
                  leading: CircleAvatar(
                    backgroundColor: todo.color,
                  ),
                );
              }).toList(),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: transaction.map((tx) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Text(
                        tx.amount.toString(),
                      ),
                    ),
                    const SizedBox(width: 8.0),
                    Column(
                      children: [
                        Text(tx.title),
                        Text(
                          tx.date.toIso8601String(),
                        )
                      ],
                    )
                  ],
                );
              }).toList(),
            )
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
