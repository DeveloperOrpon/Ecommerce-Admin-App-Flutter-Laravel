import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'monthEarnLine.dart';

class SalesRate extends StatefulWidget {
  const SalesRate({super.key});

  @override
  State<SalesRate> createState() => _SalesRateState();
}

class _SalesRateState extends State<SalesRate> {
  TooltipBehavior? _tooltipBehavior;
  @override
  void initState() {
    _tooltipBehavior = TooltipBehavior(
        enable: true, format: 'point.y', header: '', canShowMarker: false);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    String text;
    return SizedBox(
      height: 300,
      child: SfCartesianChart(
        onTooltipRender: (TooltipArgs args) {
          final NumberFormat format = NumberFormat.decimalPattern();
          text = format.format(args.dataPoints![args.pointIndex!.toInt()].y);
          args.text = text;
        },
        plotAreaBorderWidth: 0,
        title:
        ChartTitle(text:''),
        primaryXAxis: CategoryAxis(
          labelIntersectAction: AxisLabelIntersectAction.hide,
          labelRotation:  0 ,
        ),
        primaryYAxis: const LogarithmicAxis(
            minorTicksPerInterval: 3,
            majorGridLines: MajorGridLines(width: 1.5),
            minorTickLines: MinorTickLines(size: 10),
            labelFormat: r'{value}',
            labelStyle: TextStyle(
              fontSize: 10,
            ),
            interval: 1),
        series: _getInversedLogarithmicSeries(),
        tooltipBehavior: _tooltipBehavior,
      ),
    );
  }
  List<CartesianSeries<ChartSampleData, String>>
  _getInversedLogarithmicSeries() {
    return <CartesianSeries<ChartSampleData, String>>[
      LineSeries<ChartSampleData, String>(
        color: Theme.of(context).primaryColor.withOpacity(.5),
          width: .9,
          dataSource: <ChartSampleData>[
            ChartSampleData(x: 'Jan', y: 1000),
            ChartSampleData(x: 'Feb', y: 400),
            ChartSampleData(x: 'Mar', y: 300),
            ChartSampleData(x: 'April', y: 500),
            ChartSampleData(x: 'May', y: 2000),
            ChartSampleData(x: 'Jun', y: 100),
            ChartSampleData(x: 'Jul', y: 4000),
            ChartSampleData(x: 'Aug', y: 2000),
            ChartSampleData(x: 'Sep', y: 6000),
            ChartSampleData(x: 'Oct', y: 1000),
            ChartSampleData(x: 'Now', y: 300),
            ChartSampleData(x: 'Dec', y: 5000),
          ],
          xValueMapper: (ChartSampleData sales, _) => sales.x as String,
          yValueMapper: (ChartSampleData sales, _) => sales.y,
          markerSettings:  MarkerSettings(
            color: Theme.of(context).primaryColor,
              isVisible: true,
              width: 5,
              height: 5,
              shape: DataMarkerType.circle))
    ];
  }
}
