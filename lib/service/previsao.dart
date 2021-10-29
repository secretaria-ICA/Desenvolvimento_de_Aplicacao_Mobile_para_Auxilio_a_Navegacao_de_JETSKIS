import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:xml2json/xml2json.dart';
import 'package:http/http.dart';

class PrevisaoDeTempo{

  String location;
  List<String> day = new List(6);
  List<String> tempo = new List(6);
  List<String> tempMax = new List(6);
  List<String> tempMin = new List(6);
  List<String> hora = new List(8);
  List<String> altura = new List(8);

  PrevisaoDeTempo({this.location});

  Future<void> tempo2Json() async {

    try{
      final myTranform = Xml2Json();
      Response response = await get(Uri.parse('http://servicos.cptec.inpe.br/XML/cidade/7dias/3464/previsao.xml'));
      myTranform.parse(response.body);
      var json = myTranform.toGData();
      Map data = jsonDecode(json);

      for (int i=0; i<=5; i++){
        day[i] = data['cidade']['previsao'][i]['dia']['\$t'];
        tempo[i] = _sigla2Name(data['cidade']['previsao'][i]['tempo']['\$t']);
        tempMax[i] = data['cidade']['previsao'][i]['maxima']['\$t'];
        tempMin[i] = data['cidade']['previsao'][i]['minima']['\$t'];
      }

    }catch(e){
      print(e);
    }
  }

  Future<void> mar2Json() async {

    try{

      final mytranform = Xml2Json();
      Response response = await get(Uri.parse('http://servicos.cptec.inpe.br/XML/cidade/3464/todos/tempos/ondas.xml'));
      mytranform.parse(response.body);
      var json = mytranform.toGData();
      Map data = jsonDecode(json);

      for (int i=0; i<8; i++){
        hora[i] = data['cidade']['previsao'][i]['dia']['\$t'].substring(11,13);
        altura[i] = data['cidade']['previsao'][i]['altura']['\$t'];
      }      

    }catch(e){
      print(e);
    }
  } 
  
  
  String _sigla2Name(String sigla) {

  String result = 'sol';

  if (sigla == 'ec'){
    result = 'nublado';
  }

  if (sigla == 'ci'){
    result = 'chuvoso';
  }

  if (sigla == 'c'){
    result = 'chuvoso';
  }

  if (sigla == 'in'){
    result = 'nublado';
  }

  if (sigla == 'pp'){
    result = 'chuvoso';
  }

  if (sigla == 'cm'){
    result = 'chuvoso';
  }

  if (sigla == 'cn'){
    result = 'chuvoso';
  }

  if (sigla == 'pt'){
    result = 'chuvoso';
  }

  if (sigla == 'pm'){
    result = 'chuvoso';
  }

  if (sigla == 'np'){
    result = 'chuvoso';
  }

  if (sigla == 'pc'){
    result = 'chuvoso';
  }

  if (sigla == 'pn'){
    result = 'solenuvem';
  }

  if (sigla == 'cv'){
    result = 'chuvoso';
  }

  if (sigla == 'ch'){
    result = 'chuvoso';
  }

  if (sigla == 't'){
    result = 'temporal';
  }

  if (sigla == 'ps'){
    result = 'sol';
  }

  if (sigla == 'e'){
    result = 'nublado';
  }

  if (sigla == 'n'){
    result = 'nublado';
  }

  if (sigla == 'cl'){
    result = 'sol';
  }

  if (sigla == 'nv'){
    result = 'nublado';
  }

  if (sigla == 'g'){
    result = 'snow';
  }

  if (sigla == 'ne'){
    result = 'snow';
  }

  if (sigla == 'nd'){
    result = 'nublado';
  }

  if (sigla == 'pnt'){
    result = 'temporal';
  }

  if (sigla == 'psc'){
    result = 'chuvoso';
  }

  if (sigla == 'pcm'){
    result = 'chuvoso';
  }

   if (sigla == 'pct'){
    result = 'chuvoso';
  }

   if (sigla == 'pcn'){
    result = 'chuvoso';
  }

   if (sigla == 'npt'){
    result = 'chuvoso';
  }

   if (sigla == 'npn'){
    result = 'chuvoso';
  }

  if (sigla == 'ncn'){
    result = 'nublado';
  }

  if (sigla == 'nct'){
    result = 'nublado';
  }

  if (sigla == 'ncm'){
    result = 'nublado';
  }

  if (sigla == 'npm'){
    result = 'nublado';
  }

  if (sigla == 'npp'){
    result = 'nublado';
  }

  if (sigla == 'vn'){
    result = 'nublado';
  }

  if (sigla == 'ct'){
    result = 'chuvoso';
  }

  if (sigla == 'ppn'){
    result = 'chuvoso';
  }

  if (sigla == 'ppt'){
    result = 'chuvoso';
  }

   if (sigla == 'ppm'){
    result = 'chuvoso';
  }

  return result;

}




}






