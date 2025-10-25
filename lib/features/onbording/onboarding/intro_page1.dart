import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trulyafricamarket/utils/assets_utils.dart';
import '../../../../utils/colors/pallete.dart';

class IntroPage1 extends StatelessWidget {
  const IntroPage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          color: Pallete.fedColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Center(
              child: Image.asset(Assets.onb1),
            ),
            const SizedBox(height: 24), 
            
            Text(
              'Register Now !',
              textAlign: TextAlign.start,
              style: GoogleFonts.poppins(
                color: Pallete.lightPrimaryTextColor,
                fontWeight: FontWeight.w700,
                fontSize: 32, 
              ),
            ),
            const SizedBox(height: 8),
            
            Text(
              'To get started with your clients, schedule a discovery meeting to understand their business needs.',
              textAlign: TextAlign.start,
              style: GoogleFonts.poppins(
                color: Pallete.lightPrimaryTextColor,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}