import 'package:chart_barchart_app/model/developer_data.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class PieChart extends StatefulWidget {
  final List<DeveloperData> data;

  const PieChart({super.key, required this.data});

  @override
  State<PieChart> createState() => _PieChartState();
}

class _PieChartState extends State<PieChart> {

  late TooltipBehavior tooltipBehavior;

  @override
  void initState() {
    tooltipBehavior = TooltipBehavior();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Pie Chart'),
        centerTitle: true,
      ),
      body: Center(
        child: SizedBox(
          width: 380,
          height: 600,
          child: SfCircularChart(
            title: ChartTitle(
              text: 'Yearly Growth in the Flutter Community'
            ),
            tooltipBehavior: tooltipBehavior,     
            series: <CircularSeries<DeveloperData, int>>[
             PieSeries<DeveloperData, int>(
              name: 'Sites',
              dataSource: widget.data,
              selectionBehavior: SelectionBehavior(enable: true),
              xValueMapper: (DeveloperData developers, _) => developers.year,
              yValueMapper: (DeveloperData developers, _) => developers.developers,
              dataLabelSettings: DataLabelSettings(isVisible: true),
              enableTooltip: true,
             )
            ],
          ),
        ),
      ),
    );
  }
}