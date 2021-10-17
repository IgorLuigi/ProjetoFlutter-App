import 'package:app/app/view/receita_form_back.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class ReceitaWidgetForm extends StatelessWidget{
  final _form = GlobalKey<FormState>();

  Widget fieldDescricao(ReceitaFormBack back){
    return TextFormField(
      validator: back.validateDescricao,
      onSaved: (newValue) => back.receita.descricao = newValue,
      initialValue: back.receita.descricao,
      decoration: InputDecoration(
        labelText: 'Descrição:'
      )
    );
  }

  Widget fieldValor(ReceitaFormBack back){
    return TextFormField(
      // validator: back.validateData,
      onSaved: (newValue) => back.receita.data = newValue,
      initialValue: back.receita.valor,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: 'Valor:',
        hintText: '00,00'
      )
    );
  }

  Widget fieldData(ReceitaFormBack back){
    var mask = MaskTextInputFormatter(mask: '##/##/####');
    return TextFormField(
      // validator: back.validateValor,
      onSaved: (newValue) => back.receita.valor = newValue,
      initialValue: back.receita.data,
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
        backgroundColor: Color.fromRGBO(139, 0, 139, 0.8),
        title: Text('Cadastro de Receitas'),
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