import 'package:charts_flutter/flutter.dart' as charts; 
import 'package:flutter/material.dart';
import 'package:projeto_final/model/mar.dart';
import 'package:projeto_final/service/previsao.dart';
import 'marChart.dart';

class Painel extends StatelessWidget {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    data = ModalRoute.of(context).settings.arguments;
    PrevisaoDeTempo prevTempo = new PrevisaoDeTempo();

    prevTempo.day = data['day'];
    prevTempo.tempo = data['tempo'];
    prevTempo.tempMax = data['tempmax'];
    prevTempo.tempMin = data['tempmin'];
    prevTempo.hora = data['hora'];
    prevTempo.altura = data['altura'];

    final List<Mar> graphMarData = [
      Mar(
      hora: prevTempo.hora[0] + 'h',
      altura: double.parse(prevTempo.altura[0]),
      barColor: charts.ColorUtil.fromDartColor(Colors.blue),
      ),
      Mar(
      hora: prevTempo.hora[1] + 'h',
      altura: double.parse(prevTempo.altura[1]),
      barColor: charts.ColorUtil.fromDartColor(Colors.blue),
      ),
      Mar(
      hora: prevTempo.hora[2] + 'h',
      altura: double.parse(prevTempo.altura[2]),
      barColor: charts.ColorUtil.fromDartColor(Colors.blue),
      ),
      Mar(
      hora: prevTempo.hora[3] + 'h',
      altura: double.parse(prevTempo.altura[3]),
      barColor: charts.ColorUtil.fromDartColor(Colors.blue),
      ),
      Mar(
      hora: prevTempo.hora[4] + 'h',
      altura: double.parse(prevTempo.altura[4]),
      barColor: charts.ColorUtil.fromDartColor(Colors.blue),
      ),
      Mar(
      hora: prevTempo.hora[5] + 'h',
      altura: double.parse(prevTempo.altura[5]),
      barColor: charts.ColorUtil.fromDartColor(Colors.blue),
      ),
      Mar(
      hora: prevTempo.hora[6] + 'h',
      altura: double.parse(prevTempo.altura[6]),
      barColor: charts.ColorUtil.fromDartColor(Colors.blue),
      ),
      Mar(
      hora: prevTempo.hora[7] + 'h',
      altura: double.parse(prevTempo.altura[7]),
      barColor: charts.ColorUtil.fromDartColor(Colors.blue),
      )];

    Widget cardTemp(dia,tempo,tempMax, tempMin){
      return Card(
        margin: EdgeInsets.fromLTRB(20, 20, 20, 15),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  'Dia:' + dia.substring(8,10) + '/' + dia.substring(5,7),
                  style: TextStyle(
                    fontSize: 25.0,
                    letterSpacing: 2.0,
                    color: Colors.black  
                  ),
                ),
                SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[
                  Image.asset('assets/$tempo.png',
                  alignment: Alignment.center,
                  scale: 7.0,
                  ),
                  Text(
                    ' temp:',
                    style: TextStyle(
                      fontSize: 12.0,
                      letterSpacing: 2.0,
                      color: Colors.black  
                      ),
                    ),
                    Column(
                      children: [
                        Text(
                        ' Max' + tempMax + '°',
                        style: TextStyle(
                          fontSize: 25.0,
                          letterSpacing: 2.0,
                          color: Colors.red
                        ),
                      ),
                        Text(
                        ' Min' + tempMin + '°',
                        style: TextStyle(
                        fontSize: 25.0,
                        letterSpacing: 2.0,
                        color: Colors.blue
                      ),
                    )
                  ]
                 )
                ]
              ),
                  SizedBox(height: 10.0),
                  Text(
                    tempo,
                    style: TextStyle(
                    fontSize: 25.0,
                    letterSpacing: 2.0,
                    color: Colors.black  
                    ),
                  ),
                  ]
                ),
        )
    );    
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Painel'),
        actions: <Widget>[
          FlatButton.icon(
            onPressed: (){
              Navigator.pushNamed(context, '/camera');
            }, 
              icon: Icon(Icons.camera_alt), 
              label: Text('Câmera')
            )
        ],
        ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10,10.0,10.0,0),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: 6,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index){
                  return cardTemp(prevTempo.day[index], prevTempo.tempo[index], prevTempo.tempMax[index], prevTempo.tempMin[index]); 
                }
              )
              ),
              SizedBox(height: 10.0),
              Text(
                'Previsão de Mar (m)',
                style: TextStyle(
                  fontSize: 20.0,
                  letterSpacing: 2.0,
                  color: Colors.black  
                  ),
                ),
                Text(
                '<Hoje>',
                style: TextStyle(
                  fontSize: 15.0,
                  letterSpacing: 2.0,
                  color: Colors.black  
                  ),
                ),
              Expanded(
                child: MarChart(data: graphMarData),
              ),
            ]
          )
      ),
    );
  }
}