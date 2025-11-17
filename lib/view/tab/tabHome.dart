import 'package:chart_barchart_app/model/developer_data.dart';
import 'package:chart_barchart_app/view/tab/barChart.dart';
import 'package:chart_barchart_app/view/tab/lineChart.dart';
import 'package:chart_barchart_app/view/tab/pieChart.dart';
import 'package:chart_barchart_app/view/tab/scatterChart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class TabHome extends StatefulWidget {
  const TabHome({super.key});

  @override
  State<TabHome> createState() => _TabHomeState();
}

class _TabHomeState extends State<TabHome> with SingleTickerProviderStateMixin {
  // Property
  late List<DeveloperData> data;
  late TooltipBehavior tooltipBehavior;
  late TabController controller;

  @override
  void dispose() {
    // controller.removeListener(_handleTabSelection);
    controller.dispose();
  
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 4, vsync: this);
    data = [];
    tooltipBehavior = TooltipBehavior(enable: true);
    // controller.addListener(_handleTabSelection);
    addData();
  }



  addData() {
    data.add(
      DeveloperData(
        year: 2017,
        developers: 19000,
      ),
    );
    data.add(
      DeveloperData(
        year: 2018,
        developers: 40000,
      ),
    );
    data.add(
      DeveloperData(
        year: 2019,
        developers: 35000,
      ),
    );
    data.add(
      DeveloperData(
        year: 2020,
        developers: 37000,
      ),
    );
    data.add(
      DeveloperData(
        year: 2021,
        developers: 45000,
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TabHome Chart'),
   
        bottom: TabBar(
          dividerColor: Colors.grey,
          indicatorColor: Colors.red[300],
          padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
          labelColor: Colors.red,
          controller: controller,
        
          tabs: [
            Tab(icon: Icon(Icons.bar_chart), text: 'Bar Chart'),
            Tab(icon: Icon(Icons.line_axis), text: 'Line Chart'),
            Tab(icon: Icon(Icons.scatter_plot), text: 'Scatter Chart'),
            Tab(icon: Icon(Icons.pie_chart), text: 'Pie chart'),
          ],
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: [
          BarChart(data: data),
          LineChart(data: data),
          ScatterChart(data: data),
          PieChart(data: data)
          // Scatter()
        ],
      ),
    );
  }
}
