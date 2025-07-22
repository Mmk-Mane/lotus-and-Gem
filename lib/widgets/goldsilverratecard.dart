import 'package:flutter/material.dart';
import 'package:lotusandgems/utils/constants/colors.dart';
import 'package:lotusandgems/utils/constants/device_utility.dart';
import 'package:lotusandgems/utils/constants/image_strings.dart';
import 'package:lotusandgems/utils/constants/sizes.dart';

class GoldSilverRateCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme; // Access the text theme

    return Stack(
      children: [
        // The main red container
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            // Card background color
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: AssetImage(
                MKImg.cardbg1,
              ),
              fit: BoxFit.fill,
            ),
          ),
          width: MKDeviceUtils.getScreenWidth(context),
          height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  Image.asset(MKImg.goldlogo, height: 55, ),
                  SizedBox(width: 8,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Gold Rate',
                        style: textTheme.bodySmall?.copyWith(
                          color: Colors.white, // Text color white
                        ),
                      ),
                      SizedBox(
                        height: MKSizes.spaceBtwItems - 10,
                      ),
                      Text(
                        'Rs. 7000',
                        style: textTheme.bodySmall?.copyWith(
                          color: Colors.white, // Text color white
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                width: 2, // Divider width
                height: 80, // Divider height
                color: MKColors.white, // Divider color
              ),
              Row(
                children: [
                  Image.asset(MKImg.silverlogo, height: 55,),
                  SizedBox(width: 10,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Silver Rate',
                        style: textTheme.bodySmall?.copyWith(
                          color: Colors.white, // Text color white
                        ),
                      ),
                      SizedBox(
                        height: MKSizes.spaceBtwItems - 10,
                      ),
                      Text(
                        'Rs. 100',
                        style: textTheme.bodySmall?.copyWith(
                          color: Colors.white, // Text color white
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),

        // Left yellow circle
        Positioned(
          top: 40, // Vertically center
          left: -10, // Adjust to align with left margin
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 10, // Circle size
          ),
        ),

        // Right yellow circle
        Positioned(
          top: 40, // Vertically center
          right: -10, // Adjust to align with right margin
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 10, // Circle size
          ),
        ),
      ],
    );
  }
}
