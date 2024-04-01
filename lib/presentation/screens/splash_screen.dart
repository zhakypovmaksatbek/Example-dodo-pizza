import 'package:animate_do/animate_do.dart';
import 'package:animations/animations.dart';
import 'package:example/presentation/constants/path_manager.dart';
import 'package:example/presentation/screens/welcome_page.dart';
import 'package:example/presentation/theme/color_constants.dart';
import 'package:example/presentation/widgets/buttons/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isStart = false;
  @override
  void initState() {
    changeState();
    super.initState();
  }

  Future<void> changeState() async {
    await Future.delayed(const Duration(seconds: 7), () {
      setState(() {
        isStart = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.blue,
      body: Stack(
        children: [
          const ContinuousImageAnimation(),
          const AnimatedTruck(),
          FadeInDown(
              animate: true,
              child: Column(
                children: [
                  const SizedBox(
                    height: 80,
                  ),
                  Image.asset(SvgAsset.logo.png),
                ],
              )),
          isStart
              ? Positioned(
                  bottom: 60,
                  left: 115,
                  child: FadeInUp(
                      child: CustomElevatedButton(
                    title: "Начать",
                    color: ColorConstants.red,
                    onPressed: () {
                      Navigator.of(context).push(
                        PageRouteBuilder(
                          pageBuilder: (_, __, ___) => const WelcomePage(),
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                            return FadeThroughTransition(
                              animation: animation,
                              secondaryAnimation: secondaryAnimation,
                              child: child,
                            );
                          },
                        ),
                      );
                    },
                  )))
              : const SizedBox()
        ],
      ),
    );
  }
}

class AnimatedTruck extends StatefulWidget {
  const AnimatedTruck({super.key});

  @override
  State<AnimatedTruck> createState() => _AnimatedTruckState();
}

class _AnimatedTruckState extends State<AnimatedTruck>
    with TickerProviderStateMixin {
  late final AnimationController _animationController;
  final double _left = -210;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      startAnimation();
    });
  }

  void startAnimation() async {
    _animationController.forward();
    await Future.delayed(const Duration(seconds: 10));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return AnimatedContainer(
            margin: const EdgeInsets.only(top: 75),
            duration: Duration.zero,
            transform: Matrix4.translationValues(
                _left +
                    _animationController.value *
                        2 *
                        MediaQuery.of(context).size.width,
                0,
                0),
            child: Image.asset(
              SvgAsset.truck.png,
              fit: BoxFit.contain,
            ),
          );
        },
      ),
    );
  }
}

class ContinuousImageAnimation extends StatefulWidget {
  const ContinuousImageAnimation({super.key});

  @override
  State<ContinuousImageAnimation> createState() =>
      _ContinuousImageAnimationState();
}

class _ContinuousImageAnimationState extends State<ContinuousImageAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );

    final normalSpeedCurve =
        CurvedAnimation(parent: _controller, curve: const Interval(0, 0.5));

    _animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurveTween(curve: Curves.linear).animate(normalSpeedCurve));

    _controller.repeat();
    Future.delayed(const Duration(seconds: 8), () {
      _controller.stop();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Transform.translate(
            offset: Offset(
              (1 - _animation.value),
              -25,
            ),
            child: Image.asset(
              SvgAsset.city.png,
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height * .3,
              alignment: Alignment(-1 + 2 * _controller.value, 0),
            ),
          );
        },
      ),
    );
  }
}
