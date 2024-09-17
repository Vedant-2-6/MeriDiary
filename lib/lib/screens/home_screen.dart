import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/diary_entry.dart'; // Adjust the import based on your project structure
import 'profile_screen.dart';
import 'goals_screen.dart';
import 'expenses_screen.dart';
import 'mood_tracker_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  String? _hoveredCardDate; // Track hovered card date for hover effect

  final List<Map<String, dynamic>> _diaryEntries = [
    {
      'date': DateTime.now().subtract(Duration(days: 1)),
      'mood': 'happy',
      'title': 'A Great Day!',
      'content': 'Had a wonderful time with friends.',
    },
    {
      'date': DateTime.now(),
      'mood': 'sad',
      'title': 'Feeling Down',
      'content': 'It was a tough day at work.',
    },
  ];

  Color _getMoodColor(String mood) {
    switch (mood) {
      case 'happy':
        return Colors.limeAccent;
      case 'sad':
        return Colors.blue;
      case 'angry':
        return Colors.red;
      case 'neutral':
        return Colors.grey;
      default:
        return Colors.white;
    }
  }

  String _formatDate(DateTime date) {
    return DateFormat('MMM d, y').format(date); // Format date
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget _getSelectedPage() {
      switch (_selectedIndex) {
        case 0:
          return ListView.builder(
            itemCount: _diaryEntries.length,
            itemBuilder: (context, index) {
              final entry = _diaryEntries[index];
              final isHovered = _hoveredCardDate == _formatDate(entry['date']);
              return MouseRegion(
                onEnter: (_) => setState(() => _hoveredCardDate = _formatDate(entry['date'])),
                onExit: (_) => setState(() => _hoveredCardDate = null),
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  transform: Matrix4.identity()
                    ..scale(isHovered ? 1.05 : 1.0),
                  transformAlignment: Alignment.center,
                  child: Card(
                    color: _getMoodColor(entry['mood']),
                    margin: EdgeInsets.all(8.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0), // Rounded edges
                    ),
                    child: ListTile(
                      contentPadding: EdgeInsets.all(16.0),
                      title: Text(entry['title'],
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Text(
                          '${_formatDate(entry['date'])}\n${entry['content']}'),
                      isThreeLine: true,
                      onTap: () {
                        // Show a dialog with more details
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text(entry['title']),
                              content: Text('${_formatDate(entry['date'])}\n${entry['content']}'),
                              actions: <Widget>[
                                TextButton(
                                  child: Text('Close'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
              );
            },
          );
        case 1:
          return ProfileScreen();
        case 2:
          return GoalsScreen();
        case 3:
          return ExpensesScreen();
        case 4:
          return MoodTrackerScreen();
        default:
          return Center(child: Text('Page not found'));
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('MeriDiary'),
        backgroundColor: Color(0xFF673AB7), // Primary Color: Deep Purple
      ),
      body: _getSelectedPage(),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: _selectedIndex == 0 ? Color(0xFF673AB7) : Colors.grey),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: _selectedIndex == 1 ? Color(0xFF673AB7) : Colors.grey),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.flag, color: _selectedIndex == 2 ? Color(0xFF673AB7) : Colors.grey),
            label: 'My Goals',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money, color: _selectedIndex == 3 ? Color(0xFF673AB7) : Colors.grey),
            label: 'My Expenses',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mood, color: _selectedIndex == 4 ? Color(0xFF673AB7) : Colors.grey),
            label: 'Mood Tracker',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xFF673AB7), // Primary Color for selected item
        onTap: _onItemTapped,
      ),
      floatingActionButton: _selectedIndex == 0
          ? FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DiaryEntryScreen()),
          );
        },
        backgroundColor: Color(0xFF673AB7), // Primary Color
        icon: Icon(Icons.add),
        label: Text('Add New Entry'),
      )
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}



// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import '../models/diary_entry.dart';
// import 'profile_screen.dart';
// import 'goals_screen.dart';
// import 'expenses_screen.dart';
// import 'mood_tracker_screen.dart';
//
// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   int _selectedIndex = 0;
//   String? _hoveredCardDate; // Track hovered card date for hover effect
//
//   final List<Map<String, dynamic>> _diaryEntries = [
//     {
//       'date': DateTime.now().subtract(Duration(days: 1)),
//       'mood': 'happy',
//       'title': 'A Great Day!',
//       'content': 'Had a wonderful time with friends.',
//     },
//     {
//       'date': DateTime.now(),
//       'mood': 'sad',
//       'title': 'Feeling Down',
//       'content': 'It was a tough day at work.',
//     },
//   ];
//
//   Color _getMoodColor(String mood) {
//     switch (mood) {
//       case 'happy':
//         return Colors.limeAccent;
//       case 'sad':
//         return Colors.blue;
//       case 'angry':
//         return Colors.red;
//       case 'neutral':
//         return Colors.grey;
//       default:
//         return Colors.white;
//     }
//   }
//
//   String _formatDate(DateTime date) {
//     return DateFormat('MMM d, y').format(date); // Format date
//   }
//
//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     Widget _getSelectedPage() {
//       switch (_selectedIndex) {
//         case 0:
//           return ListView.builder(
//             itemCount: _diaryEntries.length,
//             itemBuilder: (context, index) {
//               final entry = _diaryEntries[index];
//               final isHovered = _hoveredCardDate == _formatDate(entry['date']);
//               return MouseRegion(
//                 onEnter: (_) => setState(() => _hoveredCardDate = _formatDate(entry['date'])),
//                 onExit: (_) => setState(() => _hoveredCardDate = null),
//                 child: AnimatedContainer(
//                   duration: Duration(milliseconds: 300),
//                   transform: Matrix4.identity()
//                     ..scale(isHovered ? 1.05 : 1.0),
//                   transformAlignment: Alignment.center,
//                   child: Card(
//                     color: _getMoodColor(entry['mood']),
//                     margin: EdgeInsets.all(8.0),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(15.0), // Rounded edges
//                     ),
//                     child: ListTile(
//                       contentPadding: EdgeInsets.all(16.0),
//                       title: Text(entry['title'],
//                           style: TextStyle(fontWeight: FontWeight.bold)),
//                       subtitle: Text(
//                           '${_formatDate(entry['date'])}\n${entry['content']}'),
//                       isThreeLine: true,
//                       onTap: () {
//                         // Show a dialog with more details
//                         showDialog(
//                           context: context,
//                           builder: (BuildContext context) {
//                             return AlertDialog(
//                               title: Text(entry['title']),
//                               content: Text('${_formatDate(entry['date'])}\n${entry['content']}'),
//                               actions: <Widget>[
//                                 TextButton(
//                                   child: Text('Close'),
//                                   onPressed: () {
//                                     Navigator.of(context).pop();
//                                   },
//                                 ),
//                               ],
//                             );
//                           },
//                         );
//                       },
//                     ),
//                   ),
//                 ),
//               );
//             },
//           );
//         case 1:
//           return ProfileScreen();
//         case 2:
//           return GoalsScreen();
//         case 3:
//           return ExpensesScreen();
//         case 4:
//           return MoodTrackerScreen();
//         default:
//           return Center(child: Text('Page not found'));
//       }
//     }
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('MeriDiary'),
//         backgroundColor: Color(0xFF673AB7), // Primary Color: Deep Purple
//       ),
//       body: _getSelectedPage(),
//       bottomNavigationBar: BottomNavigationBar(
//         items: <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home, color: _selectedIndex == 0 ? Color(0xFF673AB7) : Colors.grey),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person, color: _selectedIndex == 1 ? Color(0xFF673AB7) : Colors.grey),
//             label: 'Profile',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.flag, color: _selectedIndex == 2 ? Color(0xFF673AB7) : Colors.grey),
//             label: 'My Goals',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.attach_money, color: _selectedIndex == 3 ? Color(0xFF673AB7) : Colors.grey),
//             label: 'My Expenses',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.mood, color: _selectedIndex == 4 ? Color(0xFF673AB7) : Colors.grey),
//             label: 'Mood Tracker',
//           ),
//         ],
//         currentIndex: _selectedIndex,
//         selectedItemColor: Color(0xFF673AB7), // Primary Color for selected item
//         onTap: _onItemTapped,
//       ),
//       floatingActionButton: _selectedIndex == 0
//           ? FloatingActionButton.extended(
//         onPressed: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => DiaryEntryScreen()),
//           );
//         },
//         backgroundColor: Color(0xFF673AB7), // Primary Color
//         icon: Icon(Icons.add),
//         label: Text('Add New Entry'),
//       )
//           : null,
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//     );
//   }
// }
