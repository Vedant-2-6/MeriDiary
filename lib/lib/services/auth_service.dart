// import 'package:firebase_auth/firebase_auth.dart';
//
// class AuthService {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//
//   // Method for registering a new user with email and password
//   Future<User?> registerWithEmail(String email, String password) async {
//     try {
//       UserCredential result = await _auth.createUserWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//       User? user = result.user;
//       return user;
//     } catch (e) {
//       print('Error: $e');
//       return null;
//     }
//   }
//
//   // Method for signing in with email and password
//   Future<User?> signInWithEmail(String email, String password) async {
//     try {
//       UserCredential result = await _auth.signInWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//       User? user = result.user;
//       return user;
//     } catch (e) {
//       print('Error: $e');
//       return null;
//     }
//   }
//
//   // Method for signing out
//   Future<void> signOut() async {
//     try {
//       return await _auth.signOut();
//     } catch (e) {
//       print('Error: $e');
//     }
//   }
//
//   // Method to check authentication state
//   Stream<User?> get user {
//     return _auth.authStateChanges();
//   }
// }
