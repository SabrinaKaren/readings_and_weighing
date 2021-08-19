import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class WeighingAnalyticsPage extends StatefulWidget {
  final String title;
  const WeighingAnalyticsPage({Key? key, this.title = 'WeighingAnalyticsPage'}) : super(key: key);
  @override
  WeighingAnalyticsPageState createState() => WeighingAnalyticsPageState();
}

class WeighingAnalyticsPageState extends State<WeighingAnalyticsPage> {

  List<Color> _gradientColors = [
    const Color(0xffffffff),
    const Color(0xffffffff),
  ];

  @override
  Widget build(BuildContext context) {

    FlGridData _grid = FlGridData(
      show: true,
      drawVerticalLine: true,
      getDrawingHorizontalLine: (value) {
        return FlLine(
          color: Colors.grey[600],
          strokeWidth: 1,
        );
      },
      getDrawingVerticalLine: (value) {
        return FlLine(
          color: Colors.grey[600],
          strokeWidth: 1,
        );
      },
    );

    FlTitlesData _leftAndBottomTitles = FlTitlesData(
      show: true,
      bottomTitles: SideTitles(
        showTitles: true,
        reservedSize: 22,
        getTextStyles: (value) => const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
        getTitles: (value) {
          switch (value.toInt()) {
            case 2:
              return '10/07/21';
            case 4:
              return '17/07/21';
            case 6:
              return '24/07/21';
            case 8:
              return '31/07/21';
          }
          return '';
        },
        margin: 8,
      ),
      leftTitles: SideTitles(
        showTitles: true,
        getTextStyles: (value) => const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 15,
        ),
        getTitles: (value) {
          switch (value.toInt()) {
            case 50:
              return '50';
            case 60:
              return '60';
            case 70:
              return '70';
            case 80:
              return '80';
            case 90:
              return '90';
          }
          return '';
        },
        reservedSize: 28,
        margin: 12,
      ),
    );

    LineChartBarData _barArea = LineChartBarData(
      spots: [
        FlSpot(2, 73.7),
        FlSpot(4, 73.1),
        FlSpot(6, 72.6),
        FlSpot(8, 80),
      ],
      isCurved: true,
      colors: _gradientColors,
      barWidth: 3,
      dotData: FlDotData(show: true),
      belowBarData: BarAreaData(
        show: true,
        colors: _gradientColors.map((color) => color.withOpacity(0.3)).toList(),
      ),
    );

    LineTouchData _lineTouchData = LineTouchData(
      touchTooltipData: LineTouchTooltipData(tooltipBgColor: Colors.black),
    );

    LineChartData _mainData = LineChartData(
      gridData: _grid,
      titlesData: _leftAndBottomTitles,
      borderData: FlBorderData(show: true, border: Border.all(color: const Color(0xff37434d), width: 1)),
      lineBarsData: [_barArea],
      lineTouchData: _lineTouchData,
      minX: 0,
      maxX: 10,
      minY: 40,
      maxY: 100,
    );

    return Padding(
      padding: const EdgeInsets.all(8),
      child: Center(
        child: Stack(
          children: [
            AspectRatio(
              aspectRatio: 1.70,
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                  color: Colors.indigo,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(right: 18, left: 12, top: 24, bottom: 12),
                  child: LineChart(_mainData),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, top: 8),
              child: Text(
                'kg',
                style: TextStyle(fontSize: 12, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );

  }

}