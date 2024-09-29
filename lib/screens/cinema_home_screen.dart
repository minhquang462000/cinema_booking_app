import 'package:cinematic_app/constan.dart';
import 'package:cinematic_app/models/category_model.dart';
import 'package:cinematic_app/widgets/Home/app_bar_home.dart';
import 'package:cinematic_app/widgets/Home/category_home.dart';
import 'package:cinematic_app/widgets/Home/slide_home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/movie_model.dart';

class CinemaHomeScreen extends StatefulWidget {
  const CinemaHomeScreen({super.key});

  @override
  State<CinemaHomeScreen> createState() => _CinemaHomeScreenState();
}

class _CinemaHomeScreenState extends State<CinemaHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBackgroundColor,
      appBar: homeAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            // For Search
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(20),
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.05),
                          hintText: "Search",
                          hintStyle: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                          prefixIcon: const Icon(
                            Icons.search,
                            size: 30,
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: BorderSide.none)),
                    ),
                    const SizedBox(height: 20),
                    CategoryHome(
                      categories: categories,
                    ),
                  ]),
            ),
            const SizedBox(height: 20),
            SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "Showing this month",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    SlideHome(
                      products: movies,
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
