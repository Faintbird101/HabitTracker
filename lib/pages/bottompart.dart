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
              height: 140,
              // color: Colors.blue,
              padding: const EdgeInsets.only(left: 20),
              // decoration: BoxDecoration(color: Colors.red),
              child: Text(
                  "All big things come from small beginnings."
                  "The seed of every habit is a single,tiny decision.",
                  style: GoogleFonts.itim(
                    textStyle: const TextStyle(
                        fontSize: 15.0,
                        color: Colors.white,
                        height: 1.2,
                        fontWeight: FontWeight.w300),
                  )),
            ),
            const SizedBox(
              height: 35.0,
            ),
            Align(
              heightFactor: 0.8,
              alignment: Alignment.centerRight,
              child: SlideAction(
                sliderRotate: false,
                innerColor: Colors.black,
                outerColor: Color(0xFF1E8FD5),
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
              // Container(
              //   height: 60.0,
              //   width: 60.0,
              //   decoration: BoxDecoration(
              //     shape: BoxShape.circle,
              //     border: Border.all(color: Colors.white, width: 2.0),
              //   ),
              //   child:
              //    IconButton(
              //     onPressed: () {
              // Navigator.of(context).push(
              //     MaterialPageRoute(builder: (context) => HomePage()));
              //     },
              //     icon: Icon(
              //       Icons.chevron_right_outlined,
              //       color: Colors.white,
              //     ),
              //   ),
              // ),
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
