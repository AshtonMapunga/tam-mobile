import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:trulyafricamarket/features/auth/view/login_screen.dart';
import 'package:trulyafricamarket/helpers/general_helper.dart';
import 'package:trulyafricamarket/utils/colors/pallete.dart';

class OnBoardingPage extends StatefulWidget {
  final Widget introPage1;
  final Widget introPage2;
  final Widget introPage3;
  final Widget introPage4;

  const OnBoardingPage({
    super.key,
    required this.introPage1,
    required this.introPage2,
    required this.introPage3,
    required this.introPage4,
  });

  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final PageController _controller = PageController();

  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallete.fedColor,
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                if (index == 3) {
                  onLastPage = true;
                } else {
                  onLastPage = false;
                }
              });
            },
            children: [
              widget.introPage1,
              widget.introPage2,
              widget.introPage3,
              widget.introPage4,
            ],
          ),
          Container(
            alignment: const Alignment(0, 0.85),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  child: Text(
                    'Skip',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: () {
                    _controller.jumpToPage(3);
                  },
                ),
                SmoothPageIndicator(
                  controller: _controller,
                  count: 4,
                  effect: WormEffect(
                    spacing: 5.0,
                    dotColor: Colors.white,
                    activeDotColor: Pallete.primaryColor,
                  ),
                ),
                if (onLastPage == true)
                  GestureDetector(
                    child: Text(
                      'Done',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                   onTap: () async{
                      GeneralHelpers.permanentNavigator(context, const LoginScreen());
                    },
                  )
                else
                  GestureDetector(
                    onTap: () {
                      _controller.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOutCubicEmphasized,
                      );
                    },
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Pallete.primaryColor,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.green.withOpacity(0.3),
                            blurRadius: 8,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                        size: 28,
                      ),
                    ),
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }
}