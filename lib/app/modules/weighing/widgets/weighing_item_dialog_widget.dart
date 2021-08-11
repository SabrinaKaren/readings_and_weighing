import 'package:flutter/material.dart';
import 'package:readings_and_weighing/app/shared/utils/input_formatters.dart';
import 'package:readings_and_weighing/app/shared/widgets/input_with_label_widget.dart';
import 'package:readings_and_weighing/app/shared/widgets/spin_field_widget.dart';

class WeighingItemDialogWidget extends StatelessWidget {

  WeighingItemDialogWidget({
    Key? key,
  }) : super(key: key);

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController _dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      child: AlertDialog(
        content: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              InputWithLabelWidget(
                controller: _dateController,
                labelText: 'Data',
                inputFormatters: [InputFormatters().maskTextInputFormatter('##/##/####')],
                type: TextInputType.number,
                hintText: '01/01/2021',
              ),
              Row(
                children: [
                  Expanded(
                    child: SpinFieldWidget(
                      min: 10,
                      max: 200,
                      value: 70,
                      decimals: 2,
                      step: 0.1,
                      textStyle: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text('Kg'),
                ],
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
        elevation: 10,
        scrollable: true,
        title: Text('Nova pesagem', textAlign: TextAlign.center),
      ),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
    );
    
  }

}