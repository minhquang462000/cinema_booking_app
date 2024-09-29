import 'package:cinematic_app/constan.dart';
import 'package:cinematic_app/screens/cinema_home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  List<IconData> bottomIcons = [
    Icons.home_filled,
    CupertinoIcons.compass_fill,
    CupertinoIcons.ticket_fill,
    Icons.person_rounded
  ];
  int currentIndex = 0;
  late final List<Widget> page;

  @override
  void initState() {
    page = [
      const CinemaHomeScreen(),
      navBarPage(CupertinoIcons.compass_fill),
      navBarPage(CupertinoIcons.ticket_fill),
      navBarPage(Icons.person_rounded),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: List.generate(
              bottomIcons.length,
              (index) => GestureDetector(
                    onTap: () {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                    child: Stack(
                      children: [
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          height: currentIndex == index ? 25 : 0,
                          width: currentIndex == index ? 25 : 0,
                          decoration:
                              BoxDecoration(shape: BoxShape.circle, boxShadow: [
                            BoxShadow(
                                color: Colors.white.withOpacity(0.1),
                                spreadRadius: currentIndex == index ? 10 : 0,
                                blurRadius: currentIndex == index ? 15 : 0),
                          ]),
                        ),
                        Icon(
                          bottomIcons[index],
                          color: currentIndex == index
                              ? Colors.white
                              : Colors.white.withOpacity(0.3),
                        ),
                      ],
                    ),
                  )),
        ),
      ),
      backgroundColor: appBackgroundColor,
      body: page[currentIndex],
    );
  }

  navBarPage(iconName) {
    return Center(
      child: Icon(
        iconName,
        size: 100,
        color: Colors.white,
      ),
    );
  }
}
