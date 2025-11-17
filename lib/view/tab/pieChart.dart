import 'package:chart_barchart_app/model/developer_data.dart';
import 'package:flutter/material.dart';

class PieChart extends StatefulWidget {
  // const PieChart({super.key});
  final List<DeveloperData> data;
  PieChart({super.key, required this.data});

  @override
  State<PieChart> createState() => _PieChartState();
}

class _PieChartState extends State<PieChart> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}