import 'package:flutter/material.dart';

class FavoriteCategoriesSliderWidget extends StatelessWidget {
  const FavoriteCategoriesSliderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      controller: ScrollController(initialScrollOffset: 140),
      reverse: true,
      child: Row(
        children: [
          CardCategory(iconAsset: Icons.save, categoryName: 'عنوان دسته'),
          CardCategory(iconAsset: Icons.save, categoryName: 'عنوان دسته'),
          CardCategory(iconAsset: Icons.save, categoryName: 'عنوان دسته'),
          CardCategory(iconAsset: Icons.save, categoryName: 'عنوان دسته'),
          CardCategory(iconAsset: Icons.save, categoryName: 'عنوان دسته'),
          CardCategory(iconAsset: Icons.save, categoryName: 'عنوان دسته'),
          CardCategory(iconAsset: Icons.save, categoryName: 'عنوان دسته'),
          CardCategory(iconAsset: Icons.save, categoryName: 'عنوان دسته'),
          CardCategory(iconAsset: Icons.save, categoryName: 'عنوان دسته'),
        ],
      ),
    );
  }
}

class CardCategory extends StatelessWidget {
  final IconData iconAsset;
  final String categoryName;

  const CardCategory({
    Key? key,
    required this.iconAsset,
    required this.categoryName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 94,
        width: 80,
        // width: MediaQuery.of(context).size.width*.85,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                child: Icon(
                  iconAsset,
                  size: 40,
                  color: Colors.black,
                ),
                backgroundColor: Colors.transparent,
              ),
            ),
            Text('نام دسته'),
          ],
        ));
  }
}
