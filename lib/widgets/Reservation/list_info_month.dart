import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../constan.dart';
import '../../models/seats_model.dart';

class ListInfoMonth extends StatefulWidget {
  final List<DateTime> items;

  const ListInfoMonth({super.key, required this.items});

  @override
  State<ListInfoMonth> createState() => _ListInfoMonthState();
}

class _ListInfoMonthState extends State<ListInfoMonth> {
  DateTime selectedTime = DateTime.now();
  List<String> selectedSeats = [];

  @override
  void initState() {
    super.initState();
    // Set default selected time to the first available time in the list
    selectedTime = DateTime.utc(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
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
              widget.items.length,
              (index) => GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedSeats.clear(); // Clear previous selections
                      selectedTime =
                          widget.items[index]; // Update selected date
                    });
                  },
                  child: Container(
                    margin: index == 0
                        ? const EdgeInsets.only(left: 20, right: 20)
                        : const EdgeInsets.only(right: 20),
                    padding: const EdgeInsets.fromLTRB(8, 12, 8, 8),
                    decoration: BoxDecoration(
                      color: DateFormat('d/M/y').format(selectedTime) ==
                              DateFormat('d/M/y').format(widget.items[index])
                          ? buttonColor
                          : grey,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Column(
                      children: [
                        Text(
                          DateFormat('MMM').format(widget.items[index]),
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: DateFormat('d/M/y').format(selectedTime) ==
                                    DateFormat('d/M/y')
                                        .format(widget.items[index])
                                ? Colors.white
                                : Colors.transparent,
                          ),
                          child: Text(
                            DateFormat('dd').format(widget.items[index]),
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: DateFormat('d/M/y').format(selectedTime) ==
                                      DateFormat('d/M/y')
                                          .format(widget.items[index])
                                  ? appBackgroundColor
                                  : Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                  )))
        ],
      ),
    );
  }
}
