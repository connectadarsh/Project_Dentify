import 'package:hive_flutter/hive_flutter.dart';
part 'form_db.g.dart';

@HiveType(typeId:5)
class FormDb extends HiveObject {
  @HiveField(0)
  int?id;

  @HiveField(1)
  String name;

  @HiveField(2)
  String age;

  @HiveField(3)
  String gender;

  @HiveField(4)
  String address;

  @HiveField(5)
  String medicalHistory;

  @HiveField(6)
  String dentalHistory;

  @HiveField(7)
  String diet;

  @HiveField(8)
  String tobacco;

  @HiveField(9)
  String oral;

    @HiveField(10)
  String chief;

    @HiveField(11)
  String mobile;

    @HiveField(12)
  String date;

    @HiveField(13)
  String time;

  FormDb({
    this.id,
  required this.name,
  required this.age,
  required this.gender,
  required this.address,
  required this.medicalHistory,
  required this.dentalHistory,
  required this.diet,
  required this.tobacco,
  required this.oral,
  required this.chief,
  required this.mobile,
  required this.date,
  required this.time});
}