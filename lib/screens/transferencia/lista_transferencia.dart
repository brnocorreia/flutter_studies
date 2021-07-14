import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/material.dart';

class ListaTransferencias extends StatelessWidget {
  final List<Transferencia> transferencias = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transactions'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final Transferencia transferencia = transferencias[index];
          return Card(
            child: ListTile(
              leading: Icon(Icons.monetization_on),
              title: Text(
                transferencia.valor.toString(),
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                transferencia.contato.numeroConta.toString(),
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ),
          );
        },
        itemCount: transferencias.length,
      ),
    );
  }
}
