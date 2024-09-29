import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MovieInfo extends StatelessWidget {
  final String value, name;
  final IconData icon;

  const MovieInfo(
      {super.key, required this.value, required this.name, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(width: 1.5, color: Colors.white12)),
      child: Center(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
                BoxShadow(
                    color: Colors.white.withOpacity(0.1),
                    blurRadius: 10,
                    spreadRadius: 10)
              ]),
              child: Icon(
                icon,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              name,
              style: const TextStyle(
                  color: Colors.white24,
                  fontWeight: FontWeight.bold,
                  fontSize: 14),
            ),
            Text(
              value,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
