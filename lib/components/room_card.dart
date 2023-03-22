import 'package:flutter/material.dart';

String calculateMembersCountLabel(int count) {
  if (count % 10 == 1 && count % 100 != 11) {
    return "человек";
  } else if (count % 10 >= 2 &&
      count % 10 <= 4 &&
      (count % 100 < 10 || count % 100 >= 20)) {
    return "человека";
  } else {
    return "человек";
  }
}

enum RoomStatus {
  waitingForPlayers(name: "Ожидаем игроков", color: Colors.yellow),
  awaitingForAccept(name: "Ожидаем подтверждения", color: Colors.red),
  started(name: "Игра началась", color: Colors.green);

  const RoomStatus({
    required this.name,
    required this.color,
  });

  final String name;
  final Color color;
}

class RoomCard extends StatelessWidget {
  const RoomCard({
    super.key,
    required this.name,
    required this.membersCount,
    required this.status,
  });

  final String name;
  final int membersCount;
  final RoomStatus status;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "$membersCount ${calculateMembersCountLabel(membersCount)}",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  status.name,
                  style: TextStyle(
                    color: status.color,
                    fontSize: 16,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
