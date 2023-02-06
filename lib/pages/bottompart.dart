import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habits/pages/homepage.dart';
import 'package:slide_to_act/slide_to_act.dart';

class BottomPart extends StatelessWidget {
  const BottomPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              child: Text(
                "Track your seasons",
                // textAlign: TextAlign.justify,
                style: GoogleFonts.itim(
                  textStyle: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Container(
              alignment: Alignment.topLeft,
              width: 350,
              height: 100,
              // color: Colors.blue,
              padding: const EdgeInsets.only(left: 20),
              // decoration: BoxDecoration(color: Colors.red),
              child: Text(
                  "All big things come from small beginnings."
                  "The seed of every habit is a single,tiny decision.",
                  style: GoogleFonts.itim(
                    textStyle: const TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                        height: 1.2,
                        fontWeight: FontWeight.w300),
                  )),
            ),
            SizedBox(
              height: 90.0,
            ),
            Container(
              width: 200,
              height: 30,
              // color: Colors.blue,
              padding: const EdgeInsets.only(left: 20),
              // decoration: BoxDecoration(color: Colors.red),
              child: Text(
                  "by"
                  " "
                  " "
                  "James Clear",
                  style: GoogleFonts.itim(
                    textStyle: const TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                        height: 1.2,
                        fontWeight: FontWeight.w300),
                  )),
            ),
            const SizedBox(
              height: 5.0,
            ),
            Align(
              heightFactor: 0.8,
              alignment: Alignment.centerRight,
              child: SlideAction(
                sliderRotate: false,
                innerColor: Color(0xFF05A9C7),
                outerColor: Color(0xFF9BD3DD),
                // Color(0xff64B6FF),
                text: 'Get going 💪🏾',
                textStyle: GoogleFonts.itim(
                  textStyle: const TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                      height: 1.2,
                      fontWeight: FontWeight.w300),
                ),
                sliderButtonIcon: const Icon(
                  Icons.lock_outline,
                  color: Colors.white,
                ),
                submittedIcon: const Icon(
                  Icons.lock_open,
                  color: Colors.white,
                ),
                borderRadius: 30,
                onSubmit: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const HomePage()));
                },
              ),
            ),
            const SizedBox(
              height: 50.0,
            ),
          ],
        ),
      ),
    );
  }
}
