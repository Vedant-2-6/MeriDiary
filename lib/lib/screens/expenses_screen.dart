import 'package:flutter/material.dart';

class ExpensesScreen extends StatelessWidget {
  // Dummy data for demonstration purposes
  final List<Map<String, dynamic>> expenses = [
    {'date': '2024-08-01', 'amount': 50.0},
    {'date': '2024-08-15', 'amount': 20.0},
    {'date': '2024-08-20', 'amount': 30.0},
  ];

  @override
  Widget build(BuildContext context) {
    double totalExpenses = expenses.fold(0, (sum, item) => sum + item['amount']);

    return Scaffold(
      appBar: AppBar(
        title: Text('My Expenses'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Monthly Expenses',
              style: TextStyle(
                fontSize: 24.0, // Use a direct TextStyle if headline5 is not available
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Total Expenses: \$${totalExpenses.toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: expenses.length,
                itemBuilder: (context, index) {
                  final expense = expenses[index];
                  return Card(
                    child: ListTile(
                      title: Text('Date: ${expense['date']}'),
                      subtitle: Text('Amount: \$${expense['amount'].toStringAsFixed(2)}'),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
