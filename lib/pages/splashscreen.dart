import 'package:flutter/material.dart';
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
  late bool animatedHabit = false;
  late bool animatedHabitText = false;

  @override
  void initState() {
    super.initState();
    _habitScreenController = AnimationController(vsync: this);
    _habitScreenController.addListener(() {
      if (_habitScreenController.value > 0.9) {
        _habitScreenController.stop();
        animatedHabit = true;
        setState(() {});
        Future.delayed(Duration(seconds: 1), () {
          animatedHabitText = true;
          setState(() {});
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _habitScreenController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.orange.shade300,
      body: Stack(
        children: [
          AnimatedContainer(
            duration: const Duration(seconds: 3),
            height: animatedHabit ? screenheight / 1.9 : screenheight,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(animatedHabit ? 30 : 0.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Visibility(
                  visible: !animatedHabit,
                  child: Lottie.asset(
                    'assets/smarthome.json',
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
                    'assets/smrthme.png',
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
                      duration: Duration(seconds: 1),
                      child: Text(
                        "H A B I T S",
                        style: TextStyle(
                          fontSize: 40.0,
                          color: Colors.orange.shade300,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Visibility(
            visible: animatedHabit,
            child: const BottomPart(),
          ),
        ],
      ),
    );
  }
}
