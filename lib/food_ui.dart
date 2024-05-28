import 'package:flutter/material.dart';
import 'package:foodui_assignment/widget/card_widget.dart';
import 'package:foodui_assignment/widget/custom_appbar.dart';
import 'package:foodui_assignment/widget/searchbar.dart';
import 'package:google_fonts/google_fonts.dart';

import 'data/data.dart';

class FoodHomeScreen extends StatelessWidget {
  const FoodHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              const CustomAppBar(),
              const SizedBox(height: 20),
              const CustomSearchBar(),
              const SizedBox(height: 20),
              Expanded(
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Found\n80 Results',
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                ),
                              ),
                            ),
                            for (int i = 0; i < 4; i++)
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CustomBoxWidget(foodData: foodList[i]),
                              ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            for (int i = 4; i < 8; i++)
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CustomBoxWidget(foodData: foodList[i]),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



