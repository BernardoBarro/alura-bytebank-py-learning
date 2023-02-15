import 'package:flutter/material.dart';

import '../../components/editor.dart';
import '../../models/transferencia.dart';

const _tituloAppBar = "Criando transferencia";
const _rotuloValor = "Valor";
const _rotuloNumeroConta = "Número da conta";
const _dicaValor = "0.00";
const _dicaNumeroConta = "0000";
const _botaoTexto = "Confirmar";

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
            children: [
              Editor(
                controlador: _controladorCampoNumeroConta,
                rotulo: _rotuloNumeroConta,
                dica: _dicaNumeroConta,
              ),
              Editor(
                controlador: _controladorCampoValor,
                rotulo: _rotuloValor,
                dica: _dicaValor,
                icone: Icons.monetization_on,
              ),
              ElevatedButton(
                  onPressed: () => _criaTransferencia(context),
                  child: Text(_botaoTexto))
            ],
          ),
        ));
  }

  void _criaTransferencia(BuildContext context) {
    final int numeroConta = int.tryParse(_controladorCampoNumeroConta.text)!;
    final double valor = double.tryParse(_controladorCampoValor.text)!;
    final transferenciaCriada = Transferencia(valor, numeroConta);
    Navigator.pop(context, transferenciaCriada);
  }
}