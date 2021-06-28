import 'package:bytebank/screens/contatos/lista_contatos.dart';
import 'package:bytebank/screens/transferencia/lista_transferencia.dart';
import 'package:flutter/material.dart';

class DashboardInicial extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DashboardInicialState();
  }
}

class DashboardInicialState extends State<DashboardInicial> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Dashboard"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(60.0),
                    child: Image.asset("images/bytebank_logo.png")),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Botao(
                    name: "Contatos",
                    onTap: () {
                      Navigator.of(context).push(
                        (MaterialPageRoute(
                          builder: (context) => ListaContatos(),
                        )),
                      );
                    },
                  ),
                  Botao(
                    name: "Transferências",
                    icons: Icons.list,
                    onTap: () {
                      Navigator.of(context).push(
                        (MaterialPageRoute(
                          builder: (context) => ListaTransferencias(),
                        )),
                      );
                    },
                  ),
                ],
              )
            ],
          ),
        ));
  }
}

class Botao extends StatelessWidget {
  const Botao({
    Key? key,
    this.name = "Nome",
    this.width = 150.0,
    this.icons = Icons.people,
    required this.onTap,
  }) : super(key: key);

  final String name;
  final double width;
  final IconData icons;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
        color: Theme.of(context).primaryColor,
        child: InkWell(
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.all(8.0),
            height: 100,
            width: width,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Icon(
                    icons,
                    color: Colors.white,
                    size: 24.0,
                  ),
                  Text(
                    name,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
