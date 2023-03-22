import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:secret_santa_flutter/components/bottom_navigation.dart';
import 'package:secret_santa_flutter/components/room_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Тайный дед мороз',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Тайный дед мороз'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selected = 0;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Container(
          color: Colors.white,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 70,
                  child: Container(
                    alignment: Alignment.center,
                    child: const Text(
                      "Список комнат",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: ListView.builder(
                      itemCount: 2,
                      itemBuilder: (context, idx) {
                        return Container(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: const RoomCard(
                              name: "aboba",
                              membersCount: 3,
                              status: RoomStatus.awaitingForAccept),
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 100,
                  child: BottomNavigation(
                    onSelect: (int selected) {
                      setState(() => this.selected = selected);
                      log("Selected: $selected");
                    },
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
