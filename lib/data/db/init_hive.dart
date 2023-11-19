import 'package:hive_flutter/hive_flutter.dart';
import 'package:mars_app/data/model/mar_photo_model.dart';
import 'package:mars_app/presentation/resources/string_manger.dart';

Future<void> initHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(MarsPhotoModelAdapter());
  Hive.registerAdapter(CameraAdapter());
  await Hive.openBox(StringManger.onpenBox);
  await Hive.openBox<MarsPhotoModel>(StringManger.marsPhotoDB);
}
