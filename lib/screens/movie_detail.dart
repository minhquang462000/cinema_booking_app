import 'package:cinematic_app/constan.dart';
import 'package:cinematic_app/models/movie_model.dart';
import 'package:cinematic_app/screens/reservation_screen.dart';
import 'package:cinematic_app/widgets/Detail/float_action_button.dart';
import 'package:cinematic_app/widgets/Detail/image_info_detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/Detail/movie_info.dart';

class MovieDetailScreen extends StatefulWidget {
  final Movie product;

  const MovieDetailScreen({super.key, required this.product});

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: appBackgroundColor,
        appBar: AppBar(
          forceMaterialTransparency: true,
          backgroundColor: Colors.transparent,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white,
                size: 16,
              )),
          title: const Text(
            "Movie Detail",
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                ImageInfoDetail(
                  size: size,
                  product: widget.product,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    widget.product.title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Colors.white),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Divider(
                      color: Colors.white.withOpacity(0.1),
                    )),
                const Text(
                  "Synopsis",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  widget.product.synopsis,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.white60,
                    fontWeight: FontWeight.w600,
                    height: 2,
                  ),
                ),
                const SizedBox(
                  height: 100,
                )
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatActionButton(changePage: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const ReservationScreen(),
            ),
          );
        }));
  }
}
