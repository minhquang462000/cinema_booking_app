import 'package:cinematic_app/constan.dart';
import 'package:cinematic_app/widgets/Reservation/info_seating.dart';
import 'package:cinematic_app/widgets/Reservation/list_info_by_hour.dart';
import 'package:cinematic_app/widgets/Reservation/list_info_month.dart';
import 'package:cinematic_app/widgets/Reservation/seating_chart.dart';
import 'package:cinematic_app/widgets/Reservation/total_price_and_btn.dart';
import 'package:cinematic_app/widgets/Reservation/welcome_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/seats_model.dart';
import '../widgets/seat_status.dart';

class ReservationScreen extends StatefulWidget {
  const ReservationScreen({super.key});

  @override
  State<ReservationScreen> createState() => _ReservationScreenState();
}

class _ReservationScreenState extends State<ReservationScreen> {
  final items = List<DateTime>.generate(15, (index) {
    return DateTime.utc(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
    ).add(Duration(days: index));
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBackgroundColor,
      appBar: AppBar(
        forceMaterialTransparency: true,
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
              size: 16,
            )),
        title: const Text(
          "Select Seats",
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const WelcomeBorder(),
          Column(
            children: [
              ...List.generate(
                numRow.length,
                (colIndex) {
                  int numCol =
                      colIndex == 0 || colIndex == numRow.length - 1 ? 6 : 8;
                  return Padding(
                      padding: EdgeInsets.only(
                        bottom: colIndex == numRow.length - 1 ? 0 : 10,
                      ),
                      child: SeatingChart(numCol: numCol, colIndex: colIndex));
                },
              ),
              const SizedBox(height: 20),
              const InfoSeating(),
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 35),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(50),
                  ),
                ),
                child: Column(
                  children: [
                    const Text(
                      'Select Date and Time',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 35),
                    ListInfoMonth(items: items),
                    const SizedBox(height: 25),
                    const ListInfoByHour(),
                    const SizedBox(height: 35),
                    const TotalPriceAndBtn()
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
