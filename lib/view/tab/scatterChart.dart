import 'package:chart_barchart_app/model/developer_data.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ScatterChart extends StatefulWidget {
  final List<DeveloperData> data;
  ScatterChart({super.key, required this.data});

  @override
  State<ScatterChart> createState() => _ScatterChartState();
}

class _ScatterChartState extends State<ScatterChart> {
  // Property

  late TooltipBehavior tooltipBehavior;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tooltipBehavior = TooltipBehavior(enable: true);

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Line Chart'),
      ),
      body: Center(
        child: SizedBox(
          width: 380,
          height: 600,
          child: Text('aaa')
        ),
      ),
    );
  }
}