import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/material.dart';

const _tituloAppBar = 'Criando Tranfêrencia';
const _rotuloCampoValor = 'Número da conta';
const _rotuloDicaValor = '0.00';
const _rotuloCampoConta = 'Número da conta';
const _rotuloDicaConta = '0000';
const _textoBotaoConfirmar = 'Confirmar';

class FormularioTransferencia extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormularioTransferenciaState();
  }
}

class FormularioTransferenciaState extends State<FormularioTransferencia> {
  final TextEditingController _controladorCampoNumeroConta =
      TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_tituloAppBar),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Editor(
                  controlador: _controladorCampoNumeroConta,
                  rotulo: _rotuloCampoConta,
                  dica: _rotuloDicaConta),
              Editor(
                  controlador: _controladorCampoValor,
                  rotulo: _rotuloCampoValor,
                  dica: _rotuloDicaValor,
                  icone: Icons.monetization_on),
              RaisedButton(
                onPressed: () {
                  _criarTransferencia(context);
                },
                child: Text(_textoBotaoConfirmar),
              ),
            ],
          ),
        ));
  }

  void _criarTransferencia(BuildContext context) {
    final String numeroConta = _controladorCampoNumeroConta.text;
    final double valor = double.tryParse(_controladorCampoValor.text);
    if (numeroConta != null && valor != null) {
      final transferenciaCriada = Transferencia(valor, numeroConta);
      Navigator.pop(context, transferenciaCriada);
    }
  }
}
