import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../constan.dart';
import '../../models/seats_model.dart';

class ListInfoByHour extends StatefulWidget {
  const ListInfoByHour({super.key});

  @override
  State<ListInfoByHour> createState() => _ListInfoByHourState();
}

class _ListInfoByHourState extends State<ListInfoByHour> {
  DateTime selectedTime = DateTime.now();
  List<String> selectedSeats = [];

  @override
  void initState() {
    super.initState();
    // Set default selected time to the first available time in the list
    selectedTime = DateTime.utc(
      DateTime
          .now()
          .year,
      DateTime
          .now()
          .month,
      DateTime
          .now()
          .day,
      int.parse(availableTime[0].split(':')[0]),
      int.parse(availableTime[0].split(':')[1]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ...List.generate(
              availableTime.length,
                  (index) =>
                  GestureDetector(
                      onTap: () {
                        setState(
                              () {
                            selectedSeats
                                .clear(); // Clear previous selections
                            selectedTime = DateTime.utc(
                              selectedTime.year,
                              selectedTime.month,
                              selectedTime.day,
                              int.parse(availableTime[index]
                                  .split(':')[0]),
                              int.parse(availableTime[index]
                                  .split(':')[1]),
                            );
                          },
                        );
                      },
                      child: Container(
                          margin: index == 0
                              ? const EdgeInsets.only(
                              left: 20, right: 20)
                              : const EdgeInsets.only(right: 20),
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: grey,
                            border: Border.all(
                                width: 2,
                                color: DateFormat('HH:mm')
                                    .format(selectedTime)
                                    .toString() ==
                                    availableTime[index]
                                    ? buttonColor
                                    : Colors.transparent),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            availableTime[index],
                            style: TextStyle(
                              fontSize: 14,
                              color: DateFormat('HH:mm')
                                  .format(selectedTime)
                                  .toString() ==
                                  availableTime[index]
                                  ? buttonColor
                                  : Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ))))
        ],
      ),
    );
  }
}
