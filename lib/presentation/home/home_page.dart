import 'package:flutter/material.dart';
import 'package:flutter_iot_ui/presentation/home/widgets/device_gridview.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 249, 177, 173),
              Colors.white,
              Colors.white,
            ]
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
          child: SafeArea(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Hi, Dika",
                        style: TextStyle(
                          fontSize: 28,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      CircleAvatar(
                        minRadius: 32,
                        backgroundImage: AssetImage("assets/images/user.png"),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: Container(
                    width: size.width,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30.0),
                        topLeft: Radius.circular(30.0),
                      ),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "A total of 4 devices",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  Text(
                                    "Living Room",
                                    style: TextStyle(
                                      height: 1.1,
                                      fontSize: 17,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              Icon(
                                Icons.more_horiz,
                                color: Colors.grey[300],
                                size: 30,
                              ),
                            ],
                          ),
                          const SizedBox(height: 15),
                          const DeviceGridView(),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}