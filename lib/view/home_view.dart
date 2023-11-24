import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mars_app/generated/l10n.dart';
import 'package:mars_app/logic/mars_cubit/mars_cubit.dart';
import 'package:mars_app/presentation/resources/string_manger.dart';
import 'package:mars_app/view/widget/drewer.dart';
import 'package:mars_app/view/widget/mars_card.dart';

class HomeView extends StatelessWidget {
  final DateTime? date;
  const HomeView({super.key, required this.date});

  @override
  Widget build(BuildContext context) {
    context.read<MarsCubit>().fetchDataMars(date);
    return Scaffold(
        appBar: AppBar(
          title: Text(
            S.of(context).apparTitle,
          ),
        ),
        body: BlocBuilder<MarsCubit, MarsState>(
          builder: (context, state) {
            return ConditionalBuilder(
              condition: state is MarsSucceeded,
              builder: (context) => ListView.builder(
                itemCount: (state as MarsSucceeded).photosList.length,
                itemBuilder: (context, index) =>
                    MarsCard(marsPhotos: state.photosList[index]),
              ),
              fallback: (context) => const Center(
                child: CircularProgressIndicator(),
              ),
            );
          },
        ));
  }
}
