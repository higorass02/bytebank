import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(BytebankApp());

class BytebankApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ListaDeTransferencias(),
    );
  }
}

//////////// FORMULÁRIO DE TRANSFERÊNCIA ///////////////

class FormularioDeTransferencia extends StatelessWidget {
  TextEditingController controladorDoCampoNumeroDaConta = TextEditingController();
  TextEditingController controladorDoCampoValor = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Criando transferência'),
      ),
      body: Column(
        children: <Widget>[
          CampoDeFormulario(
            controladorDoCampoNumeroDaConta,
            'Número da Conta',
            '0000',
            teclado: TextInputType.emailAddress,
          ),
          CampoDeFormulario(
            controladorDoCampoValor,
            'Valor',
            '0.00',
            icone: Icons.monetization_on,
          ),
          RaisedButton(
            child: Text('Confirmar'),
            onPressed: () => _criaTransferencia(context),
          ),
        ],
      ),
    );
  }

  void _criaTransferencia(BuildContext context) {
    debugPrint('Clicou em confirmar');

    int numeroDaConta = int.tryParse(controladorDoCampoNumeroDaConta.text);
    double valor = double.tryParse(controladorDoCampoValor.text);

    if (numeroDaConta != null && valor != null) {
      Transferencia transferencia = Transferencia(valor, numeroDaConta);
      debugPrint('Transferência criada $transferencia');

      Navigator.pop(context, transferencia);
    }
  }
}

class CampoDeFormulario extends StatelessWidget {
  TextEditingController _controlador;
  String _rotulo;
  String _dica;
  IconData icone;
  TextInputType teclado;

  CampoDeFormulario(this._controlador, this._rotulo, this._dica, {this.icone, this.teclado});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: TextField(
        controller: _controlador,
        style: TextStyle(fontSize: 24.0),
        decoration: InputDecoration(
          labelText: _rotulo,
          hintText: _dica,
          icon: icone != null ? Icon(icone) : null,
        ),
        keyboardType: teclado != null ? teclado : TextInputType.number,
      ),
    );
  }
}

////////////// LISTAGEM DE TRANSFERÊNCIA ///////////////

class ListaDeTransferencias extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transferências'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Future<Transferencia> futuro = Navigator.push(context, MaterialPageRoute(builder: (ctx) {
            return FormularioDeTransferencia();
          }));

          futuro.then((transferenciaRecebida) {
            debugPrint('Transferência recebida no then do Future $transferenciaRecebida');
          });

        },
      ),
      body: Column(
        children: [
          CartaoDeTransferencia(Transferencia(2500.0, 1234)),
          CartaoDeTransferencia(Transferencia(1750.0, 3344)),
          CartaoDeTransferencia(Transferencia(345.0, 5432)),
          CartaoDeTransferencia(Transferencia(345.0, 5432)),
        ],
      ),
    );
  }
}

class CartaoDeTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  CartaoDeTransferencia(this._transferencia);

  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(this._transferencia._valor.toString()),
        subtitle: Text(this._transferencia._numeroConta.toString()),
      ),
    );
  }
}

////////// MODELO ////////////

class Transferencia {
  final double _valor;
  final int _numeroConta;

  Transferencia(this._valor, this._numeroConta);

  @override
  String toString() {
    return 'Transferencia{_valor: $_valor, _numeroConta: $_numeroConta}';
  }
}
