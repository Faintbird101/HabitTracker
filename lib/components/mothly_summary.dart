// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';
import 'package:habits/datetime/date_time.dart';

class MonthlySummary extends StatelessWidget {
  final Map<DateTime, int>? datasets;
  final String startDate;

  const MonthlySummary({
    super.key,
    required this.datasets,
    required this.startDate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20, bottom: 20),
      child: HeatMap(
        startDate: createDateTimeObject(startDate),
        endDate: DateTime.now().add(
          Duration(days: 0),
        ),
        datasets: datasets,
        colorMode: ColorMode.color,
        defaultColor: Colors.grey,
        textColor: Colors.white,
        showColorTip: false,
        showText: true,
        scrollable: true,
        size: 30,
        colorsets: const {
          1: Color.fromARGB(20, 2, 181, 226),
          2: Color.fromARGB(40, 2, 181, 226),
          3: Color.fromARGB(60, 2, 181, 226),
          4: Color.fromARGB(80, 2, 181, 226),
          5: Color.fromARGB(100, 2, 181, 226),
          6: Color.fromARGB(120, 2, 181, 226),
          7: Color.fromARGB(140, 2, 181, 226),
          8: Color.fromARGB(160, 2, 181, 226),
          9: Color.fromARGB(180, 2, 181, 226),
          10: Color.fromARGB(200, 2, 181, 226),
          11: Color.fromARGB(225, 2, 181, 226),
        },
        onClick: (value) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                value.toString(),
              ),
            ),
          );
        },
      ),
    );
  }
}
