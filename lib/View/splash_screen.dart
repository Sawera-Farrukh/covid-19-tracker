import 'dart:async';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:covid19app/View/world_states.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin{

late final AnimationController _controller = AnimationController(
  duration: const Duration(seconds: 3),
  vsync: this)..repeat();
 @override
void initState() {
  super.initState();

  Timer(const Duration(seconds: 5), () {
    if (mounted) {
      Navigator.pushReplacement(          // ← changed from push
        context,
        MaterialPageRoute(builder: (context) => const WorldStates()),
      );
    }
  });
}

@override
void dispose() {
  _controller.dispose();
  super.dispose();
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:  [
            AnimatedBuilder(
              animation: _controller,
              child: Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/virus.png'),
                    fit: BoxFit.cover
                  )
                ),
              ),
              builder: ( BuildContext context, Widget? child) {
                return Transform.rotate (
                  angle: _controller.value * 2.0 * math.pi,
                  child:child,
                  );

              },
            ),

            SizedBox(height: MediaQuery.of(context).size.height * 0.08,),

            const Text(
  'Covid-19\nTracker',
  textAlign: TextAlign.center,
  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
),

          ],
        ),
      ),
      ),
    );
  }
}