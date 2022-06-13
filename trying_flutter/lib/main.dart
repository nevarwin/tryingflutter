import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './transaction.dart';
import './todo_class.dart';
import './sample_class.dart';

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

  final titleController = TextEditingController();
  final amountController = TextEditingController();

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
        description: 'description1 ',
        date: DateTime.now(),
        color: Colors.teal,
      ),
      TodoClass(
        id: '2',
        title: 'title2',
        description: 'description2 ',
        date: DateTime.now(),
        color: Colors.orangeAccent,
      ),
    ];

    final List<SampleClass> samples = [
      SampleClass(
        title: 'First Title',
        subtitle: 'Nice Description',
        date: DateTime.now(),
        color: Colors.deepOrange,
      ),
      SampleClass(
        title: 'Second Title',
        subtitle: 'Great Description',
        date: DateTime.now(),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: SingleChildScrollView(
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
                  children: samples.map(
                (smp) {
                  return Card(
                    child: Row(
                      children: [
                        CircleAvatar(backgroundColor: smp.color),
                        Text(smp.title),
                        Text(smp.subtitle),
                        Text(
                          DateFormat('MMMM dd').format(smp.date),
                        ),
                      ],
                    ),
                  );
                },
              ).toList()),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: todo.map((todo) {
                  return ListTile(
                    tileColor: Colors.white70,
                    style: ListTileStyle.list,
                    title: Text(
                      todo.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    subtitle: Text(
                      todo.description +
                          DateFormat.yMEd().format(
                            DateTime.now(),
                          ),
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                    leading: CircleAvatar(
                      backgroundColor: todo.color,
                    ),
                  );
                }).toList(),
              ),
              Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextField(
                      controller: titleController,
                      decoration: const InputDecoration(
                        labelText: 'Title',
                      ),
                      keyboardType: TextInputType.text,
                    ),
                    TextField(
                      controller: amountController,
                      decoration: const InputDecoration(
                        labelText: 'Amount',
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    FlatButton(
                      onPressed: () {
                        Transaction(
                          id: DateTime.now().toString(),
                          title: titleController.text,
                          amount: double.parse(amountController.text),
                          date: DateTime.now(),
                        );
                      },
                      color: Colors.purple,
                      textColor: Colors.white,
                      child: const Text('Add Transaction'),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: transaction.map((tx) {
                  return Card(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.purple,
                              width: 2,
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 10,
                          ),
                          child: Text(
                            '\$${tx.amount}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              tx.title,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              DateFormat('MMMM dd').format(tx.date),
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  );
                }).toList(),
              )
            ],
          ),
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
