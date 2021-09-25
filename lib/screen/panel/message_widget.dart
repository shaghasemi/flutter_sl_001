import 'package:flutter/material.dart';
import '/screen/panel/product/product_horizontoal_scroller_minimal.dart';

class MessageWidget extends StatelessWidget {
  const MessageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Maybe will need cardview
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text("Status Update"),
              Text('Read or Unread'), // Could be a dot (like digikala)
            ],
          ),
          const Text('Call to Action'),
          const ProductHorizontalScrollerMinimal(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Time or Order: how long ago'),
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.forward),
                label: const Text("مشاهده سفارش"),
              )
            ],
          ),
        ],
      ),
    );
  }
}
