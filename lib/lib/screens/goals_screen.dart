import 'package:flutter/material.dart';

class GoalsScreen extends StatefulWidget {
  @override
  _GoalsScreenState createState() => _GoalsScreenState();
}

class _GoalsScreenState extends State<GoalsScreen> {
  final List<Map<String, dynamic>> _goals = [
    {'title': 'Read 5 books', 'completed': false},
    {'title': 'Exercise daily', 'completed': true},
  ];

  final TextEditingController _goalController = TextEditingController();

  void _addGoal() {
    if (_goalController.text.isEmpty) return;

    setState(() {
      _goals.add({
        'title': _goalController.text,
        'completed': false,
      });
    });
    _goalController.clear();
    Navigator.of(context).pop(); // Close the dialog
  }

  void _showAddGoalDialog() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Add New Goal'),
        content: TextField(
          controller: _goalController,
          decoration: InputDecoration(labelText: 'Goal Title'),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: _addGoal,
            child: Text('Add'),
          ),
        ],
      ),
    );
  }

  void _toggleGoalCompletion(int index) {
    setState(() {
      _goals[index]['completed'] = !_goals[index]['completed'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Goals'),
      ),
      body: ListView.builder(
        itemCount: _goals.length,
        itemBuilder: (ctx, index) {
          return ListTile(
            title: Text(
              _goals[index]['title'],
              style: TextStyle(
                decoration: _goals[index]['completed']
                    ? TextDecoration.lineThrough
                    : null,
              ),
            ),
            trailing: IconButton(
              icon: Icon(
                _goals[index]['completed']
                    ? Icons.check_box
                    : Icons.check_box_outline_blank,
                color: _goals[index]['completed'] ? Colors.green : null,
              ),
              onPressed: () => _toggleGoalCompletion(index),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddGoalDialog,
        child: Icon(Icons.add),
        backgroundColor: Colors.deepPurple, // Use your preferred color
      ),
    );
  }
}
