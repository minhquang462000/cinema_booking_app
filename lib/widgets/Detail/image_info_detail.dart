import 'package:cinematic_app/models/movie_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constan.dart';
import 'movie_info.dart';

class ImageInfoDetail extends StatelessWidget {
  final Size size;
  final Movie product;

  const ImageInfoDetail({super.key, required this.size, required this.product});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height * 2 / 5,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Hero(
            tag: product.poster,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Image.network(
                height: size.height * 2 / 5,
                width: size.width * 3 / 5,
                fit: BoxFit.cover,
                product.poster,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MovieInfo(
                  icon: Icons.videocam_rounded,
                  name: "Genre",
                  value: product.genre),
              MovieInfo(
                  icon: Icons.timer,
                  name: "Duration",
                  value: formatTime(
                    Duration(minutes: product.duration),
                  )),
              MovieInfo(
                icon: Icons.star_rounded,
                name: "Rating",
                value: "${product.rating}/10",
              )
            ],
          )
        ],
      ),
    );
  }
}
