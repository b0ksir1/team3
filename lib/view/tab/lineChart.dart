import 'package:chart_barchart_app/model/developer_data.dart';
import 'package:flutter/material.dart';

class LineChart extends StatefulWidget {

  final List<DeveloperData> data;
  LineChart({super.key, required this.data});


  @override
  State<LineChart> createState() => _LineChartState();
}

class _LineChartState extends State<LineChart> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}