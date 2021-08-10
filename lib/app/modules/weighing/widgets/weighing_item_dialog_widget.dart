import 'package:flutter/material.dart';

class WeighingItemDialogWidget extends StatelessWidget {

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  WeighingItemDialogWidget({
    Key? key,
  }) : super(key: key);

  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return AlertDialog(
      content: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: _dateController,
              validator: (value) {
                return value!.isNotEmpty ? null : "Data inválida";
              },
              decoration: InputDecoration(hintText: "01/01/2021"),
            ),
            TextFormField(
              controller: _weightController,
              validator: (value) {
                return value!.isNotEmpty ? null : "Peso inválido";
              },
              decoration: InputDecoration(hintText: "70kg"),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: Text('Cancelar', style: TextStyle(color: Colors.blueAccent)),
          onPressed: () => Navigator.of(context).pop(),
        ),
        TextButton(
          child: Text('Salvar', style: TextStyle(color: Colors.blueAccent)),
          onPressed: () {
            if(formKey.currentState!.validate()) {
              print('Salvar form de pesagem');
              Navigator.of(context).pop();
            }
          },
        ),
      ],
    );
    
  }

}