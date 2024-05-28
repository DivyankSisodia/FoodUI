import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 7,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: TextFormField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey.withOpacity(0.2),
                hintText: 'Search for food',
                hintStyle: TextStyle(
                  color: Colors.grey.withOpacity(0.5),
                  fontFamily: GoogleFonts.poppins().fontFamily,
                ),
                prefixIcon: const Icon(
                  CupertinoIcons.search,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: Container(
            padding: const EdgeInsets.all(15),
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: Colors.yellow[700],
              borderRadius: BorderRadius.circular(10),
            ),
            // child: Center(
            //   child: Text(
            //     'Search',
            //     style: TextStyle(
            //       color: Colors.white,
            //       fontSize: 18,
            //       fontWeight: FontWeight.w600,
            //       fontFamily: GoogleFonts.poppins().fontFamily,
            //     ),
            //   ),
            // ),
            child: Image.asset(
              'assets/icons8-filter-50.png',
              height: 10,
              width: 10,
            ),
          ),
        ),
      ],
    );
  }
}
