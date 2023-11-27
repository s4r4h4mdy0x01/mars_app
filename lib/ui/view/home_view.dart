import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:mars_app/generated/l10n.dart';
import 'package:mars_app/logic/mars_cubit/mars_cubit.dart';
import 'package:mars_app/ui/widget/check_end_reached.dart';

import 'package:mars_app/ui/widget/mars_card.dart';

class HomeView extends StatelessWidget {
  final DateTime? date;
  const HomeView({super.key, required this.date});

  @override
  Widget build(BuildContext context) {
    final MarsCubit cubit = context.read<MarsCubit>();

    cubit.resetHomePage();
    cubit.fetchDataMars(date);
    cubit.scrollController.addListener(
      () => cubit.checkScrollPosition(date!),
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
              builder: (context) => ListView.builder(
                controller: cubit.scrollController,
                itemCount: cubit.isloading
                    ? cubit.photosList.length + 1
                    : cubit.photosList.length,
                itemBuilder: (context, index) =>
                    (index < cubit.photosList.length)
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
        ));
  }
}
