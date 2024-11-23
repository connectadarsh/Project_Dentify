import 'package:dentify/model/form_db/form_db.dart';
import 'package:hive/hive.dart';

class FormDetails {
  Future<void>addFormDetails(FormDb value)async{
      final formData=await Hive.box<FormDb>('FormBox');
      final _id=await formData.add(value);
      value.id=_id;
  }

  Future<void>updateFormDetails(int index,FormDb value)async{
      final formData=await Hive.box<FormDb>('FormBox');
      await formData.putAt(index,value);
  }

    Future<void>deleteFormDetails(int index)async{
      final formData=await Hive.box<FormDb>('FormBox');
      await formData.deleteAt(index);
  }
  
   // Fetch all form details
 

  }