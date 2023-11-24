import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mars_app/presentation/resources/color_manger.dart';
import 'package:mars_app/presentation/resources/size_manger.dart';
import 'package:mars_app/presentation/resources/string_manger.dart';
import 'package:mars_app/generated/l10n.dart';

class DrewarWidget extends StatelessWidget {
  const DrewarWidget({
    super.key,
    required this.mode,
  });

  final bool mode;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: EdgeInsets.only(
            left: AppPadding.p4, right: AppPadding.p8, top: AppPadding.p14),
        child: ListView(
          shrinkWrap: true,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                //  color: Colors.blue,
                image: DecorationImage(
                  image: AssetImage(
                    'assets/1m.jpg',
                  ),
                  fit: BoxFit.fill,
                ),
              ),
              child: Text(
                S.of(context).headerDrewer,
                style: const TextStyle(color: Colors.white),
              ),
            ),
            ListTile(
              title: Row(
                children: [
                  mode
                      ? const Icon(Icons.dark_mode)
                      : const Icon(Icons.light_mode),
                  SizedBox(width: AppSize.s8),
                  Text(S.of(context).theme),
                ],
              ),
              trailing: Switch(
                activeColor: darkColorScheme.onSecondary,
                activeTrackColor: darkColorScheme.secondary,
                inactiveThumbColor: lightColorScheme.tertiary,
                inactiveTrackColor: lightColorScheme.outline,
                value: Hive.box(StringManger.onpenBox)
                    .get(StringManger.isDark, defaultValue: false),
                onChanged: (v) =>
                    Hive.box(StringManger.onpenBox).put(StringManger.isDark, v),
              ),
            ),
            ListTile(
              title: Row(
                children: [
                  const Icon(Icons.language),
                  SizedBox(width: AppSize.s4),
                  Text(
                    S.of(context).lang,
                  ),
                ],
              ),
              trailing: DropdownButton(
                items: <String>[StringManger.en, StringManger.ar]
                    .map(
                      (e) => DropdownMenuItem(
                        value: e,
                        child:
                            Text(e == StringManger.ar ? "Arabic" : "English"),
                      ),
                    )
                    .toList(),
                onChanged: (v) =>
                    Hive.box(StringManger.onpenBox).put(StringManger.lag, v!),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
