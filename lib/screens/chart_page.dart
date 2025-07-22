import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:lotusandgems/utils/constants/device_utility.dart';

class GoldRateChartPage extends StatelessWidget {
  final List<double> goldRates = [7080, 7040, 6960, 6880, 6900, 7020, 7060];
  final List<String> dates = [
    "11 Nov",
    "12 Nov",
    "13 Nov",
    "14 Nov",
    "15 Nov",
    "16 Nov",
    "17 Nov"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Rate Chart",
          style: TextStyle(
            color: Colors.brown,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          width: MKDeviceUtils.getScreenWidth(context) -10,
          height: 300, // Set fixed height for the chart
          child: LineChart(
            LineChartData(
              gridData: FlGridData(
                show: true,
                drawHorizontalLine: true,
                drawVerticalLine: true,
                getDrawingHorizontalLine: (value) => FlLine(
                  color: Colors.grey.shade300,
                  strokeWidth: 1,
                ),
                getDrawingVerticalLine: (value) => FlLine(
                  color: Colors.grey.shade300,
                  strokeWidth: 1,
                ),
              ),
              titlesData: FlTitlesData(
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (value, meta) {
                      int index = value.toInt();
                      return index < dates.length
                          ? Text(
                        dates[index],
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                        ),
                      )
                          : const SizedBox.shrink();
                    },
                    reservedSize: 22,
                  ),
                ),
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (value, meta) {
                      return Text(
                        '₹${value.toInt()}',
                        style: const TextStyle(fontSize: 12, color: Colors.black),
                      );
                    },
                    reservedSize: 40,
                  ),
                ),
                topTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false), // Remove top axis
                ),
                rightTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false), // Remove right axis
                ),
              ),
              borderData: FlBorderData(
                show: true,
                border: const Border(
                  left: BorderSide(color: Colors.grey),
                  bottom: BorderSide(color: Colors.grey),
                ),
              ),
              minX: 0,
              maxX: goldRates.length - 1,
              minY: goldRates.reduce((a, b) => a < b ? a : b) - 10,
              maxY: goldRates.reduce((a, b) => a > b ? a : b) + 10,
              lineBarsData: [
                LineChartBarData(
                  spots: List.generate(
                    goldRates.length,
                        (index) => FlSpot(index.toDouble(), goldRates[index]),
                  ),
                  isCurved: true,
                  color: Colors.yellow,
                  barWidth: 3,
                  dotData: FlDotData(show: true), // Show data points
                  belowBarData: BarAreaData(show: false), // No gradient fill
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
