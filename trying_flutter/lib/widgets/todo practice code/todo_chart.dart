import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:trying_flutter/widgets/todo%20practice%20code/todo_chart_bar.dart';
import '../../models/todo_class.dart';

class TodoChart extends StatelessWidget {
  TodoChart({
    Key? key,
    required this.recentTodo,
  }) : super(key: key);

  List<TodoClass> recentTodo;

  List<Map<String, Object>> get groupedTodoValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(
          days: index,
        ),
      );

      var totalSum = 0.0;
      for (var i = 0; i < recentTodo.length; i++) {
        if (recentTodo[i].date.day == weekDay.day &&
            recentTodo[i].date.month == weekDay.month &&
            recentTodo[i].date.year == weekDay.year) {
          totalSum += recentTodo[i].number;
        }
      }

      return {
        'day': DateFormat.E().format(weekDay),
        'number': totalSum,
      };
    });
  }

  double get _totalSum {
    return groupedTodoValues.fold(0.0, (previousValue, element) {
      return previousValue + (element['number'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.all(6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: groupedTodoValues.map((data) {
          return TodoChartBar(
            label: data['day'].toString(),
            number: data['number'] as double,
            percentage:
                _totalSum == 0.0 ? 0.0 : (data['number'] as double) / _totalSum,
          );
        }).toList(),
      ),
    );
  }
}
