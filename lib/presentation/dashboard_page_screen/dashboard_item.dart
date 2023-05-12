import 'package:flutter/material.dart';

class DashboardItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onPressed;

  const DashboardItem({
    required this.title,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      child: InkWell(
        onTap: onPressed,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 28.0),
            SizedBox(height: 4.0),
            Text(
              title,
              style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}