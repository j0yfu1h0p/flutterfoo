import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          'Notification',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Your Activity Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Your Activity',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'See More',
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Notification Items
              _buildNotificationItem(
                icon: Icons.shopping_bag_outlined,
                title: 'Order Arrived',
                description:
                    'Order 24089794727000824 has been completed & arrived at the destination address ( Please rates your order )',
                timestamp: 'July 20, 2020 (08:00 pm)',
              ),
              const SizedBox(height: 20),

              _buildNotificationItem(
                icon: Icons.check_circle_outline,
                title: 'Order Success',
                description:
                    'Order 24089794727000824 has been Success. Please wait for the product to be sent',
                timestamp: 'July 20, 2020 (08:00 pm)',
              ),
              const SizedBox(height: 20),

              _buildNotificationItem(
                icon: Icons.credit_card,
                title: 'Payment Confirmed',
                description:
                    'Payment order 24089794727000824 has been confirmed. Please wait for the product to be sent',
                timestamp: 'July 20, 2020 (08:00 pm)',
              ),
              const SizedBox(height: 20),

              _buildNotificationItem(
                icon: Icons.close,
                title: 'Order Canceled',
                description:
                    'Refunds order 24089794727000824 have been processed. A fund of \$ 120 will be returned in 15 minutes',
                timestamp: 'July 20, 2020 (08:00 pm)',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNotificationItem({
    required IconData icon,
    required String title,
    required String description,
    required String timestamp,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Icon Container
        Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            color: const Color(0xFFFFECDF),
            borderRadius: BorderRadius.circular(28),
          ),
          child: Icon(icon, color: const Color(0xFFEA8735), size: 28),
        ),
        const SizedBox(width: 16),

        // Content
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 6),
              RichText(
                text: TextSpan(
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                    height: 1.5,
                  ),
                  children: _parseDescriptionWithOrangeNumbers(description),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                timestamp,
                style: TextStyle(fontSize: 12, color: Colors.grey[400]),
              ),
            ],
          ),
        ),
      ],
    );
  }

  List<TextSpan> _parseDescriptionWithOrangeNumbers(String text) {
    final List<TextSpan> spans = [];
    final RegExp numberPattern = RegExp(r'\b\d{10,}\b|\$\s?\d+');
    int lastIndex = 0;

    for (final match in numberPattern.allMatches(text)) {
      // Add text before the number
      if (match.start > lastIndex) {
        spans.add(TextSpan(text: text.substring(lastIndex, match.start)));
      }

      // Add the number in orange
      spans.add(
        TextSpan(
          text: match.group(0),
          style: const TextStyle(
            color: Color(0xFFEA8735),
            fontWeight: FontWeight.w600,
          ),
        ),
      );

      lastIndex = match.end;
    }

    // Add remaining text
    if (lastIndex < text.length) {
      spans.add(TextSpan(text: text.substring(lastIndex)));
    }

    return spans;
  }
}
