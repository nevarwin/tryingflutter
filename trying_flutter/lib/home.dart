import 'package:flutter/material.dart';

import './widgets/sample practice code/sample_widget.dart';
import './widgets/todo practice code/todo_widget.dart';
import './widgets/user_transaction.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var index = 0;

  Widget buildPages() {
    switch (index) {
      case 0:
        return SingleChildScrollView(child: SampleWidget());
      case 1:
        return SingleChildScrollView(child: TodoWidget());
      case 2:
        return SingleChildScrollView(child: UserTransaction());
      default:
        return Container(
          color: Colors.black54,
        );
    }
  }

  Widget buildBottomNavigationBar() {
    return BottomNavigationBar(
      onTap: (int index) {
        setState(() {
          this.index = index;
        });
      },
      currentIndex: index,
      items: const [
        BottomNavigationBarItem(
          label: 'Sample Practice Code',
          icon: Icon(Icons.today),
        ),
        BottomNavigationBarItem(
          label: 'Todo Practice Code',
          icon: Icon(Icons.calendar_today),
        ),
        BottomNavigationBarItem(
          label: 'Transaction Code',
          icon: Icon(Icons.check),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trial and Error Code'),
      ),
      body: buildPages(),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }
}
