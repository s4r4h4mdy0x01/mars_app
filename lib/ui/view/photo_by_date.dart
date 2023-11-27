import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:mars_app/data/model/rover_model.dart';

import 'package:mars_app/generated/l10n.dart';
import 'package:mars_app/utils/resources/router_manger.dart';
import 'package:mars_app/utils/resources/size_manger.dart';
import 'package:mars_app/utils/resources/string_manger.dart';

import 'package:mars_app/ui/widget/drewer.dart';

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
      body: Padding(
        padding: EdgeInsets.all(AppPadding.p14),
        child: Column(
          children: [
            const SizedBox(width: double.infinity),
            FilledButton(
              onPressed: () => context.push(Routes.homeRoute),
              child: Container(
                margin: const EdgeInsets.all(AppMargin.m14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(S.of(context).latestPhotos),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: AppSize.s16,
            ),
            Image.asset('assets/1m.jpg'),
              SizedBox(
              height: AppSize.s16,
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
              
              child: Container(
                margin: const EdgeInsets.all(AppMargin.m14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(S.of(context).dateByPhotos),
                    const Icon(Icons.calendar_today)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
