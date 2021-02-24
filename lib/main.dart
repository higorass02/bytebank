import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Super Choque'),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: actionAdd(),
            child: Icon(Icons.add),
          ),
          body: SingleChildScrollView(
            child: ListaTransferencias(),
            ),
          ),
      ),
  );
}

actionAdd() {
  debugPrint('clicou no ADD1');
  return null;
}

class	ItemTransferencia	extends	StatelessWidget	{
  @override
  Widget	build(BuildContext	context)	{
    //	TODO:	implement	build
    return	Card(
      child:	ListTile(
        leading:	Icon(Icons.monetization_on),
        title:	Text('300.0'),
        subtitle:	Text('1000'),
        trailing: Icon(Icons.more_vert),
      ),
    );
  }
}
class	Transferencia	{
  final	double	valor;
  final	int	numeroConta;

  Transferencia(this.valor,	this.numeroConta);
}

class	ListaTransferencias	extends	StatelessWidget{
  @override
  Widget	build(BuildContext	context)	{
    //	TODO:	implement	build
    return	Column(
        children:	<Widget>[
          ItemTransferencia(),
          ItemTransferencia(),
          ItemTransferencia(),
        ]
    );
  }
}