import 'package:intl/intl.dart';
import 'package:mars_app/data/api/api.dart';
import 'package:mars_app/data/model/mar_photo_model.dart';

class Repo {
  late Api _api;

  Repo() {
    _api = Api();
  }

  Future<List<MarsPhotoModel>> fetchLatestPhotos() async {
    final data = await _api.getLatestPhotos();
    final photos = data.map((e) => MarsPhotoModel.formJson(e)).toList();
    return photos;
  }

  Future<List<MarsPhotoModel>> fetchPhotoByDate(DateTime earthDate) async {
    final String formatDate = DateFormat("yyyy-MM-dd").format(earthDate);
    final data = await _api.getPhotoByDate(formatDate);
    final photos = data.map((e) => MarsPhotoModel.formJson(e)).toList();
    print(photos.first.imgSrc);

    return photos;
  }
}
