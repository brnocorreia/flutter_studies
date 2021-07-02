import 'package:bytebank/database/app_database.dart';
// import 'package:bytebank/models/contato.dart';
import 'package:bytebank/models/transferencia.dart';
// import 'package:bytebank/screens/contatos/formulario_contatos.dart';
import 'package:bytebank/screens/transferencia/formulario_transferencia.dart';
import 'package:flutter/material.dart';

class ListaTransferencias extends StatelessWidget {
  final List<Transferencia> transferencias = [];

  @override
  Widget build(BuildContext context) {
    // saveTransfer(Transferencia(0, 1111, 1111));
    transferencias.add(Transferencia(1, 1111, 1111));
    transferencias.add(Transferencia(2, 1111, 1111));

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Transferências",
        ),
      ),
      body: FutureBuilder<List<Transferencia>>(
          initialData: [],
          future: Future.delayed(Duration(seconds: 1))
              .then((value) => findAllTransfer()),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                break;
              case ConnectionState.waiting:
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(
                        color: Colors.green[900],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          "Carregando",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),
                        ),
                      )
                    ],
                  ),
                );
              case ConnectionState.active:
                break;
              case ConnectionState.done:
                final List<Transferencia>? transferencias = snapshot.data;
                return ListView.builder(
                  itemBuilder: (context, index) {
                    final Transferencia? transferencia = transferencias?[index];
                    return ItemTransferencia(transferencia!);
                  },
                  itemCount: transferencias?.length ?? 0,
                );
            }
            return Text("Erro desconhecido");
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(
                MaterialPageRoute(
                  builder: (context) => FormularioTransferencia(),
                ),
              )
              .then((transferenciaCriada) =>
                  debugPrint(transferenciaCriada.toString()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia transferencia;

  ItemTransferencia(this.transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(
          transferencia.valor.toString(),
          style: TextStyle(fontSize: 24.0),
        ),
        subtitle: Text(
          transferencia.numeroConta.toString(),
          style: TextStyle(fontSize: 16.0),
        ),
      ),
    );
  }
}
