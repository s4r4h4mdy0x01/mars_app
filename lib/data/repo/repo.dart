import 'package:hive/hive.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:intl/intl.dart';
import 'package:mars_app/data/api/api.dart';
import 'package:mars_app/data/db/local_db.dart';
import 'package:mars_app/data/model/mar_photo_model.dart';
import 'package:mars_app/data/model/rover_model.dart';
import 'package:mars_app/presentation/resources/string_manger.dart';

class Repo {
  late Api _api;

  Repo() {
    _api = Api();
  }

  Future<List<MarsPhotoModel>> fetchLatestPhotos() async {
    final data = await _api.getLatestPhotos();
    final photos = data.map((e) => MarsPhotoModel.fromJson(e)).toList();
    savaDB(photos);
    return photos;
  }

  Future<List<MarsPhotoModel>> fetchPhotoByDate(DateTime earthDate) async {
    bool isOnline = await InternetConnectionChecker().hasConnection;
    if (isOnline == true) {
      final String formatDate = DateFormat("yyyy-MM-dd").format(earthDate);
      final data = await _api.getPhotoByDate(formatDate);
      final photos = data.map((e) => MarsPhotoModel.fromJson(e)).toList();
    //  savaDB(photos);

      return photos;
    } else {
      return getDataFromDB(earthDate);
    }
  }

  Future<bool> fetchRoverData() async {
    try {
      final data = await _api.getRoverData();
      RoverModel rover = RoverModel.fromJson(data);
      Hive.box<RoverModel>(StringManger.roverBox)
          .put(StringManger.roverk, rover);
      return true;
    } catch (e) {
     
      return false;
    }
  }
}
