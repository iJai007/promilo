import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:promilo/individualMeetupScreen.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:crypto/crypto.dart';

class Login extends StatefulWidget {
  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool err = false;
  TextEditingController id = TextEditingController(text: ''),
      pass = TextEditingController(text: '');
  bool isEmailValid(String email) {
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    return emailRegExp.hasMatch(email);
  }

  Future<void> _login(String email, String password) async {
    final url = Uri.parse('https://apiv2stg.promilo.com/user/oauth/token');
    final headers = {
      'Authorization': 'Basic UHJvbWlsbzpxNCE1NkBaeSN4MiRHQg==',
      'Content-Type': 'application/x-www-form-urlencoded',
    };

    // Convert password to SHA256
    final bytes = utf8.encode(password);
    final digest = sha256.convert(bytes);
    final hashedPassword = digest.toString();

    // Create the payload
    final body = {
      'username': email,
      'password': hashedPassword,
      'grant_type': 'password',
    };

    try {
      final response = await http.post(
        url,
        headers: headers,
        body: body,
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const IndividualMeetupScreen(),
            )); // Handle successful login, e.g., navigate to the home screen
        print('Login successful: $data');
      } else {
        // Handle error
        _showErrorDialog('Invalid ID or Password');
      }
    } catch (error) {
      _showErrorDialog('An error occurred: $error');
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Error'),
        content: Text(message),
        actions: [
          TextButton(
            child: Text('Okay'),
            onPressed: () {
              Navigator.of(ctx).pop();
            },
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'promilo',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(15),
        shrinkWrap: true,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(0, 50, 0, 20),
            child: Center(
                child: Text(
              'Hi, Welcome Back!',
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 0, 42, 64)), //rgba(0,42,64,255)
            )),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Please Sign in to continue',
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(255, 3, 44, 66)),
            ),
          ), //rgba(3,44,66,255)
          TextField(
              onChanged: (value) {
                setState(() {
                  err = isEmailValid(value);
                });
              },
              controller: id,
              decoration: InputDecoration(
                errorText: err ? null : 'Invalid Email',
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: Colors.red)),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                hintText: 'Enter Email or Phone No.',
                //label: const Text('Please Sign in to continue')
              )),
          Container(
              alignment: Alignment.centerRight,
              child: TextButton(
                  onPressed: () {}, child: const Text('Sign in with OTP'))),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Password',
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(255, 3, 44, 66)),
            ),
          ),
          TextField(
              obscureText: true,
              controller: pass,
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                hintText: 'Enter Password',
                //label: const Text('Please Sign in to continue')
              )),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            TextButton(onPressed: () {}, child: const Text('Remember Me')),
            TextButton(onPressed: () {}, child: const Text('Forgot Password'))
          ]),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 15, 0, 10),
            child: ElevatedButton(
              onPressed: () {
                if (id.text.isNotEmpty && pass.text.isNotEmpty && err) {
                  _login(id.text, pass.text);
                }
                /*Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const IndividualMeetupScreen(),
                    ));*/
              },
              style: ButtonStyle(
                  shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)))),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Submit',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 2,
                    width: 125,
                    child: ColoredBox(color: Colors.grey),
                  ),
                  Text(' or '),
                  SizedBox(
                    height: 2,
                    width: 125,
                    child: ColoredBox(color: Colors.grey),
                  )
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {},
                child: Image.asset(
                  scale: 12,
                  'assets/images/Google__G__logo.svg.png',
                ),
              ),
              InkWell(
                onTap: () {},
                child: Image.asset(
                  scale: 28,
                  'assets/images/LinkedIn_logo_initials.png',
                ),
              ),
              InkWell(
                onTap: () {},
                child: Image.asset(
                  scale: 28,
                  'assets/images/facebook-logo-facebook-icon-transparent-free-png.webp',
                ),
              ),
              InkWell(
                onTap: () {},
                child: Image.asset(
                  scale: 28,
                  'assets/images/Instagram_logo_2016.svg.webp',
                ),
              ),
              InkWell(
                onTap: () {},
                child: Image.asset(
                  scale: 40,
                  'assets/images/2062095_application_chat_communication_logo_whatsapp_icon.svg.webp',
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  const Text('Business User?'),
                  TextButton(onPressed: () {}, child: const Text('Login Here'))
                ],
              ),
              Column(
                children: [
                  const Text('Don\'t have an account'),
                  TextButton(onPressed: () {}, child: const Text('Sign Up'))
                ],
              )
            ],
          ),
          Column(
            children: [
              const Text('By continuing you agree to'),
              TextButton(
                  onPressed: () {},
                  child: const Text('Promilo\'s Terms of Use & Privacy Policy'))
            ],
          )
        ],
      ),
    );
  }
}
