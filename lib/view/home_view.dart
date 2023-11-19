import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mars_app/data/api/api.dart';
import 'package:mars_app/data/model/mar_photo_model.dart';
import 'package:mars_app/data/repo/repo.dart';
import 'package:mars_app/generated/l10n.dart';
import 'package:mars_app/presentation/resources/router_manger.dart';
import 'package:mars_app/presentation/resources/string_manger.dart';

class HomView extends StatelessWidget {
  const HomView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).apparTitle),
      ),
      drawer: Drawer(
        child: ListView(
          shrinkWrap: true,
          children: [
            ListTile(
              title: Text(S.of(context).theme),
              trailing: Switch(
                value: Hive.box(StringManger.onpenBox)
                    .get("isDark", defaultValue: false),
                onChanged: (v) =>
                    Hive.box(StringManger.onpenBox).put("isDark", v),
              ),
            ),
            ListTile(
              title: Text(
                S.of(context).lang,
              ),
              trailing: DropdownButton(
                items: <String>["en", "ar"]
                    .map(
                      (e) => DropdownMenuItem(
                        value: e,
                        child: Text(e == "ar" ? "Arabic" : "English"),
                      ),
                    )
                    .toList(),
                onChanged: (v) =>
                    Hive.box(StringManger.onpenBox).put("lag", v!),
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: FilledButton(
            onPressed: () {
              context.push(Routes.settingsRoute);
            },
            child: Text(S.of(context).apparTitle)),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Repo().fetchPhotoByDate(DateTime(2023,10,9));
        },
        child: const Icon(Icons.webhook),
      ),
    );
  }
}
