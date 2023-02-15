import 'package:bytebank/views/transferencia/formulario.dart';
import 'package:flutter/material.dart';

import '../../models/transferencia.dart';

const _tituloAppBar = "Transferências";

class ListaTransferencia extends StatefulWidget {
  final List<Transferencia> _transferencia = [];

  @override
  State<StatefulWidget> createState() {
    return ListaTransferenciaState();
  }
}

class ListaTransferenciaState extends State<ListaTransferencia> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_tituloAppBar),
        ),
        body: ListView.builder(
          itemCount: widget._transferencia.length,
          itemBuilder: (context, indice) {
            final transferencia = widget._transferencia[indice];
            return ItemTransferencia(transferencia);
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return FormularioTransferencia();
            })).then(
                (transferenciaRecebida) => _atualiza(transferenciaRecebida));
          },
          child: Icon(Icons.add),
        ));
  }

  void _atualiza(transferenciaRecebida) {
    if (transferenciaRecebida != null) {
      setState(() {
        widget._transferencia.add(transferenciaRecebida);
      });
    }
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      leading: Icon(Icons.monetization_on),
      title: Text(_transferencia.valor.toString()),
      subtitle: Text(_transferencia.numeroConta.toString()),
    ));
  }
}
