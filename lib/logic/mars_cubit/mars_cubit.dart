import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:mars_app/data/model/mar_photo_model.dart';
import 'package:mars_app/data/repo/repo.dart';

part 'mars_state.dart';

class MarsCubit extends Cubit<MarsState> {
  Repo repo;
  MarsCubit({required this.repo}) : super(MarsInitial()) {
    fetchRover();
  }
  int pageCount = 1;

  Future<void> fetchRover() async {
    emit(RoverLoading());
    await repo.fetchRoverData();
    emit(RoverSucceeded());
  }

  bool isPhotosLoaded = false;
  bool isloading = false;
  List<MarsPhotoModel> photosList = [];
  final ScrollController scrollController = ScrollController();
  void resetHomePage() {
    photosList = [];
    isPhotosLoaded = true;
  }

  Future<void> fetchDataMars(DateTime? date, {int? page}) async {
    emit(MarsLoading());
    final lPhotos = (date != null)
        ? await repo.fetchPhotoByDate(
            date,
          )
        : await repo.fetchLatestPhotos();
    isPhotosLoaded = true;
    photosList.addAll(lPhotos);
    emit(MarsSucceeded());
  }

  Future<void> checkScrollPosition(DateTime earthDate) async {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      isloading = true;
      await fetchDataMars(earthDate, page: pageCount++);
      isloading = false;
     
    }
  }
}
