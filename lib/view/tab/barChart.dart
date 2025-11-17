import 'package:chart_barchart_app/model/developer_data.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class BarChart extends StatefulWidget {
  final List<DeveloperData> data;
  BarChart({super.key,required this.data});

  @override
  State<BarChart> createState() => _BarChartState();
}

class _BarChartState extends State<BarChart> {
    //property
    late TooltipBehavior tooltipBehavior;

    @override
  void initState() {
    super.initState();
    tooltipBehavior = TooltipBehavior(enable: true);
  } //첫번째 이후 활용 안함



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bar Chart'),
        centerTitle: true,
      ),
      body: Center(
        child: SizedBox(
          width: 380,
          height: 600,
          child: SfCartesianChart(
            title: ChartTitle(
              text: 'Yearly Growth in th Flutter Community\n\n  '
            ),
            tooltipBehavior: tooltipBehavior,
            legend: Legend(isVisible: true),
            series: [
              // ColumnSeries : 세로축 막대 그래프
              // BarSeries : 가로축 막대 그래프
              BarSeries<DeveloperData, int>(
                name: 'Site 수',
                dataSource: widget.data,
                xValueMapper: (DeveloperData developers, _) => developers.year, 
                yValueMapper: (DeveloperData developers, _) => developers.developers,
                dataLabelSettings: DataLabelSettings(isVisible: true),
                enableTooltip: true,
                ),
            ],//막대그래프
            // x축을 Category로 표현
            primaryXAxis: CategoryAxis(
              title: AxisTitle(text: '년도'),
            ),
            // y축은 숫자로 표현
            primaryYAxis: NumericAxis(
              title: AxisTitle(text: '사이트 수'),
            ),
          ),
        ),
      ),
    );
  }
}