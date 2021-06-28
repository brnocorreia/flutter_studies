import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/contato.dart';
import 'package:flutter/material.dart';

const _tituloAppBar = "Novo Contato";
const _rotuloCampoNome = "Nome Completo";
const _dicaCampoNome = "Ex.: Bruno";
const _rotuloCampoNumeroConta = "Número da Conta";
const _dicaCampoNumeroConta = "0000";

class FormularioContatos extends StatefulWidget {
  const FormularioContatos({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return FormularioContatosState();
  }
}

class FormularioContatosState extends State<FormularioContatos> {
  final TextEditingController _controladorCampoNumeroConta =
      TextEditingController();
  final TextEditingController _controladorCampoNome = TextEditingController();

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
                controlador: _controladorCampoNome,
                dica: _dicaCampoNome,
                rotulo: _rotuloCampoNome,
                icone: Icons.face,
                teclado: TextInputType.name,
              ),
              Editor(
                controlador: _controladorCampoNumeroConta,
                dica: _dicaCampoNumeroConta,
                rotulo: _rotuloCampoNumeroConta,
                icone: Icons.looks_one,
                teclado: TextInputType.number,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: SizedBox(
                  width: double.maxFinite,
                  child: ElevatedButton(
                      child: Text("Criar",
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold)),
                      onPressed: () {
                        final String nome = _controladorCampoNome.text;
                        final int? numeroConta =
                            int.tryParse(_controladorCampoNumeroConta.text);
                        if (numeroConta != null) {
                          final Contato contatoCriado =
                              Contato(0, nome, numeroConta);
                          Navigator.pop(context, contatoCriado);
                        }
                      }),
                ),
              ),
            ],
          ),
        ));
  }
}
