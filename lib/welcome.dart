import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            color: Color.fromARGB(255, 164, 160, 232),
            child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                  // const Image(image: AssetImage('images/music notes.png')),
                  Text(
                    'Audio Player for you!!',
                    style: GoogleFonts.aBeeZee(
                        fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Let's get started!!",
                    style: GoogleFonts.b612(fontSize: 25),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/second');
                        },
                        style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(255, 198, 197, 236),),
                        child: const Text(' Login '),
                      ),
                      const SizedBox(height: 20,),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/second');
                          },
                          style: ElevatedButton.styleFrom(
                              primary:
                                  Color.fromARGB(255, 198, 197, 236)),
                          child: const Text('Sign Up')),
                    ],
                  )
                ]))));
  }
}
