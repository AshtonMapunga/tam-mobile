import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trulyafricamarket/utils/assets_utils.dart';
import '../../../../utils/colors/pallete.dart';

class IntroPage4 extends StatelessWidget {
  const IntroPage4({Key? key}) : super(key: key);

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
              child: Image.asset(Assets.onb4),
            ),
            const SizedBox(height: 24), 
            
            Text(
              'Discover. Shop. Enjoy.',
              textAlign: TextAlign.start,
              style: GoogleFonts.poppins(
                color: Pallete.lightPrimaryTextColor,
                fontWeight: FontWeight.w700,
                fontSize: 32, 
              ),
            ),
            const SizedBox(height: 8),
            
            Text(
              'Experience smooth and smart shopping with quick delivery and amazing deals every day.',
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