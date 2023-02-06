import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habits/pages/bottompart.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _habitScreenController;

  late bool animatedHabitText = false;
  late bool animatedHabit = false;

  @override
  void initState() {
    super.initState();
    _habitScreenController = AnimationController(vsync: this);
    _habitScreenController.addListener(() {
      if (_habitScreenController.value > 0.9) {
        _habitScreenController.stop();
        Future.delayed(const Duration(seconds: 3), () {
          animatedHabitText = true;
          setState(() {});
        });
        // animatedHabitText = true;
        // setState(() {});
        Future.delayed(const Duration(microseconds: 200), () {
          animatedHabit = true;
          setState(() {});
        });
      }
    });
  }

  @override
  void dispose() {
    _habitScreenController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenheight = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Color(0xFF05A9C7),
          body: Stack(
            children: [
              Positioned(
                bottom: 0,
                child: Container(
                  padding: const EdgeInsets.all(15.0),
                  constraints: const BoxConstraints.expand(
                    height: 430,
                    width: 400,
                  ),
                  decoration: const BoxDecoration(
                    // boxShadow: [
                    //   BoxShadow(
                    //     // color: Colors.white30,
                    //     spreadRadius: 5,
                    //     blurRadius: 10,
                    //     offset: Offset(0, 2),
                    //   ),
                    // ],
                    image: DecorationImage(
                        image: AssetImage('assets/mine.png'),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
              Opacity(
                opacity: 1,
                child: AnimatedContainer(
                  alignment: AlignmentDirectional.centerStart,
                  curve: Curves.fastOutSlowIn,
                  duration: const Duration(seconds: 4),
                  height: animatedHabit ? screenheight / 2.2 : screenheight,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.circular(animatedHabit ? 40 : 0.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Visibility(
                        visible: !animatedHabit,
                        child: Lottie.asset(
                          'assets/9757-welcome.json',
                          controller: _habitScreenController,
                          onLoaded: (composition) {
                            _habitScreenController
                              ..duration = composition.duration
                              ..forward();
                          },
                        ),
                      ),
                      Visibility(
                        visible: animatedHabit,
                        child: Image.asset(
                          'assets/matawi.png',
                          // fit: BoxFit.scaleDown,
                          color: Colors.white,
                          colorBlendMode: BlendMode.modulate,
                          height: 200,
                          width: 200,
                        ),
                      ),
                      const SizedBox(
                        height: 35.0,
                      ),
                      Visibility(
                        visible: animatedHabit,
                        child: Center(
                          child: AnimatedOpacity(
                            opacity: animatedHabitText ? 1 : 0,
                            duration: const Duration(seconds: 1),
                            child: Text(
                              "H A B I T S",
                              style: GoogleFonts.itim(
                                  textStyle: const TextStyle(
                                fontSize: 40.0,
                                // GoogleFonts.aboreto(),
                                color: Color(0xFF05A9C7),
                              )),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Visibility(
                visible: animatedHabit ? true : false,
                child: const BottomPart(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
