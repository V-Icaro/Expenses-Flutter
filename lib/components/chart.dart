import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  const Chart({
    super.key,
    this.recentsTransactions,
  });

  final List<Transaction>? recentsTransactions;

  List<Map<String, Object>> get groupedTransactions {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );

      double? totalSum = 0;

      for (var i = 0; i < recentsTransactions!.length; i++) {
        bool sameDay = recentsTransactions![i].date!.day == weekDay.day;
        bool sameMonth = recentsTransactions![i].date!.month == weekDay.month;
        bool sameYear = recentsTransactions![i].date!.month == weekDay.year;

        if (sameDay && sameMonth && sameYear) {
          totalSum = totalSum! + recentsTransactions![i].value!;
        }
      }

      print(weekDay);
      print(DateFormat.E().format(weekDay)[0]);
      print(totalSum);

      return {
        'day': DateFormat.E().format(weekDay)[0],
        'value': totalSum!,
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.all(20),
      child: Row(
        children: const [],
      ),
    );
  }
}
