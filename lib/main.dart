import 'package:flutter/material.dart';
import 'lib/screens/home_screen.dart';
import 'lib/screens/profile_screen.dart';
import 'lib/screens/goals_screen.dart';
import 'lib/screens/expenses_screen.dart';
import 'lib/screens/mood_tracker_screen.dart';
import 'lib/screens/login_screen.dart';
import 'lib/screens/register_screen.dart';

void main() {
  runApp(MeriDiaryApp());
}

class MeriDiaryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MeriDiary',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/login', // Set the initial route to the Login screen
      routes: {
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
        '/home': (context) => HomeScreen(),
        '/profile': (context) => ProfileScreen(),
        '/goals': (context) => GoalsScreen(),
        '/expenses': (context) => ExpensesScreen(),
        '/moodTracker': (context) => MoodTrackerScreen(),
      },
    );
  }
}



// import 'package:flutter/material.dart';
// import 'lib/screens/home_screen.dart';
// import 'lib/screens/profile_screen.dart';
// import 'lib/screens/goals_screen.dart';
// import 'lib/screens/expenses_screen.dart';
// import 'lib/screens/mood_tracker_screen.dart';
// import 'lib/screens/login_screen.dart';
// import 'lib/screens/register_screen.dart';
// import 'package:firebase_core/firebase_core.dart';
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(); // Initialize Firebase before running the app
//   runApp(MeriDiaryApp());
// }
//
// class MeriDiaryApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'MeriDiary',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       initialRoute: '/login', // Set the initial route to the Login screen
//       routes: {
//         '/login': (context) => LoginScreen(),
//         '/register': (context) => RegisterScreen(),
//         '/home': (context) => HomeScreen(),
//         '/profile': (context) => ProfileScreen(),
//         '/goals': (context) => GoalsScreen(),
//         '/expenses': (context) => ExpensesScreen(),
//         '/moodTracker': (context) => MoodTrackerScreen(),
//       },
//     );
//   }
// }
