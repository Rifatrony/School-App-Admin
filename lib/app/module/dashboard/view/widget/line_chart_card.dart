
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:srmm/app/data/line_data.dart';
import 'package:srmm/app/module/dashboard/view/widget/custom_card.dart';
import 'package:srmm/app/utils/app_color.dart';

class LineChartCard extends StatelessWidget {
  const LineChartCard({super.key});

  @override
  Widget build(BuildContext context) {

    final data = LineData();
    return CustomCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Line Graph"),
          SizedBox(height: 20,),
          AspectRatio(aspectRatio: 16/6,
            child: LineChart(
              LineChartData(
                lineTouchData: LineTouchData(
                  handleBuiltInTouches: true,
                ),
                gridData: FlGridData(
                  show: false,
                ),
                titlesData: FlTitlesData(
                  rightTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  topTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (double value, TitleMeta meta){
                        return data.bottomTitle[value.toInt()]!= null
                            ? SideTitleWidget(
                                child: Text(data.bottomTitle[value.toInt()].toString(),
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey.shade400
                                  ),
                                ),
                                axisSide: meta.axisSide,
                              ) : SizedBox();
                      }
                    )
                  ),

                  leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                          showTitles: true,
                          interval: 1,
                          reservedSize: 40,
                          getTitlesWidget: (double value, TitleMeta meta){
                            return data.leftTitle[value.toInt()]!= null
                                ? SideTitleWidget(
                              child: Text(data.leftTitle[value.toInt()].toString(),
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey.shade400
                                ),
                              ),
                              axisSide: meta.axisSide,
                            ) : SizedBox();
                          },
                      ),
                  ),

                ),
                borderData: FlBorderData(
                  show: false,
                ),
                lineBarsData: [
                  LineChartBarData(
                    color: AppColor.selectionColor,
                    barWidth: 2.5,
                    belowBarData: BarAreaData(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          AppColor.selectionColor.withOpacity(0.5),
                          Colors.transparent,
                        ],
                      ),
                      show: true,
                    ),
                    dotData: FlDotData(show: false),
                    spots: data.spots,
                  ),
                ],
                minX: 0,
                maxX: 120,
                maxY: 105,
                minY: -5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
