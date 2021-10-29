import 'package:flutter/material.dart';
import 'package:projeto_final/screen/camera.dart';
import 'screen/painel.dart';
import 'screen/home.dart';
import 'screen/loading.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  initialRoute: '/',
  routes: {
    '/': (context) => Home(),
    '/loading': (context) => Loading(),
    '/painel': (context) => Painel(),
    '/camera': (context) => Camera(),
  },
));

