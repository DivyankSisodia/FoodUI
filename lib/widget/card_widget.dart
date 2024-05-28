import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../model/food_model.dart';

class CustomBoxWidget extends StatelessWidget {
  final FoodData foodData;

  const CustomBoxWidget({required this.foodData, super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Here i am trying to make the widget responsive
    final isLargeScreen = screenWidth > 600;
    final isTallScreen = screenHeight > 800;

    double containerWidth;
    double containerHeight;
    double imageRadius;
    double titleFontSize;
    double subtitleFontSize;
    double caloriesFontSize;
    double priceFontSize;

    if (isLargeScreen && isTallScreen) {
      // Large screen and tall device
      containerWidth = screenWidth * 0.3;
      containerHeight = screenHeight * 0.35;
      imageRadius = containerWidth * 0.35;
      titleFontSize = 18;
      subtitleFontSize = 14;
      caloriesFontSize = 16;
      priceFontSize = 20;
    } else if (isLargeScreen) {
      // Large screen but not tall
      containerWidth = screenWidth * 0.3;
      containerHeight = screenHeight * 0.3;
      imageRadius = containerWidth * 0.35;
      titleFontSize = 16;
      subtitleFontSize = 12;
      caloriesFontSize = 14;
      priceFontSize = 18;
    } else if (isTallScreen) {
      // Small screen but tall device
      containerWidth = screenWidth * 0.4;
      containerHeight = screenHeight * 0.3;
      imageRadius = containerWidth * 0.35;
      titleFontSize = 16;
      subtitleFontSize = 12;
      caloriesFontSize = 14;
      priceFontSize = 18;
    } else {
      // Small screen and not tall
      containerWidth = screenWidth * 0.4;
      containerHeight = screenHeight * 0.33;
      imageRadius = containerWidth * 0.35;
      titleFontSize = 14;
      subtitleFontSize = 10;
      caloriesFontSize = 12;
      priceFontSize = 16;
    }

    return Container(
      height: containerHeight,
      width: containerWidth,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            child: Container(
              height: containerHeight - imageRadius - 20,
              width: containerWidth,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.grey.withOpacity(0.2),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 10,
                    spreadRadius: 2,
                    offset: const Offset(0, 3),
                  )
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    foodData.title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: titleFontSize,
                      fontWeight: FontWeight.bold,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                    ),
                  ),
                  Text(
                    foodData.subtitle,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: subtitleFontSize,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            blurRadius: 10,
                            spreadRadius: 2,
                            offset: const Offset(0, 3),
                          )
                        ]),
                        child: Text(
                          '🔥',
                          style: TextStyle(
                            fontSize: caloriesFontSize,
                            color: Colors.yellow[700],
                            fontWeight: FontWeight.bold,
                            fontFamily: GoogleFonts.poppins().fontFamily,
                          ),
                        ),
                      ),
                      Text(
                        '${foodData.calories} calories',
                        style: TextStyle(
                          fontSize: caloriesFontSize,
                          color: Colors.redAccent,
                          fontWeight: FontWeight.bold,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '\$',
                        style: TextStyle(
                          fontSize: caloriesFontSize,
                          color: Colors.yellow[700],
                          fontWeight: FontWeight.bold,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                        ),
                      ),
                      Text(
                        foodData.price,
                        style: TextStyle(
                          fontSize: priceFontSize,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: (containerWidth - imageRadius * 2) / 2,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(100),
                border: Border.all(
                  color: Colors.grey.withOpacity(0.2),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    blurRadius: 10,
                    spreadRadius: 2,
                    offset: const Offset(0, 3),
                  )
                ],
              ),
              child: CircleAvatar(
                radius: imageRadius,
                backgroundImage: NetworkImage(
                  foodData.imagePath,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
