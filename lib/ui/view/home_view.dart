import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:mars_app/data/model/rover_model.dart';

import 'package:mars_app/generated/l10n.dart';
import 'package:mars_app/logic/mars_cubit/mars_cubit.dart';

import 'package:mars_app/ui/widget/mars_card.dart';
import 'package:mars_app/utils/resources/size_manger.dart';
import 'package:mars_app/utils/resources/string_manger.dart';

class HomeView extends StatelessWidget {
  final DateTime? date;
  const HomeView({super.key, required this.date});

  @override
  Widget build(BuildContext context) {
    final MarsCubit cubit = context.read<MarsCubit>();
    final RoverModel rover =
        Hive.box<RoverModel>(StringManger.roverBox).get(StringManger.roverk)!;
    cubit.resetHomePage();
    cubit.fetchDataMars(date ?? rover.maxDate);
    cubit.scrollController.addListener(
      () => cubit.checkScrollPosition(date ?? rover.maxDate),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).apparTitle,
        ),
      ),
      body: BlocBuilder<MarsCubit, MarsState>(
        builder: (context, state) {
          return ConditionalBuilder(
            condition: cubit.isPhotosLoaded,
            builder: (context) => GridView.builder(
              controller: cubit.scrollController,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              // childAspectRatio: AppSize.s1_3,
               
                crossAxisSpacing: AppSize.s8,
                mainAxisSpacing: AppSize.s10,
              ),
              itemCount: cubit.isloading
                  ? cubit.photosList.length + 1
                  : cubit.photosList.length,
              itemBuilder: (context, index) => (index < cubit.photosList.length)
                  ? MarsCard(marsPhotos: cubit.photosList[index])
                  : const Center(
                      child: CircularProgressIndicator(),
                    ),
            ),
            fallback: (context) => const Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }
}
