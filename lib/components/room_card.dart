import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
            border: Border.all(color: Colors.black12),
            borderRadius: const BorderRadius.all(Radius.circular(16.0)),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3))
            ]),
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 28),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Text(name), Text("$membersCount человек")],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [Text(status.toString()), Text("скоро начало")],
            )
          ],
        ));
  }
}
