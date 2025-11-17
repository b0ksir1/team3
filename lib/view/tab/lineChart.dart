import 'package:chart_barchart_app/model/developer_data.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class LineChart extends StatefulWidget {

  final List<DeveloperData> data;
  LineChart({super.key, required this.data});


  @override
  State<LineChart> createState() => _LineChartState();
}

class _LineChartState extends State<LineChart> {


  late TooltipBehavior tooltipBehavior;

  @override
  void initState() {
    super.initState();
    
    tooltipBehavior = TooltipBehavior(enable: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Bar Chart'),
      // ),
      body: Center(
        child: SizedBox(
          width: 380,
          height: 600,
          child: SfCartesianChart(
            title: ChartTitle(
              text: 'Yearly Growth in the Flutter Community'
            ),
            tooltipBehavior: tooltipBehavior,
            legend: Legend(isVisible: true),
            series: [
              // ColumnSeries : 세로축 막대그래프
              // BarSeries : 가로축 막대그래프
              LineSeries<DeveloperData, int>(
                name: '사이트 수',
                dataSource: widget.data,
                xValueMapper: (DeveloperData developers, _) => developers.year, 
                yValueMapper: (DeveloperData developers, _) => developers.developers,
                dataLabelSettings: DataLabelSettings(isVisible: true),
                enableTooltip: true,
              ),
            ],
            // X축을 Category로 표현
            primaryXAxis: CategoryAxis(
              title: AxisTitle(text: '년도'),
            ),
            // Y축은 수치를 표현
            primaryYAxis: NumericAxis(
              title: AxisTitle(text: '사이트 수'),
            ),
          ),
        ),
      ),
    );
  } // build

  // ---fuctions---



  }
