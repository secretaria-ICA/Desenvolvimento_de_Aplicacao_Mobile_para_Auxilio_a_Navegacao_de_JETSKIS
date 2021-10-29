import 'package:flutter/material.dart';

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home')
        ),
      body: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Center(
          child: Column(
            children: <Widget>[
              Image.asset('assets/jet.png',
              alignment: Alignment.center,
              scale: 0.5,
              ),
              SizedBox(height: 10.0),
              Text('Bem vindo ao Painel de navegação de jetski'),
              SizedBox(height: 30.0),
              FlatButton(
                onPressed: (){
                  Navigator.pushReplacementNamed(context, "/loading");
                  },
                child: Text("Entrar"),
                color: Colors.blue[200],
              )
         
            ]
          )
        )
      ),
    );
  }
}