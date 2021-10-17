import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import 'despesa_form_back.dart';

class DespesaWidgetForm extends StatelessWidget {
  final _form = GlobalKey<FormState>();

  Widget fieldDescricao(DespesaFormBack back){
    return TextFormField(
      validator: back.validateDescricao,
      onSaved: (newValue) => back.despesa.descricao = newValue,
      initialValue: back.despesa.descricao,
      decoration: InputDecoration(
        labelText: 'Descrição:'
      )
    );
  }

  Widget fieldValor(DespesaFormBack back){
    return TextFormField(
      // validator: back.validateData,
      onSaved: (newValue) => back.despesa.data = newValue,
      initialValue: back.despesa.valor,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: 'Valor:',
        hintText: '00,00'
      )
    );
  }

  Widget fieldData(DespesaFormBack back){
    var mask = MaskTextInputFormatter(mask: '##/##/####');
    return TextFormField(
       // validator: back.validateValor,
      onSaved: (newValue) => back.despesa.valor = newValue,
      initialValue: back.despesa.data,
      inputFormatters: [mask],
      decoration: InputDecoration(
        labelText: 'Data:'
      )
    );
  }
  
@override
  Widget build(BuildContext context) {
    var _back = DespesaFormBack(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(139, 0, 139, 0.8),
        title: Text('Cadastro de Despesas'),
        actions:[
          IconButton(icon: Icon(Icons.save), onPressed: (){
            _form.currentState.validate();
            _form.currentState.save();
            if(_back.isValid){
              _back.save(context);
              
            }
          })
        ],
      ),
      body: Padding( 
        padding: EdgeInsets.all(10),
        child: Form(
          key: _form,
          child: Column(
            children:[
              fieldDescricao(_back),
              fieldValor(_back),
              fieldData(_back) 
            ],
          ),
        ),
      ),
    );
  }
}