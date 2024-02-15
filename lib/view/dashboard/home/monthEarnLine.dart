import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class MonthlyEarnLineChart extends StatefulWidget {
  const MonthlyEarnLineChart({super.key});

  @override
  State<MonthlyEarnLineChart> createState() => _MonthlyEarnLineChartState();
}

class _MonthlyEarnLineChartState extends State<MonthlyEarnLineChart> {
  late double _columnWidth;
  late double _columnSpacing;
  List<ChartSampleData>? chartData;
  TooltipBehavior? _tooltipBehavior;

  @override
  void initState() {
    _columnWidth = 0.8;
    _columnSpacing = 0.2;
    _tooltipBehavior = TooltipBehavior(enable: true,header: 'Earning');
    chartData = <ChartSampleData>[
      ChartSampleData(
          x: 'Norway', y: 16, secondSeriesYValue: 8, thirdSeriesYValue: 13),
      ChartSampleData(
          x: 'USA', y: 8, secondSeriesYValue: 10, thirdSeriesYValue: 7),
      ChartSampleData(
          x: 'Germany', y: 12, secondSeriesYValue: 10, thirdSeriesYValue: 5),
      ChartSampleData(
          x: 'Canada', y: 4, secondSeriesYValue: 8, thirdSeriesYValue: 14),
      ChartSampleData(
          x: 'Netherlands', y: 8, secondSeriesYValue: 5, thirdSeriesYValue: 4),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(

      plotAreaBorderWidth: 0,
      title: ChartTitle(
          text: '',
          textStyle: TextStyle(
            fontSize: 16,
            // fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
          )),
      primaryXAxis: const CategoryAxis(
        majorGridLines: MajorGridLines(width: 0),
      ),
      primaryYAxis: const NumericAxis(
          axisLine: AxisLine(width: 0),
          labelFormat: '{value}K',
          majorTickLines: MajorTickLines(size: 0)),
      series: _getDefaultColumnSeries(),
      tooltipBehavior: _tooltipBehavior,
    );
  }

  /// Get default column series
  List<ColumnSeries<ChartSampleData, String>> _getDefaultColumnSeries() {
    return <ColumnSeries<ChartSampleData, String>>[
      ColumnSeries<ChartSampleData, String>(
        color: Theme.of(context).primaryColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(5),
          topRight: Radius.circular(5),
        ),
        width: .85,

        dataSource: <ChartSampleData>[
          ChartSampleData(x: 'Jan', y: 1),
          ChartSampleData(x: 'Feb', y: 2),
          ChartSampleData(x: 'Mar', y: 1),
          ChartSampleData(x: 'April', y: 5),
          ChartSampleData(x: 'May', y: 2),
          ChartSampleData(x: 'Jun', y: 1),
          ChartSampleData(x: 'Jul', y: 4),
          ChartSampleData(x: 'Aug', y: 2),
          ChartSampleData(x: 'Sep', y: 6),
          ChartSampleData(x: 'Oct', y: 1),
          ChartSampleData(x: 'Now', y: 3),
          ChartSampleData(x: 'Dec', y: 5),
        ],
        xValueMapper: (ChartSampleData sales, _) => sales.x as String,
        yValueMapper: (ChartSampleData sales, _) => sales.y,
        dataLabelSettings: const DataLabelSettings(
            isVisible: true, textStyle: TextStyle(fontSize: 10)),
      )
    ];
  }
}

class ChartSampleData {
  /// Holds the datapoint values like x, y, etc.,
  ChartSampleData(
      {this.x,
      this.y,
      this.xValue,
      this.yValue,
      this.secondSeriesYValue,
      this.thirdSeriesYValue,
      this.pointColor,
      this.size,
      this.text,
      this.open,
      this.close,
      this.low,
      this.high,
      this.volume});

  /// Holds x value of the datapoint
  final dynamic x;

  /// Holds y value of the datapoint
  final num? y;

  /// Holds x value of the datapoint
  final dynamic xValue;

  /// Holds y value of the datapoint
  final num? yValue;

  /// Holds y value of the datapoint(for 2nd series)
  final num? secondSeriesYValue;

  /// Holds y value of the datapoint(for 3nd series)
  final num? thirdSeriesYValue;

  /// Holds point color of the datapoint
  final Color? pointColor;

  /// Holds size of the datapoint
  final num? size;

  /// Holds datalabel/text value mapper of the datapoint
  final String? text;

  /// Holds open value of the datapoint
  final num? open;

  /// Holds close value of the datapoint
  final num? close;

  /// Holds low value of the datapoint
  final num? low;

  /// Holds high value of the datapoint
  final num? high;

  /// Holds open value of the datapoint
  final num? volume;
}
