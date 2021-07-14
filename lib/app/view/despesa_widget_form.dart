import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import 'despesa_form_back.dart';

class DespesaWidgetForm extends StatelessWidget {

  Widget fieldDescricao(DespesaFormBack back){
    initialValue: back.despesa.descricao;
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Descrição:'
      )
    );
  }

  Widget fieldValor(DespesaFormBack back){
    initialValue: back.despesa.valor;
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: 'Valor:',
        hintText: '00,00'
      )
    );
  }

  Widget fieldData(DespesaFormBack back){
    initialValue: back.despesa.data;
    var mask = MaskTextInputFormatter(mask: '##/##/####');
    return TextFormField(
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
        title: Text('Cadastro de Despesas'),
        actions:[
          IconButton(icon: Icon(Icons.save), onPressed: null)
        ],
      ),
      body: Padding( 
        padding: EdgeInsets.all(10),
        child: Form(
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