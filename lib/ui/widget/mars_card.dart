import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mars_app/data/model/mar_photo_model.dart';

class MarsCard extends StatelessWidget {
  const MarsCard({super.key, required this.marsPhotos});
  final MarsPhotoModel marsPhotos;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          CachedNetworkImage(
            imageUrl: marsPhotos.imgSrc,
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
          Text("${marsPhotos.sol}"),
        ],
      ),
    );
  }
}
