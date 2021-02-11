import 'package:flutter/material.dart';
import 'lista_transferencia.dart';

const _bemVindoHome = 'Olá, Vinicius!';
const _rotuloTranferencia = 'Transferir';
const _rotuloSaque = 'Sacar';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(300.0), // here the desired height
          child: AppBar(
            title: Text(_bemVindoHome, style: TextStyle(fontSize: 48)),
          ),
        ),
        body: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          children: <Widget>[
            ElevatedButton(
                child:
                    Text(_rotuloTranferencia, style: TextStyle(fontSize: 30)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ListaTransferencias(),
                    ),
                  );
                }),
            ElevatedButton(
                child: Text(_rotuloSaque, style: TextStyle(fontSize: 30)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ListaTransferencias(),
                    ),
                  );
                }),
          ],
        ));
  }
}
