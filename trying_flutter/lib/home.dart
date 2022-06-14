import 'package:flutter/material.dart';

import './screens/todo_screen.dart';
import './screens/sample_screen.dart';
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
        return const SampleScreen();
      case 1:
        return const TodoScreen();
      case 2:
        return UserTransaction();
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
          label: 'Todo',
          icon: Icon(Icons.today),
        ),
        BottomNavigationBarItem(
          label: 'Doing',
          icon: Icon(Icons.calendar_today),
        ),
        BottomNavigationBarItem(
          label: 'Done',
          icon: Icon(Icons.check),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('try'),
      ),
      body: buildPages(),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }
}
