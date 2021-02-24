import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: MyStatefulWidget(),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              style: TextStyle(
                fontSize: 24.0,
              ),
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: 'Número	da	conta', hintText: '0000'),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Entre com o Número da conta';
                }
                return null;
              },
            ),
            TextFormField(
              style: TextStyle(
                fontSize: 24.0,
              ),
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                icon: Icon(Icons.monetization_on),
                labelText: 'Valor',
                hintText: '0.00',
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Entre com o Valor da Transferência';
                }
                return null;
              },
            ),
            RaisedButton(
                child: Text('Confirmar'),
                onPressed: () {
                  print('clicou	no	confirmar');
                }
            ),
          ],
        ),
      ),
    );
  }
}
