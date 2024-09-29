import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constan.dart';
import '../seat_status.dart';

class InfoSeating extends StatelessWidget {
  const InfoSeating({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SeatStatus(
          color: grey,
          status: 'Available',
        ),
        SizedBox(width: 10),
        SeatStatus(
          color: buttonColor,
          status: 'Selected',
        ),
        SizedBox(width: 10),
        SeatStatus(
          color: Colors.white,
          status: 'Reserved',
        ),
      ],
    );
  }
}
