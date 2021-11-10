import 'package:flutter/material.dart';

class OrderByStatusWidget extends StatelessWidget {
  const OrderByStatusWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 0),
          child: const Text(
            "سفارش ها",
            style: TextStyle(fontSize: 18),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          reverse: true,
          child: Row(
            children: [
              OrderCategoryItem(
                iconAsset: Icons.payment,
                title: "منتظر پرداخت",
              ),
              OrderCategoryItem(
                iconAsset: Icons.av_timer,
                title: "در حال پردازش",
              ),
              OrderCategoryItem(
                iconAsset: Icons.cloud_done,
                title: "تحویل شده",
              ),
              OrderCategoryItem(
                iconAsset: Icons.delete_forever,
                title: "لغو شده",
              ),
              OrderCategoryItem(
                iconAsset: Icons.assignment_return,
                title: "مرجوع شده",
              ),
            ],
          ),
        ),
      ],
    );
  }

  OrderCategoryItem({required IconData iconAsset, required String title}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: SizedBox(
        width: 80,
        // height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Image.asset('assets/images/processing.png'),
            Icon(
              iconAsset,
              size: 48,
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
