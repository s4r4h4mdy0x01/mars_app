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
}
