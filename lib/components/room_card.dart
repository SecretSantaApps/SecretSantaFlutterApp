import 'package:flutter/material.dart';

enum RoomStatus { waitingForPlayers, awaitingForAccept, started }

class RoomCard extends StatelessWidget {
  const RoomCard(
      {super.key,
      required this.name,
      required this.membersCount,
      required this.status});

  final String name;
  final int membersCount;
  final RoomStatus status;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade400),
            borderRadius: const BorderRadius.all(Radius.circular(16.0)),
            // ignore: prefer_const_literals_to_create_immutables
            boxShadow: [
              const BoxShadow(
                  color: Colors.grey,
                  spreadRadius: 3,
                  blurRadius: 7,
                  offset: Offset(0, 7))
            ],
            color: Colors.white),
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 28),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name),
                const SizedBox(height: 10),
                Text("$membersCount человек"),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(status.name),
                const SizedBox(height: 10),
                const Text("скоро начало")
              ],
            )
          ],
        ));
  }
}
