import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class RadioTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Expanded(
              flex: 3,
              child: Center(child: Image.asset('assets/images/radio_image.png'))),
          Expanded(
            flex: 1,
            child: Center(
              child: Text(
                "إزاعة القرآن الكريم",
                style: GoogleFonts.elMessiri(fontSize: 30),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: (){},
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset("assets/images/Icon metro-next-1.png"),
                    ),
                  ),
                  InkWell(
                    onTap: (){},
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset("assets/images/Icon awesome-play.png"),
                    ),
                  ),
                  InkWell(
                    onTap: (){},
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset("assets/images/Icon metro-next.png"),
                    ),
                  ),

                ],),
            ),
          ),
        ],
      ),
    );
  }
}
