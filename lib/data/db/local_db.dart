import 'package:hive_flutter/hive_flutter.dart';
import 'package:mars_app/data/model/mar_photo_model.dart';
import 'package:mars_app/presentation/resources/string_manger.dart';

Box<MarsPhotoModel> boxPhotoDBBox =
    Hive.box<MarsPhotoModel>(StringManger.marsPhotoDBBox);
void savaDB(List<MarsPhotoModel> marsPhoto) {
  for (MarsPhotoModel photo in marsPhoto) {
    final MarsPhotoModel? localPhotos = boxPhotoDBBox.get(photo.id);
    if (localPhotos != photo) {
      boxPhotoDBBox.put(photo.id, photo);
    }
  }
}

List<MarsPhotoModel> getDataFromDB(DateTime date) {
  return boxPhotoDBBox.values
      .where((MarsPhotoModel photo) => photo.earthDate == date)
      .toList();
}
