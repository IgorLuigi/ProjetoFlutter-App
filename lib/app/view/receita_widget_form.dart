import 'package:app/app/view/receita_form_back.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class ReceitaWidgetForm extends StatelessWidget{

  Widget fieldDescricao(ReceitaFormBack back){
    initialValue: back.receita.descricao;
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Descrição:'
      )
    );
  }

  Widget fieldValor(ReceitaFormBack back){
    initialValue: back.receita.valor;
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: 'Valor:',
        hintText: '00,00'
      )
    );
  }

  Widget fieldData(ReceitaFormBack back){
    initialValue: back.receita.data;
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
    var _back = ReceitaFormBack(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Receitas'),
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