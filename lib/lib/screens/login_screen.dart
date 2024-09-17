// import 'package:flutter/material.dart';
// import '../services/auth_service.dart'; // Import AuthService
//
// class LoginScreen extends StatelessWidget {
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();
//   final AuthService _auth = AuthService(); // AuthService instance
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Login'),
//         backgroundColor: Color(0xFF673AB7),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             TextField(
//               controller: _emailController,
//               decoration: InputDecoration(
//                 labelText: 'Email',
//                 labelStyle: TextStyle(color: Color(0xFF757575)),
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             SizedBox(height: 16.0),
//             TextField(
//               controller: _passwordController,
//               obscureText: true,
//               decoration: InputDecoration(
//                 labelText: 'Password',
//                 labelStyle: TextStyle(color: Color(0xFF757575)),
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             SizedBox(height: 24.0),
//             ElevatedButton(
//               onPressed: () async {
//                 String email = _emailController.text;
//                 String password = _passwordController.text;
//
//                 // Call the AuthService method to sign in
//                 var result = await _auth.signInWithEmail(email, password);
//
//                 if (result != null) {
//                   Navigator.pushReplacementNamed(context, '/home');
//                 } else {
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     SnackBar(content: Text('Login failed')),
//                   );
//                 }
//               },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Color(0xFF673AB7),
//                 padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 12.0),
//               ),
//               child: Text('Login'),
//             ),
//             SizedBox(height: 16.0),
//             TextButton(
//               onPressed: () {
//                 Navigator.pushNamed(context, '/register');
//               },
//               child: Text(
//                 'Don\'t have an account? Register',
//                 style: TextStyle(color: Color(0xFF03A9F4)),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        backgroundColor: Color(0xFF673AB7), // Primary Color: Deep Purple
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Email/Username Text Field
            TextField(
              decoration: InputDecoration(
                labelText: 'Email or Username',
                labelStyle: TextStyle(color: Color(0xFF757575)), // Secondary text color
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF673AB7)), // Primary Color
                ),
              ),
            ),
            SizedBox(height: 16.0),
            // Password Text Field
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                labelStyle: TextStyle(color: Color(0xFF757575)), // Secondary text color
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF673AB7)), // Primary Color
                ),
              ),
            ),
            SizedBox(height: 24.0),
            // Login Button
            ElevatedButton(
              onPressed: () {
                // Navigate to the Home screen upon successful login
                Navigator.pushReplacementNamed(context, '/home');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF673AB7), // Updated to backgroundColor
                padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 12.0),
              ),
              child: Text(
                'Login',
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 16.0),
            // Register Button
            TextButton(
              onPressed: () {
                // Navigate to the Register screen
                Navigator.pushNamed(context, '/register'); // Assuming register route is set up
              },
              child: Text(
                'Don\'t have an account? Register',
                style: TextStyle(color: Color(0xFF03A9F4)), // Secondary Color: Light Blue
              ),
            ),
          ],
        ),
      ),
    );
  }
}
