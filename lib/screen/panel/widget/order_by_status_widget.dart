import 'package:flutter/material.dart';

class OrderByStatusWidget extends StatelessWidget {
  const OrderByStatusWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("My Orders"),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          reverse: true,
          child: Row(
            children: [
              // Different boxes for orders
              Column(
                children: [
                  Image.asset('assets/images/awaiting_payment.png'),
                  const Text("در انتظار پرداخت"),
                ],
              ),
              Column(
                children: [
                  Image.asset('assets/images/processing.png'),
                  const Text("در حال پردازش"),
                ],
              ),
              Column(
                children: [
                  Image.asset('assets/images/processing.png'),
                  const Text("ارسال شده"),
                ],
              ),
              Column(
                children: [
                  Image.asset('assets/images/processing.png'),
                  const Text("تحویل شده"),
                ],
              ),
              Column(
                children: [
                  Image.asset('assets/images/processing.png'),
                  const Text("مرجوعی"),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
