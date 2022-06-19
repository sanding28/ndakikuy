// ignore_for_file: use_rethrow_when_possible

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ndakikuy/models/forms_model.dart';

class FormsServices{
  CollectionReference _formRef = FirebaseFirestore.instance.collection('forms');

  Future<List<FormsModel>> fetchForms() async {
    try {

      QuerySnapshot result = await _formRef.get();
      List<FormsModel> forms = result.docs.map((e){
        return FormsModel.fromjson(e.id, e.data() as Map<String, dynamic>);
      }).toList();
      

      return forms;
    } catch (e) {
      throw e;
    }
  }
}