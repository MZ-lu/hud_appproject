import 'package:flutter/material.dart';
import 'package:hud_appproject/screens/merchadising_screen.dart';
import 'package:hud_appproject/screens/newest_screen.dart';
import 'package:hud_appproject/screens/popularity_screen.dart';
import 'package:hud_appproject/screens/enddate_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white30,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Home',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.2,
          ),
        ),
        leading: const Icon(Icons.menu, color: Colors.black),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: Icon(Icons.shopping_bag, color: Colors.black),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                childAspectRatio: 2.9 / 1,
                crossAxisSpacing: 10,
                mainAxisSpacing: 14,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  gridviewItem(
                    const Color.fromRGBO(0, 36, 255, 1),
                    Icons.rocket,
                    "Popularity",
                    context,
                  ),
                  gridviewItem(
                    const Color.fromRGBO(132, 92, 238, 1),
                    Icons.calendar_today,
                    "End Date",
                    context,
                  ),
                  gridviewItem(
                    const Color.fromRGBO(255, 75, 88, 1),
                    Icons.video_collection,
                    "Newest",
                    context,
                  ),
                  gridviewItem(
                    const Color(0xFFFFBA00),
                    Icons.shopping_cart_checkout_sharp,
                    "Merchandising",
                    context,
                  ),
                ],
              ),
              const SizedBox(height: 35),
              Container(
                alignment: Alignment.topLeft,
                child: const Text(
                  'Recommended',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(height: 28),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 2,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: const Image(
                                fit: BoxFit.cover,
                                image: AssetImage("assets/hub/i.webp"),
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 18, top: 24),
                            child: const Text(
                              "Astana Hub",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 28,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 36),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: const [
                              Text(
                                "5241",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(height: 6),
                              Text(
                                "MEMBERS",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 0.2,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: const [
                              Text(
                                "32",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(height: 6),
                              Text(
                                "HACKATHON",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 0.2,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: const [
                              Text(
                                "65",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(height: 6),
                              Text(
                                "GOAL",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 0.2,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          disabledActiveTrackColor: const Color.fromRGBO(
                            255,
                            70,
                            87,
                            1,
                          ),
                          trackHeight: 4,
                          thumbColor: Colors.transparent,
                          thumbShape: const RoundSliderThumbShape(
                            enabledThumbRadius: 0,
                          ),
                        ),
                        child: Slider.adaptive(
                          value: 90,
                          min: 0,
                          max: 100,
                          onChanged: null,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget gridviewItem(
    Color color,
    IconData icon,
    String text,
    BuildContext context,
  ) {
    return InkWell(
      onTap: () {
        if (text == "Popularity") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const PopularityScreen()),
          );
        } else if (text == "Newest") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const NewestScreen()),
          );
        } else if (text == "End Date") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const EndDateScreen()),
          );
        } else if (text == "Merchadising") {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const MerchandisingScreen(),
            ),
          );
        }
      },
      borderRadius: BorderRadius.circular(36),
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(36),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white, size: 30),
            const SizedBox(width: 4),
            Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
