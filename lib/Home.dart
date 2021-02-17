import 'package:flutter/material.dart';
import 'package:http/http.dart' as url;


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String valor ='0';
  _bitcoin() async{
    String bi= 'https://blockchain.info/tobtc?currency=BRL&value=500';
    url.Response response;
    response = await url.get(bi);
    setState(() {
      valor = response.body;
    });
    

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
      color: Colors.white10,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('imagens/bitcoin.png'),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
              Padding(padding: EdgeInsets.all(25)),
              Text('R\$ ' +valor,
              style: TextStyle(
                fontSize: 58,
                color: Colors.black
                
              ),
              )
              
            ]
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
             RaisedButton(onPressed: _bitcoin,
              color: Colors.orange,
              child: Text('Atualizar',
              style: TextStyle(
                fontSize:19,
              ),),)
            ]
          )

        
        ],

      ),
      
    ),

    );
  }
}