import 'package:flutter/material.dart';
import 'package:projetflutterfinal/database/DatabaseHelper.dart';

import '../comHelper.dart';
import '../genTextFormField.dart';
class FamilyPage extends StatefulWidget {
  const FamilyPage({Key? key}) : super(key: key);

  @override
  _FamilyPageState createState() => _FamilyPageState();
}

class _FamilyPageState extends State<FamilyPage> {

  final _formdd = new GlobalKey<FormState>();
  final dbHelperr = DatabaseHelper.instance;

  TextEditingController _conNameFamily = new TextEditingController();
  TextEditingController _conDescriptionFamily = new TextEditingController();

  _addfamily() async {
    String f_name = _conNameFamily.text;
    String f_desc = _conDescriptionFamily.text;


    if (_formdd.currentState!.validate()) {

      _formdd.currentState!.save();

        Map<String, dynamic> roww = {
          DatabaseHelper.columnn_name: f_name,
          DatabaseHelper.column_description:f_desc ,

        };

        final id = await dbHelperr.insertFamily(roww).then((value) {
          alertDialog(context, "successfully saved");
          print('inserted row name: hhhjj');


        }).catchError((error) {
          print(error);
          alertDialog(context, "error : data save fail");
        });
      }
    }//
  void _insertfam() async {
    String f_name = _conNameFamily.text;
    String f_desc = _conDescriptionFamily.text;

    // row to insert
    Map<String, dynamic> rowww = {
      DatabaseHelper.columnn_name: f_name,
      DatabaseHelper.column_description:f_desc ,
    };
    final id = await dbHelperr.insertFamily(rowww);
    print('inserted row name: $id');
    alertDialog(context, "successfully saved");
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text('family'),

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
    controller: _conNameFamily,
    icon: Icons.person_outline,
    inputType: TextInputType.name,
    hintName: 'composant name'),
    SizedBox(height: 10.0),
    getTextFormField(
    controller: _conDescriptionFamily,
    icon: Icons.ac_unit,
    inputType: TextInputType.emailAddress,
    hintName: 'description'),
    SizedBox(height: 10.0),
      Container(
        margin: EdgeInsets.all(30.0),
        width: double.infinity,
        child: FlatButton(
          child: Text(
            'add Family composant',
            style: TextStyle(color: Colors.white),
          ),
          onPressed: _insertfam,

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
    );}

}

