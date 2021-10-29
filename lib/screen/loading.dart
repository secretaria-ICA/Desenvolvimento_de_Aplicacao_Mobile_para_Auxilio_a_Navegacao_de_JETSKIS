import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:projeto_final/service/previsao.dart';


class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setupPrevisao() async {
    PrevisaoDeTempo instance =  PrevisaoDeTempo(location: '3424');
    await instance.tempo2Json();
    await instance.mar2Json();
    Navigator.pushReplacementNamed(context, "/painel", arguments:{
      
      'location': instance.location,
      'day': instance.day,
      'tempo': instance.tempo,
      'tempmax': instance.tempMax,
      'tempmin': instance.tempMin,
      'hora': instance.hora,
      'altura': instance.altura,  
    });
  }

  @override
  void initState() {
    super.initState();
    setupPrevisao();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitThreeBounce(
            color: Colors.white,
            size: 50.0,
          )
        )
    );
  }
}