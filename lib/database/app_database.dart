import 'package:bytebank/models/contato.dart';
import 'package:bytebank/models/transferencia.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Future<Database> createDatabaseContatos() async {
  final String path = join(await getDatabasesPath(), "bytebank.db");
  return openDatabase(
    path,
    onCreate: (dbcontato, version) {
      dbcontato.execute("CREATE TABLE contatos("
          "id INTEGER PRIMARY KEY, "
          "nome TEXT, "
          "numero_conta INTEGER)");
    },
    version: 1,
    // onDowngrade: onDatabaseDowngradeDelete,
  );
}

Future<Database> createDatabaseTransfer() async {
  final String path = join(await getDatabasesPath(), "bytebank.db");
  return openDatabase(path, onCreate: (dbtransfer, version) {
    dbtransfer.execute("CREATE TABLE transferencia("
        "id INTEGER PRIMARY KEY, "
        "valor TEXT, "
        "numero_conta INTEGER)");
  }, version: 1);
}

Future<int> saveContato(Contato contato) {
  return createDatabaseContatos().then((dbcontato) {
    final Map<String, dynamic> contatoMap = Map();
    contatoMap["nome"] = contato.nome;
    contatoMap["numero_conta"] = contato.numeroConta;
    return dbcontato.insert("contatos", contatoMap);
  });
}

Future<int> saveTransfer(Transferencia transferencia) {
  return createDatabaseTransfer().then((dbtransfer) {
    final Map<String, dynamic> transferenciaMap = Map();
    transferenciaMap["valor"] = transferencia.valor;
    transferenciaMap["numero_conta"] = transferencia.numeroConta;
    return dbtransfer.insert("transferencias", transferenciaMap);
  });
}

Future<List<Contato>> findAll() {
  return createDatabaseContatos().then((dbcontato) {
    return dbcontato.query("contatos").then((maps) {
      final List<Contato> contatos = [];
      for (Map<String, dynamic> row in maps) {
        final Contato contato = Contato(
          row["id"],
          row["nome"],
          row["numero_conta"],
        );
        contatos.add(contato);
      }
      return contatos;
    });
  });
}

Future<List<Transferencia>> findAllTransfer() {
  return createDatabaseTransfer().then((db) async {
    // final a = await db.query("transferencias");
    // print(a);
    // return [];

    return db.query("transferencias").then((maps) {
      final List<Transferencia> transferencias = [];
      for (Map<String, dynamic> row in maps) {
        final Transferencia transferencia = Transferencia(
          row["idTrans"],
          row["valor"],
          row["numero_conta"],
        );
        transferencias.add(transferencia);
      }
      return transferencias;
    });
  });
}
