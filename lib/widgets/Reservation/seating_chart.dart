import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constan.dart';
import '../../models/seats_model.dart';

class SeatingChart extends StatefulWidget {
  final int numCol;
  final int colIndex;

  const SeatingChart(
      {super.key, required this.numCol, required this.colIndex,});

  @override
  State<SeatingChart> createState() => _SeatingChartState();
}

class _SeatingChartState extends State<SeatingChart> {


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ...List.generate(widget.numCol, (rowIndex) {
          String seatNum = '${numRow[widget.colIndex]}${rowIndex + 1}';
          return GestureDetector(
            onTap: () {
              setState(() {
                if (selectedSeats.contains(seatNum)) {
                  selectedSeats.remove(seatNum);
                } else if (!reservedSeats.contains(seatNum)) {
                  selectedSeats.add(seatNum);
                }
              });
            },
            child: Container(
              height: 30,
              width: 30,
              margin: EdgeInsets.only(
                  right:
                  rowIndex == (widget.numCol / 2) - 1 ? 30 : 10),
              decoration: BoxDecoration(
                color: reservedSeats.contains(seatNum)
                    ? Colors.white
                    : selectedSeats.contains(seatNum)
                    ? buttonColor
                    : grey,
                borderRadius: BorderRadius.circular(7.5),
              ),
            ),
          );
        })
      ],
    );
  }
}
