import 'package:flutter/material.dart';
import 'package:projetflutterfinal/database/DatabaseHelper.dart';

import '../comHelper.dart';
import '../genTextFormField.dart';
class ComposantPage extends StatefulWidget {
  const ComposantPage({Key? key}) : super(key: key);

  @override
  _ComposantPageState createState() => _ComposantPageState();
}

class _ComposantPageState extends State<ComposantPage> {

  final _formddc = new GlobalKey<FormState>();
  final dbHelperrm = DatabaseHelper.instance;

  TextEditingController _conNameComposant = new TextEditingController();
  TextEditingController _conDescriptionComposant = new TextEditingController();
  TextEditingController _conQuantity = new TextEditingController();
  TextEditingController _conFamily = new TextEditingController();

  _addcomposant() async {
    String c_name = _conNameComposant.text;
    String c_desc = _conDescriptionComposant.text;


    if (_formddc.currentState!.validate()) {

      _formddc.currentState!.save();

      Map<String, dynamic> rowwm = {
        DatabaseHelper.columnnn_name: c_name,
        DatabaseHelper.columnn_description:c_desc ,

      };

      final id = await dbHelperrm.insertComposant(rowwm).then((value) {
        alertDialog(context, "successfully saved");
        print('inserted row name: ');


      }).catchError((error) {
        print(error);
        alertDialog(context, "error : data save fail");
      });
    }
  }//
  void _insertcom() async {
    String c_name = _conNameComposant.text;
    String c_desc = _conDescriptionComposant.text;

    // row to insert
    Map<String, dynamic> rowwwm = {
      DatabaseHelper.columnnn_name: c_name,
      DatabaseHelper.columnn_description:c_desc ,
    };
    final id = await dbHelperrm.insertComposant(rowwwm);
    print('inserted row name: $id');
    alertDialog(context, "successfully saved");
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('composants'),

      ),
      body: Form(

        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(margin: const EdgeInsets.only(top: 15.0),

            child: Center(
              child: Column(

                  mainAxisAlignment: MainAxisAlignment.center,


                  children: [
                    getTextFormField(
                        controller: _conNameComposant,
                        icon: Icons.person_outline,
                        inputType: TextInputType.name,
                        hintName: 'composant name'),
                    SizedBox(height: 10.0),
                    getTextFormField(
                        controller: _conDescriptionComposant,
                        icon: Icons.ac_unit,
                        inputType: TextInputType.emailAddress,
                        hintName: 'description'),
                    SizedBox(height: 10.0),
                    getTextFormField(
                      controller: _conQuantity,
                      icon: Icons.accessibility,
                      hintName: 'quantity',
                      isObscureText: true,
                    ),
                    SizedBox(height: 10.0),
                    getTextFormField(
                      controller: _conFamily,
                      icon: Icons.account_balance,
                      hintName: 'family',
                      isObscureText: true,
                    ),
                    Container(
                      margin: EdgeInsets.all(30.0),
                      width: double.infinity,
                      child: FlatButton(
                        child: Text(
                          'add composant',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: _insertcom,

                      ),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                  ]
              ),
            ),

          ),

        ),
      ),
    );

  }

  _signUp() {}

}


