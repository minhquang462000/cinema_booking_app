import 'package:cinematic_app/constan.dart';
import 'package:cinematic_app/models/category_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryHome extends StatefulWidget {
  final List<Category> categories;

  const CategoryHome({super.key, required this.categories});

  @override
  State<CategoryHome> createState() => _CategoryHomeState();
}

class _CategoryHomeState extends State<CategoryHome> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Category",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: 20),
            ),
            TextButton(
                onPressed: () {},
                child: const Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "See All",
                      style: TextStyle(
                          color: buttonColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 14,
                      color: buttonColor,
                    )
                  ],
                ))
          ],
        ),
        const SizedBox(height: 10),
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
                widget.categories.length,
                (index) => Column(
                      children: [
                        Stack(children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.05),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            padding: const EdgeInsets.all(15),
                            child: Image.asset(
                              widget.categories[index].emoji,
                              fit: BoxFit.cover,
                              height: 30,
                              width: 30,
                            ),
                          ),
                          Positioned(
                              bottom: 15,
                              right: 20,
                              child: Container(
                                width: 10,
                                height: 10,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 10,
                                        spreadRadius: 10,
                                        color: Colors.orange.withOpacity(0.2),
                                      ),
                                    ]),
                              ))
                        ]),
                        const SizedBox(height: 10),
                        Text(
                          widget.categories[index].name,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.white54),
                        )
                      ],
                    )))
      ],
    );
  }
}
