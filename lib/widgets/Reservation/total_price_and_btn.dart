import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constan.dart';
import '../../models/seats_model.dart';

class TotalPriceAndBtn extends StatefulWidget {
  const TotalPriceAndBtn({super.key});

  @override
  State<TotalPriceAndBtn> createState() => _TotalPriceAndBtnState();
}

class _TotalPriceAndBtnState extends State<TotalPriceAndBtn> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Total Price',
                style: TextStyle(fontSize: 12, color: Colors.white),
              ),
              const SizedBox(height: 8),
              Text(
                '\$${selectedSeats.length * 20}.00',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              )
            ],
          ),
          const SizedBox(width: 30),
          Expanded(
              child: GestureDetector(
            onTap: () {},
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                color: buttonColor,
                borderRadius: BorderRadius.circular(40),
              ),
              child: const Center(
                child: Text(
                  'Continue',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ))
        ],
      ),
    );
  }
}
