import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:google_fonts/google_fonts.dart';

import 'dashboard_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
        child: Center(
          child: Column(
            children: [
              // logo for splash screen
              Padding(
                padding: const EdgeInsets.only(top: 50, bottom: 8.0),
                child: Lottie.asset('assets/lottie/grocery.json',
                    height: 200, width: 200),
              ),
              Text.rich(TextSpan(children: [
                TextSpan(
                  text: 'GreenGrove ',
                  style: GoogleFonts.getFont('Pacifico',
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xffb4ade1),
                      letterSpacing: 2),
                ),
                TextSpan(
                  text: 'Grocery',
                  style: GoogleFonts.getFont('Pacifico',
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xe41c1b1b),
                      letterSpacing: 2),
                )
              ])),
              const SizedBox(
                height: 50.0,
              ),
              // text 1
              Text('Bring the finest flavors to your doorstep.',
                  style: GoogleFonts.getFont(
                    "Lato",
                    fontSize: 25.0,
                  )),
              const SizedBox(
                height: 10.0,
              ),
              //text 2
              Text('Where freshness meets your every craving',
                  style: GoogleFonts.getFont(
                    "Lato",
                    fontSize: 18.0,
                  )),

              const SizedBox(
                height: 10.0,
              ),
              // button

              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const Dashboard()));
                },
                child: Container(
                  margin: const EdgeInsets.only(top: 180),
                  height: 50,
                  width: 180,
                  decoration: BoxDecoration(
                      color: const Color(0xffb4ade1),
                      borderRadius: BorderRadius.circular(10.0)),
                  child: const Center(
                      child: Text(
                    'Get Started',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
