class Transferencia {
  final int idTrans;
  final double valor;
  final int numeroConta;

  Transferencia(this.idTrans, this.valor, this.numeroConta);

  @override
  String toString() {
    return 'Transferencia{idTrans: $idTrans, valor: $valor, numeroConta: $numeroConta}';
  }
}
