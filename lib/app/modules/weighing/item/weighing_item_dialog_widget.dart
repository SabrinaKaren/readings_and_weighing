import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:readings_and_weighing/app/modules/weighing/models/weighing_model.dart';
import 'package:readings_and_weighing/app/shared/utils/input_formatters.dart';
import 'package:readings_and_weighing/app/shared/widgets/input_with_label_widget.dart';
import 'package:readings_and_weighing/app/shared/widgets/spin_field_widget.dart';
import '../weighing_store.dart';

class WeighingItemDialogWidget extends StatefulWidget {

  final WeighingModel weighingObject;

  WeighingItemDialogWidget({
    Key? key,
    required this.weighingObject,
  }) : super(key: key);

  @override
  _WeighingItemDialogWidgetState createState() => _WeighingItemDialogWidgetState();

}

class _WeighingItemDialogWidgetState extends State<WeighingItemDialogWidget> {

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController _dateController = TextEditingController();
  final WeighingStore store = Modular.get();

  @override
  void initState() {
    super.initState();
    _dateController.text = widget.weighingObject.date;
  }

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
                hintText: this.widget.weighingObject.date,
              ),
              Row(
                children: [
                  Expanded(
                    child: SpinFieldWidget(
                      min: 10,
                      max: 200,
                      value: this.widget.weighingObject.weight.toDouble(),
                      decimals: 2,
                      step: 0.1,
                      textStyle: TextStyle(
                        fontSize: 20,
                      ),
                      onChanged: (newValue) => this.widget.weighingObject.weight = newValue,
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
            child: Text('Cancelar', style: TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold)),
            onPressed: () => Navigator.of(context).pop(),
          ),
          TextButton(
            child: Text('Salvar', style: TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold)),
            onPressed: () => store.addNewItemInPage(this.widget.weighingObject.id, _dateController.text, this.widget.weighingObject.weight),
            /* onPressed: () {
              if(formKey.currentState!.validate()) {
                print('Salvar form de pesagem');
                Navigator.of(context).pop();
              }
            }, */
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