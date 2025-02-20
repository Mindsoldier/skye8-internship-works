import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Center everything vertically
          crossAxisAlignment: CrossAxisAlignment.center, // Center everything horizontally
          children: <Widget>[
            // Title (Login)
            Text(
              'Login',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.blue, // Blue color for the title
              ),
            ),
            SizedBox(height: 10), // Space between title and paragraph

            // Paragraph
            Text(
              'You have been missed!',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54, // Dark color for the paragraph
              ),
            ),
            SizedBox(height: 30), // Space between paragraph and form

            // Email and Password Form
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  // Email TextField
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter an email';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20), // Space between fields

                  // Password TextField
                  TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a password';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20), // Space between fields and button

                  // Login Button with blue background and white text, full-width
                  SizedBox(
                    width: double.infinity, // Make the button the same width as the form fields
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Logging in...')),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue, // Blue background color
                        Primary: Colors.white, // White text color
                        padding: EdgeInsets.symmetric(vertical: 12), // Medium padding
                      ),
                      child: Text('Login'),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20), // Space between button and options

            // Forgotten Password and Create Account options
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Forgotten Password
                TextButton(
                  onPressed: () {
                    // Handle Forgotten Password
                    print("Forgotten Password");
                  },
                  child: Text('Forgot Password?', style: TextStyle(color: Colors.blue)),
                ),
                // Create Account
                TextButton(
                  onPressed: () {
                    // Handle Create Account
                    print("Create Account");
                  },
                  child: Text('Create Account', style: TextStyle(color: Colors.blue)),
                ),
              ],
            ),
            SizedBox(height: 30), // Space between form and footer

            // Footer with social media icons (Google, Email, and Apple)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.g_translate, color: Colors.blue), // Google icon
                  onPressed: () {
                    print("Google login");
                  },
                ),
                IconButton(
                  icon: Icon(Icons.email, color: Colors.blue), // Email icon
                  onPressed: () {
                    print("Email login");
                  },
                ),
                IconButton(
                  icon: Icon(Icons.apple, color: Colors.black), // Apple icon
                  onPressed: () {
                    print("Apple login");
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
