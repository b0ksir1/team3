import 'package:chart_barchart_app/model/developer_data.dart';
import 'package:flutter/material.dart';

class BarChart extends StatefulWidget {
  final List<DeveloperData> data;
  BarChart({super.key, required this.data});

  @override
  State<BarChart> createState() => _BarChartState();
}

class _BarChartState extends State<BarChart> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}