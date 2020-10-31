import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_vicoin/resources/colors.dart';
import 'package:flutter_vicoin/resources/dimens.dart';
import 'package:flutter_vicoin/resources/spaces.dart';

class TransactionBottomSheet extends StatelessWidget {
  List<Color> gradientColors = [
    AppColors.app_main_blue,
    AppColors.app_main_blue,
  ];

  @override
  Widget build(BuildContext context) =>
      Container(
        height:350,
        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
        color: AppColors.app_white,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(child: Text("BTC/USDT分时图")),
                Container(
                  height: 26,
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.line_gray),
                    borderRadius: BorderRadius.circular(Dimens.dp4),
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Row(
                      children: [
                        Text(
                          "收起",
                          style: TextStyle(
                              color: AppColors.app_gray,
                              fontSize: Dimens.font_sp12),
                        ),
                        Spaces.hSpace5,
                        Icon(
                          AntDesign.caretdown,
                          size: 8,
                          color: AppColors.app_gray,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Spaces.vSpace10,
            const Divider(
              height: 1,
              color: AppColors.line_gray,
            ),
            Spaces.vSpace16,
            Container(
              width: double.infinity,
              child: LineChart(mainData()),
            ),
          ],
        ),
      );

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: AppColors.line_gray,
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: AppColors.line_gray,
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          getTextStyles: (value) =>
          const TextStyle(
              color: AppColors.app_light_gray, fontSize: Dimens.dp12),
          getTitles: (value) {
            switch (value.toInt()) {
              case 0:
                return '5:00';
              case 1:
                return '6:00';
              case 2:
                return '7:00';
              case 3:
                return '8:00';
              case 4:
                return '9:00';
              case 5:
                return '10:00';
            }
            return '';
          },
          margin: 8,
        ),
        leftTitles: SideTitles(
          showTitles: false,
        ),
        rightTitles: SideTitles(
          showTitles: true,
          getTextStyles: (value) =>
          const TextStyle(
            color: AppColors.app_light_gray,
            fontSize: Dimens.dp12,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 0:
                return '11100';
              case 1:
                return '11200';
              case 2:
                return '11300';
              case 3:
                return '11400';
              case 4:
                return '11500';
              case 5:
                return '11600';
            }
            return '';
          },
          reservedSize: 22,
          margin: 12,
        ),
      ),
      borderData: FlBorderData(
          show: true, border: Border.all(color: AppColors.line_gray, width: 1)),
      minX: 0,
      maxX: 5,
      minY: 0,
      maxY: 5,
      lineBarsData: [
        LineChartBarData(
          spots: [
            FlSpot(0, 1),
            FlSpot(1, 3),
            FlSpot(2, 2),
            FlSpot(3, 3),
            FlSpot(4, 4),
            FlSpot(5, 3),
          ],
          isCurved: true,
          colors: gradientColors,
          barWidth: 1,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            colors:
            gradientColors.map((color) => color.withOpacity(0.1)).toList(),
          ),
        ),
      ],
    );
  }
}
