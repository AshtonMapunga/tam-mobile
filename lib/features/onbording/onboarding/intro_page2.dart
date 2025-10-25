import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trulyafricamarket/utils/assets_utils.dart';
import '../../../../utils/colors/pallete.dart';

class IntroPage2 extends StatelessWidget {
  const IntroPage2({Key? key}) : super(key: key);

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
              child: Image.asset(Assets.onb2),
            ),
            const SizedBox(height: 24), 
            
            Text(
              'Purchase  Products !',
              textAlign: TextAlign.start,
              style: GoogleFonts.poppins(
                color: Pallete.lightPrimaryTextColor,
                fontWeight: FontWeight.w700,
                fontSize: 32, 
              ),
            ),
            const SizedBox(height: 8),
            
            Text(
              'Explore our wide collection of high-quality products designed to meet your needs.',
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