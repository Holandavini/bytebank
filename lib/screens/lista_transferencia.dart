import 'package:bytebank/models/transferencia.dart';
import 'package:bytebank/screens/formulario_transferencia.dart';
import 'package:flutter/material.dart';

const _tituloAppBar = 'Transferências';

class ListaTransferencias extends StatefulWidget {
  final List<Transferencia> _transferencias = List();

  @override
  State<StatefulWidget> createState() {
    return ListaTransferenciasState();
  }
}

class ListaTransferenciasState extends State<ListaTransferencias> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppBar),
      ),
      body: ListView.builder(
        itemCount: widget._transferencias.length,
        itemBuilder: (context, indice) {
          final transferencia = widget._transferencias[indice];
          return ItemTransferencia(transferencia);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FormularioTransferencia();
          })).then(
              (transferenciaRecebida) => _atualizar(transferenciaRecebida));
        },
      ),
    );
  }

  void _atualizar(Transferencia transferenciaRecebida) {
    if (transferenciaRecebida != null) {
      setState(() {
        widget._transferencias.add(transferenciaRecebida);
      });
    }
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  ItemTransferencia(this._transferencia);
  @override
  Widget build(BuildContext context) {
    var listTile = ListTile(
      leading: Icon(Icons.monetization_on),
      title: Text('Valor: ' + _transferencia.valor.toString()),
      subtitle: Text('Conta: ' + _transferencia.numeroConta.toString()),
    );
    return Card(
      child: listTile,
    );
  }
}
