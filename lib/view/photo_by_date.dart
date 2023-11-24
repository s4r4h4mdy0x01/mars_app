import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:mars_app/data/model/rover_model.dart';

import 'package:mars_app/generated/l10n.dart';
import 'package:mars_app/presentation/resources/router_manger.dart';
import 'package:mars_app/presentation/resources/string_manger.dart';

import 'package:mars_app/view/widget/drewer.dart';

class PhotoByDateView extends StatelessWidget {
  const PhotoByDateView({super.key});

  @override
  Widget build(BuildContext context) {
    final RoverModel rover =
        Hive.box<RoverModel>(StringManger.roverBox).get(StringManger.roverk)!;
    final bool mode = Hive.box(StringManger.onpenBox)
        .get(StringManger.isDark, defaultValue: false);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).apparTitle,
        ),
      ),
      drawer: DrewarWidget(mode: mode),
      body: Column(
        children: [
          const SizedBox(width: double.infinity),
          FilledButton(
            onPressed: () => context.push(Routes.homeRoute),
            child: Text(S.of(context).latestPhotos),
          ),
          FilledButton(
            onPressed: () async {
              await showDatePicker(
                context: context,
                initialDate: rover.maxDate,
                firstDate: rover.landingDate,
                lastDate: rover.maxDate,
              ).then((date) {
                if (date != null) {
                  context.push(Routes.homeRoute, extra: date);
                }
              });
            },
            child: Text(S.of(context).dateByPhotos),
          ),
        ],
      ),
    );
  }
}
