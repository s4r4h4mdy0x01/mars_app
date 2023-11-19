import 'package:hive_flutter/hive_flutter.dart';
import 'package:mars_app/data/model/mar_photo_model.dart';
import 'package:mars_app/presentation/resources/string_manger.dart';

Box<MarsPhotoModel> boxPhotoDB =
    Hive.box<MarsPhotoModel>(StringManger.marsPhotoDB);
void savaDB(List<MarsPhotoModel> marsPhoto) {
    for (MarsPhotoModel photo in marsPhoto) {
      if (boxPhotoDB.get(photo.id) != photo) {
        boxPhotoDB.put(photo.id, photo);
      }
    }
}

List<MarsPhotoModel> getDataFromDB(DateTime date) {
  return boxPhotoDB.values
      .where((MarsPhotoModel photo) => photo.earthDate == date)
      .toList();
}

