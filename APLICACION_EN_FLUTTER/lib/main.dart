import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'estudio.dart';

void main() {
  runApp(new MaterialApp(home: new MyTextInput()));
}

class MyTextInput extends StatefulWidget {
  @override
  MyTextInputState createState() => new MyTextInputState();
}

class MyTextInputState extends State<MyTextInput> {
  List<String> data = List(3);
  DateTime _date = DateTime.now();

  Future<Null> _selectDate(BuildContext context) async {
    DateTime datePicker = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(1947),
      lastDate: DateTime(2030),
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeData(
            primarySwatch: Colors.blue,
            primaryColor: Colors.blue,
            accentColor: Colors.blue,
          ), 
          child: child
        );
      }
    );

    if (datePicker != null && datePicker != _date){
      setState(() {
        _date = datePicker;
      });
    } 
  }

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    data[2] = DateFormat.yMd().format(_date);
    return Scaffold(
        appBar: new AppBar(
          title: new Text('Input Text'),
          backgroundColor: Colors.deepOrange,
        ),
        body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
                key: formKey,
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Ingrese su nombre'
                      ),
                      onSaved: (value) {
                        data[0] = value;
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Llene este campo';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Ingrese sus apellidos',
                      ),
                      onSaved: (value) {
                        data[1] = value;
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Llene este campo';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      cursorColor: Colors.blue,
                      readOnly: true,
                      onTap: () {
                        setState(() {
                          _selectDate(context);
                        });
                      },
                      decoration: InputDecoration(
                        labelText: 'Selecciona tu fecha de nacimiento',
                        hintText: (data[2]),
                      ),
                    ),
                    RaisedButton(
                      child: Text('Calcular'),
                      onPressed: () {
                        _showSecondPage(context);
                      },
                    ),
                  ],
                )
              )
            )
          );
  }

  void _showSecondPage(BuildContext context) {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => StudioScreen(data : data),
        )
      );
    }
  }
}
