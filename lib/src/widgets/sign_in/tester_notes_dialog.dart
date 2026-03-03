import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<void> showTesterNotesDialog(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (context) => AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      title: Row(
        children: const [
          Icon(Icons.bug_report, color: Colors.orange),
          SizedBox(width: 8),
          Text(
            'Tester Notes',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Test Credentials',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 244, 234, 220),
              ),
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                const Text('Username : emilys'),
                IconButton(
                  onPressed: () async {
                    await Clipboard.setData(
                      const ClipboardData(text: 'emilys'),
                    );
                  },
                  icon: const Icon(Icons.copy, size: 16),
                ),
              ],
            ),
            Row(
              children: [
                const Text('Password : emilyspass'),
                IconButton(
                  onPressed: () async {
                    await Clipboard.setData(
                      const ClipboardData(text: 'emilyspass'),
                    );
                  },
                  icon: const Icon(Icons.copy, size: 16),
                ),
              ],
            ),
            const Divider(height: 24),
            const Text(
              'API Endpoint',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
            ),
            const SizedBox(height: 4),
            const Text('POST https://dummyjson.com/auth/login'),
            const Divider(height: 24),
            const Text(
              'Notes',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
            ),
            const SizedBox(height: 4),
            const Text('• Tokens expire in 30 minutes'),
            const Text('• Use the test credentials above to log in'),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Close', style: TextStyle(color: Colors.orange)),
        ),
      ],
    ),
  );
}
