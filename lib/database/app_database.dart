import 'package:bytebank/models/contato.dart';
import 'package:bytebank/models/transferencia.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Future<Database> createDatabase() {
  return getDatabasesPath().then((dbPath) {
    final String path = join(dbPath, "bytebank.db");
    return openDatabase(path, onCreate: (db, version) async {
      await db.execute("CREATE TABLE contatos("
          "id INTEGER PRIMARY KEY, "
          "nome TEXT, "
          "numero_conta INTEGER)");
      await db.execute("CREATE TABLE transferencias("
          "idTrans INTEGER PRIMARY KEY, "
          "valor TEXT, "
          "numero_conta INTEGER");
    }, version: 2);
  });
}

Future<int> saveContato(Contato contato) {
  return createDatabase().then((db) {
    final Map<String, dynamic> contatoMap = Map();
    contatoMap["nome"] = contato.nome;
    contatoMap["numero_conta"] = contato.numeroConta;
    return db.insert("contatos", contatoMap);
  });
}

Future<int> saveTransfer(Transferencia transferencia) {
  return createDatabase().then((db) {
    final Map<String, dynamic> transferenciaMap = Map();
    transferenciaMap["valor"] = transferencia.valor;
    transferenciaMap["numero_conta"] = transferencia.numeroConta;
    return db.insert("transferencias", transferenciaMap);
  });
}

Future<List<Contato>> findAll() {
  return createDatabase().then((db) {
    return db.query("contatos").then((maps) {
      final List<Contato> contatos = [];
      for (Map<String, dynamic> map in maps) {
        final Contato contato = Contato(
          map["id"],
          map["nome"],
          map["numero_conta"],
        );
        contatos.add(contato);
      }
      return contatos;
    });
  });
}

Future<List<Transferencia>> findAllTransfer() {
  return createDatabase().then((db) async {
    // final a = await db.query("transferencias");
    // print(a);
    // return [];

    return db.query("transferencias").then((maps) {
      final List<Transferencia> transferencias = [];
      for (Map<String, dynamic> map in maps) {
        final Transferencia transferencia = Transferencia(
          map["idTrans"],
          map["valor"],
          map["numero_conta"],
        );
        transferencias.add(transferencia);
      }
      return transferencias;
    });
  });
}
