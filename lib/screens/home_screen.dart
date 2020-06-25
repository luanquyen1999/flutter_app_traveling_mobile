import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travelling_mobile_app/global/app_colors.dart';
import 'package:travelling_mobile_app/screens/detail_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 64),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              child: Stack(
                children: [
                  ///Container for the welcome text
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Hi, Maazi",style: GoogleFonts.poppins(
                          color: AppColors.veryLightTextColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                        ),
                        Text("Where\nare you going\non vacations?",style: GoogleFonts.playfairDisplay(
                          color: AppColors.darkTextColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 36,
                        ),
                        ),
                      ],
                    ),
                  ),
                  ///profile picture
                  Positioned(
                    right: 0,
                      top: 0,
                      child:CircleAvatar(
                          radius: 30,
                        child: ClipOval(
                          child: Image.asset("assets/dp.jpg"),
                    ),
                  ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16,),
            ///Container for actionabies
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                      "Top",
                    style: GoogleFonts.poppins(
                      color: AppColors.lightGreenColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w700
                    ),
                  ),
                  Text(
                    "For you",
                    style: GoogleFonts.poppins(
                        color: AppColors.veryLightTextColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w700
                    ),
                  ),
                  Text(
                    "Hidden Gens",
                    style: GoogleFonts.poppins(
                        color: AppColors.veryLightTextColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w700
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.menu,
                      color: AppColors.veryLightTextColor,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 16,),
            ///Container for places list
            Expanded(
                child: Container(
                  child: LayoutGrid(
                      columnGap: 12,
                      rowGap: 12,
                    templateColumnSizes: [
                      FlexibleTrackSize(1),
                      FlexibleTrackSize(1),
                      ///weans 50% to both colums
                    ],
                    templateRowSizes: [
                      FlexibleTrackSize(1),
                      FlexibleTrackSize(0.6),
                      FlexibleTrackSize(1),
                    ],
                    children: [
                      ///Lets make container for each elements
                      getPlaceWidget("assets/5.svg").withGridPlacement(
                        rowStart: 0, columnStart: 0, rowSpan: 2
                      ),
                      getPlaceWidget("assets/3.svg").withGridPlacement(
                          rowStart: 2, columnStart: 0, rowSpan: 1
                      ),
                      getPlaceWidget("assets/2.svg").withGridPlacement(
                        rowStart: 0, columnStart: 1, rowSpan: 1
                      ),
                      getPlaceWidget("assets/4.svg").withGridPlacement(
                        rowStart: 1, columnStart: 1, rowSpan: 2
                      ),
                    ],
                  ),
                ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getPlaceWidget(imagePath) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => DetailScreen(imagePath),),);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: [
            Hero(
              ///For hero animation on route transition
              tag: imagePath,
              child: ClipRRect(
                child: SvgPicture.asset(imagePath, fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(20),
            ),
          ),
            Positioned(
              top: 10,
              left: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Pakistan",
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  ///Rating
                  Chip(
                    backgroundColor: Colors.white,
                      label: Row(
                        children: [
                          Icon(Icons.star,color: AppColors.lightGreenColor,size: 15,),
                          SizedBox(width:4,),
                          Text(
                            "4.0",
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: AppColors.veryLightTextColor,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      )
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
