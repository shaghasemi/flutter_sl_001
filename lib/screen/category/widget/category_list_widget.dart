import 'package:flutter/material.dart';

class CategoryListWidget extends StatelessWidget {
  final String title_en_0;
  final String title_fa_0;
  final String slug_0;
  final int lvl_0;
  final String title_en_1;
  final String title_fa_1;

  const CategoryListWidget({
    Key? key,
    required this.title_en_0,
    required this.title_fa_0,
    required this.slug_0,
    required this.lvl_0,
    required this.title_en_1,
    required this.title_fa_1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Level 0:
          Text(title_fa_0),
          // Text(title_en_0),
          // Text(slug_0),
          // Text(lvl_0.toString()),

          // Level 1
          SizedBox(
            height: 55,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return SizedBox(
                  height: 30,
                  width: 40,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(title_fa_1),
                        Text(title_en_1),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
