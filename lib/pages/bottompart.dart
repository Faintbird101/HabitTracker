import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:habits/pages/homepage.dart';

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
            const Text(
              "Track your habits",
              // textAlign: TextAlign.justify,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            const SizedBox(
              height: 26.0,
            ),
            const Text(
              "And let us not grow weary of doing good, for in due season we will reap, if we do not give up."
              "As for you, brothers, do not grow weary in doing good."
              "For you have need of endurance, so that when you have done the will of God you may receive what is promised."
              "But the one who endures to the end will be saved.",
              style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.white,
                  height: 1.2,
                  fontWeight: FontWeight.w300),
            ),
            const SizedBox(
              height: 25.0,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                height: 60.0,
                width: 60.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2.0),
                ),
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => HomePage()));
                  },
                  icon: Icon(
                    Icons.chevron_right_outlined,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 50.0,
            ),
            // Container(
            //   child: IconButton(
            //     onPressed: () {},
            //     icon: Icon(
            //       Icons.chevron_right_outlined,
            //       color: Colors.white,
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
