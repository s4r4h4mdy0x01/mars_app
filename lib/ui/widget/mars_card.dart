import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mars_app/data/model/mar_photo_model.dart';
import 'package:mars_app/data/model/rover_model.dart';
import 'package:mars_app/generated/l10n.dart';
import 'package:mars_app/utils/resources/color_manger.dart';
import 'package:mars_app/utils/resources/size_manger.dart';

class MarsCard extends StatelessWidget {
  const MarsCard({
    super.key,
    required this.marsPhotos,
  });
  final MarsPhotoModel marsPhotos;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showCupertinoDialog(
          context: context,
          builder: (context) => CupertinoAlertDialog(
            title: Column(
              children: [
                Text(" Camera Name:  ${marsPhotos.camera.name} "),
                Text(" Camera Full Name:  ${marsPhotos.camera.fullName} "),
                Text("Earth Date :  ${marsPhotos.earthDate} "),
                Text(" Solar Day ${marsPhotos.sol}"),
              ],
            ),
            content: CachedNetworkImage(
              imageUrl: marsPhotos.imgSrc,
            ),
            actions: [
              CupertinoDialogAction(
                child: Text(S.of(context).close),
                onPressed: () => context.pop(),
              ),
            ],
          ),
        );
      },
      child: Card(
        elevation: 7,
        shape: Border.all(
            color: darkColorScheme.outline,
            width: AppSize.s4,
            style: BorderStyle.solid),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
         crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
            //  fadeInCurve: Curves.bounceOut,
            
              fit: BoxFit.fill,
              imageUrl: marsPhotos.imgSrc,
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ],
        ),
      ),
    );
  }
}
