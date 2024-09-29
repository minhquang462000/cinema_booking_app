import 'dart:math';
import 'package:cinematic_app/screens/movie_detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../constan.dart';
import '../../models/movie_model.dart';

class SlideHome extends StatefulWidget {
  final List<Movie> products;

  const SlideHome({super.key, required this.products});

  @override
  State<SlideHome> createState() => _SlideHomeState();
}

class _SlideHomeState extends State<SlideHome> {
  late PageController controller;
  double pageOffSet = 1;
  int currentIndex = 1;

  @override
  void initState() {
    super.initState();
    controller = PageController(initialPage: 1, viewportFraction: 0.6)
      ..addListener(() {
        setState(() {
          pageOffSet = controller.page!;
        });
      });
  }

  void despose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        alignment: Alignment.center,
        children: [
          PageView.builder(
            controller: controller,
            onPageChanged: (index) {
              setState(() {
                currentIndex = index % widget.products.length;
              });
            },
            itemBuilder: (context, index) {
              double scale = max(
                0.6,
                (1 - (pageOffSet - index).abs() + 0.6),
              );
              double angle = (controller.position.haveDimensions
                      ? index.toDouble() - (controller.page ?? 0)
                      : index.toDouble() - 1) *
                  5;
              angle = angle.clamp(-5, 5);
              final movie = widget.products[index % widget.products.length];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          MovieDetailScreen(product: widget.products[index]),
                    ),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 100 - (scale / 1.6 * 100),
                  ),
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Transform.rotate(
                        angle: angle * pi / 90,
                        child: Hero(
                          tag: movie.poster,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(25),
                            child: ColorFiltered(
                              colorFilter: ColorFilter.mode(
                                  Colors.blue.withOpacity(currentIndex !=
                                          index % widget.products.length
                                      ? 0.2
                                      : 0),
                                  BlendMode.multiply),
                              child: Image.network(
                                movie.poster,
                                height: 300,
                                width: 205,
                                fit: BoxFit.cover,
                                opacity: currentIndex !=
                                        index % widget.products.length
                                    ? const AlwaysStoppedAnimation(0.4)
                                    : null,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
          Positioned(
              top: 330,
              child: Row(
                children: List.generate(
                  widget.products.length,
                  (index) => AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.only(right: 15),
                    width: currentIndex == index ? 30 : 10,
                    height: 10,
                    decoration: BoxDecoration(
                      color:
                          currentIndex == index ? buttonColor : Colors.white24,
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
