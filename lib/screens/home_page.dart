import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:lotusandgems/firebase/auth_provider.dart';
import 'package:lotusandgems/screens/login_page.dart';

import 'package:lotusandgems/utils/constants/colors.dart';
import 'package:lotusandgems/utils/constants/device_utility.dart';
import 'package:lotusandgems/utils/constants/image_strings.dart';
import 'package:lotusandgems/utils/constants/sizes.dart';
import 'package:lotusandgems/widgets/custom_app_drawer.dart';
import 'package:lotusandgems/widgets/customappbar.dart';
import 'package:lotusandgems/widgets/goldsilverratecard.dart';
import 'package:lotusandgems/widgets/allplancontainer.dart';
import 'package:provider/provider.dart';


import '../widgets/shopcategorycontainer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> bannerImages = [
      MKImg.banner1,
      MKImg.banner2,
      MKImg.banner3,
      MKImg.banner4,
      MKImg.banner5,
      MKImg.banner6,
      MKImg.banner7,
      MKImg.banner8,
    ];

    return SafeArea(
      child: Scaffold(
        drawer: const CustomAppDrawer(),
        appBar: CustomAppBar(
          logoAssetPath: MKImg.lgLogo2,
          actions: [
            IconButton(
              icon: const Icon(Ionicons.notifications_outline, color: MKColors.primary),
              onPressed: () {
                // Handle notifications
              },
            ),
            IconButton(
              icon: const Icon(Ionicons.log_out_outline, color: MKColors.primary),
              onPressed: () async {
                final authProvider = Provider.of<AuthProvider>(context, listen: false);

                await authProvider.logout(); // Call Firebase logout

                // Navigate to login screen (clear previous stack)
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => const LoginScreen()),
                      (route) => false,
                );
              },
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: SingleChildScrollView(
            child: Column(
            
              children: [
                CarouselSlider.builder(
                  itemCount: bannerImages.length,
                  options: CarouselOptions(
                    height: MKDeviceUtils.getScreenHeight(context) / 4,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    viewportFraction: 1.0,
                    autoPlayCurve: Curves.fastEaseInToSlowEaseOut,
                    autoPlayInterval: const Duration(seconds: 3),
                    autoPlayAnimationDuration: const Duration(milliseconds: 800),
                    pauseAutoPlayOnTouch: true,
                  ),
                  itemBuilder: (BuildContext context, int index, int realIndex) {
                    return Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                            Radius.circular(MKSizes.borderRadiusLg)),
                      ),
                      //margin: const EdgeInsets.symmetric(horizontal: MKSizes.spaceBtwItems),
                      width: MKDeviceUtils.getScreenWidth(context),
                      height: MKDeviceUtils.getScreenHeight(context) /
                          2, // Add height to the container
                      child: ClipRRect(
                        // Optional: Clip the image with rounded corners
                        borderRadius: const BorderRadius.all(
                            Radius.circular(MKSizes.borderRadiusLg)),
                        child: Image.asset(
                          bannerImages[
                              index], // Dynamically load image from the list
                          fit: BoxFit
                              .cover, // Use BoxFit.cover for proper image aspect ratio
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: MKSizes.defaultSpace,
                ),
                GoldSilverRateCard(),
                const SizedBox(
                  height: MKSizes.defaultSpace,
                ),
                const AllPlanContainer(),
                const SizedBox(
                  height: MKSizes.defaultSpace,
                ),
                 Text(
                  "Shop By Category",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Container(
                  height: 250,

                  width: MKDeviceUtils.getScreenWidth(context),
                  child: const ShopByCategoryContainer(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
