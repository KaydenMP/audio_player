import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class appLogin extends StatefulWidget {
  appLogin({Key? key}) : super(key: key);

  @override
  State<appLogin> createState() => _appLoginState();
}

class _appLoginState extends State<appLogin> {
  GlobalKey<FormState> formKey = GlobalKey();

  final TextEditingController password = TextEditingController();

  final TextEditingController confirmPass = TextEditingController();

  bool passwordVisible = true;
  bool _passwordVisible = true;

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: SafeArea(
            child: SingleChildScrollView(
          child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(" Login and get into it",
                      style: GoogleFonts.aBeeZee(
                          fontSize: 25, fontWeight: FontWeight.bold)),
                  const SizedBox(
                    height: 130,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Username',
                        hintText: 'Enter your username',
                        prefixIcon: Icon(Icons.person),
                      ),

                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'username is required';
                        } else {
                          return null;
                        }
                      },
                      // onChanged: (value) {
                      //   name = value;
                      // },
                    ),
                  ),
                  const SizedBox(height: 25),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: password,
                      obscureText: passwordVisible, //false
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.lock),
                          border: const OutlineInputBorder(),
                          label: const Text('Password'),
                          hintText: 'Enter your password',
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  passwordVisible = !passwordVisible;
                                });
                              },
                              icon: Icon(passwordVisible
                                  ? Icons.visibility_off
                                  : Icons.visibility))),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password is required to continue';
                        }
                        if (value.length <= 5) {
                          return 'password must have at least 6 character';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  const SizedBox(height: 25),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: confirmPass,
                      obscureText: _passwordVisible,
                      decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          label: const Text('Confirm Password'),
                          hintText: 'Re-enter password',
                          prefixIcon: const Icon(Icons.lock),
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _passwordVisible = !_passwordVisible;
                                });
                              },
                              icon: Icon(_passwordVisible
                                  ? Icons.visibility_off
                                  : Icons.visibility))),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password is required to continue';
                        } else if (value.length <= 5) {
                          return 'password must have at least 6 character';
                        } else if (value != password.text) {
                          return 'Does not match!!!';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  const SizedBox(height: 50),
                  ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        Navigator.pushNamed(context, '/third');
                      }
                    },
                    child: const Text('Login'),
                  ),
                ],
              )),
        )),
      ),
    );
  }
}
