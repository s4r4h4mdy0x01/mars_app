import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mars_app/data/model/mar_photo_model.dart';
import 'package:mars_app/data/repo/repo.dart';

part 'mars_state.dart';

class MarsCubit extends Cubit<MarsState> {
  Repo repo;
  MarsCubit({required this.repo}) : super(MarsInitial()) {
    fetchRover();
  }

  Future<void> fetchRover() async {
    emit(RoverLoading());
    await repo.fetchRoverData();
    emit(RoverSucceeded());
  }

  void fetchDataMars(DateTime? date) async {
    emit(MarsLoading());
    final photosList = (date != null)
        ? await repo.fetchPhotoByDate(date)
        : await repo.fetchLatestPhotos();
    emit(MarsSucceeded(photosList: photosList));
  }
}
