import 'package:flutter/material.dart';
import 'package:lotusandgems/utils/constants/image_strings.dart';

class ShopByCategoryContainer extends StatelessWidget {
  const ShopByCategoryContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Categories with corresponding image paths
    final List<Map<String, String>> categories = [
      {'name': 'Earring', 'image': MKImg.Earrings},
      {'name': 'Bangle', 'image': MKImg.Bangles},
      {'name': 'Rings', 'image': MKImg.Rings},
      {'name': 'Necklaces', 'image': MKImg.Necklaces},
      {'name': 'Chains', 'image': MKImg.Chains},
      {'name': 'Pendants', 'image': MKImg.Pendants},
    ];

    return ListView.builder(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.all(16.0),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        final category = categories[index];
        return GestureDetector(
          onTap: () {
            // Print the category name in the console for now
            print("Selected Category: ${category['name']}");
            // Add navigation here when pages are ready
          },
          child: Container(
            margin: const EdgeInsets.only(left: 10, right: 10), // Space around each item
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center, // Center the items
              children: [
                // Category Image
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12), // Rounded corners
                    image: DecorationImage(
                      image: AssetImage(category['image']!),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 10), // Space between image and text

                // Category Name
                Text(
                  category['name']!,
                  style: Theme.of(context).textTheme.titleSmall,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
