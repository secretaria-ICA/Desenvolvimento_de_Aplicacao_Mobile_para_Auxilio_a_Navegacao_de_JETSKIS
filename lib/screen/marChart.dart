import 'package:flutter/material.dart';
import 'package:projeto_final/model/mar.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class MarChart extends StatelessWidget {
 
 final List<Mar> data;

 MarChart({@required this.data});

  @override
  Widget build(BuildContext context) {
    List<charts.Series<Mar, String>> series = [
      charts.Series(
        id: "Previsão de Mar",
        data: data,
        domainFn: (Mar series, _) => series.hora,
        measureFn: (Mar series, _) => series.altura,
        colorFn: (Mar series, _) => series.barColor,
      )];

    return charts.BarChart(series, animate: true);
  }
}