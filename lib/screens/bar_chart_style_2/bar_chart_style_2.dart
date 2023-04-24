import 'package:flutter/material.dart';
import 'package:vts_component/components/chart/axis/axis_chart_widgets.dart';
import 'package:vts_component/components/chart/axis/axit_chart_data.dart';
import 'package:vts_component/components/chart/bar_chart/vts_bar_chart.dart';
import 'package:vts_component/components/chart/bar_chart/vts_bar_chart_data.dart';
import 'package:vts_component/components/chart/base_chart/base_chart_data.dart';

import '../../components/demo_appbar.dart';
import '../../components/demo_box.dart';

class BarChartStyle2 extends StatefulWidget{
  const BarChartStyle2({super.key});

  @override
  State<StatefulWidget> createState() => _BarChartStyle2State();

}

class _BarChartStyle2State extends State<BarChartStyle2>{

  VTSLine customizeGridLine(double value) => VTSLine(
    color: Colors.blueGrey,
    strokeWidth: 0.4,
    dashArray: [8,0],
  );

  List<String> categories = ["Cate1","Cate2","Cate3","Cate4","Cate5"];

  Widget customGetTitle(double value, TitleMeta meta) => SideTitleWidget(
    axisSide: meta.axisSide,
    child: Text(
        categories[(value).toInt()]
      // value.toString()
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: DemoAppbar(title: 'Chart'),
        body: DemoBox(
            title: 'Bar Chart Style 2',
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 300,
                  // padding: const EdgeInsets.only(top:  10, right: 10),
                  child: Container(
                    height: 300,
                    margin: const EdgeInsets.only(top: 40),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    width: 400,
                    child: VTSBarChart(
                      swapAnimationDuration: Duration.zero,
                      VTSBarChartData(
                        maxY: 35,
                        barTouchData: BarTouchData(
                          enabled: true,
                          touchTooltipData: BarTouchTooltipData(
                            direction: TooltipDirection.top,
                            tooltipBgColor: Colors.black.withOpacity(0.7),
                            tooltipPadding: const EdgeInsets.all(20),
                            fitInsideHorizontally: true,
                            fitInsideVertically: true,
                            // getTooltipItem: (
                            //     BarChartGroupData group,
                            //     int groupIndex,
                            //     BarChartRodData rod,
                            //     int rodIndex,
                            //     ) {
                            //   int value = rod.toY.round();
                            //   return BarTooltipItem( value.toString(), const TextStyle(
                            //       color: Colors.black,
                            //       fontWeight: FontWeight.normal,
                            //       fontSize: 8)
                            //   );
                            // },
                          ),
                        ),
                        gridData: VTSGridData(
                            show: true,
                            drawVerticalLine: false,
                            drawHorizontalLine: true,
                            getDrawingHorizontalLine: customizeGridLine
                        ),
                        titlesData: VTSTitlesData(
                          show: true,
                          leftTitles: AxisTitles(
                              sideTitles: SideTitles(
                                  showTitles: true,
                                  reservedSize: 30)),
                          topTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: false,
                              )),
                          bottomTitles: AxisTitles(
                            sideTitles: SideTitles(
                                showTitles: true,
                                getTitlesWidget: customGetTitle,
                                reservedSize: 35
                            ),
                          ),
                          rightTitles: AxisTitles(
                              sideTitles:
                              SideTitles(showTitles: false)),
                        ),
                        borderData: VTSBorderData(
                          show: true,
                          border: const Border(
                            bottom: BorderSide(
                              color: Colors.grey,
                              width: 1,
                            ),
                          ),
                        ),
                        barGroups: [makeGroupData(0, 15,Colors.red,20,Colors.blue),makeGroupData(1, 20,Colors.red,23,Colors.blue),makeGroupData(2, 10,Colors.red,14,Colors.blue)],
                      ),
                    ),

                  ),//
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.square,color: Colors.red,),
                        Text("Cate1")
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.square,color: Colors.blue,),
                        Text("Cate2")
                      ],
                    ),
                  ],
                ),
              ],
            )
        )
    );
  }

  BarChartGroupData makeGroupData(
      int x, double y1,Color color1,double y2 , Color color2) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y1,
          color: color1,
          width: 22,
          borderRadius: BorderRadius.circular(0),
        ),
        BarChartRodData(
          toY: y2,
          width: 22,
          color: color2,
          borderRadius: BorderRadius.circular(0),
        ),
      ],
    );
  }

}