// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:animations/animations.dart';
import 'package:example/presentation/constants/path_manager.dart';
import 'package:example/presentation/screens/register_page.dart';
import 'package:example/presentation/theme/color_constants.dart';
import 'package:example/presentation/widgets/buttons/custom_elevated_button.dart';
import 'package:example/presentation/widgets/text_widgets/def_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              right: -120,
              top: 70,
              child: SvgPicture.asset(SvgAsset.circle.svg)),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * .1),
              SvgPicture.asset(SvgAsset.logo.svg),
              SizedBox(height: MediaQuery.of(context).size.height * .03),
              Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * .6,
                  child: const HeadlineTextWidget(
                    text: 'Добро пожаловать на наше мобильное приложение!',
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * .03),
              Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * .8,
                  child: const DefaultText(
                    title:
                        " Для дальнейшего сотрудничества с нами, пройдите регистрацию.",
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * .03),
              SizedBox(
                height: MediaQuery.of(context).size.height * .25,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    Positioned(
                        left: 0,
                        bottom: -20,
                        child: SvgPicture.asset(SvgAsset.circle.svg)),
                    Center(child: Image.asset(SvgAsset.truck2.png)),
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * .1),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomElevatedButton(
                    title: "Регистрация",
                    color: ColorConstants.red,
                    onPressed: () {
                      Navigator.of(context).push(
                        PageRouteBuilder(
                          pageBuilder: (_, __, ___) => const RegisterPage(),
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
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * .03),
                  CustomElevatedButton(
                    title: "Войти",
                    onPressed: () {},
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}

class HeadlineTextWidget extends StatelessWidget {
  const HeadlineTextWidget({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(text,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.w700, color: ColorConstants.blue));
  }
}
