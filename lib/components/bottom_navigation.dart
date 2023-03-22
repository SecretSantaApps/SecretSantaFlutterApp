import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key, required this.onSelect}) : super(key: key);

  final Function(int) onSelect;

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int selected = 1;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          onPressed: () {
            setState(() {
              selected = 1;
              widget.onSelect(1);
            });
          },
          icon: SvgPicture.asset(
            'assets/globe.svg',
            color: selected == 1 ? Colors.pink : const Color(0xFF292929),
          ),
        ),
        IconButton(
          iconSize: 65,
          padding: const EdgeInsets.only(bottom: 20),
          onPressed: () {
            setState(() {
              selected = 2;
              widget.onSelect(2);
            });
          },
          icon: SvgPicture.asset(
            'assets/plus.svg',
          ),
        ),
        IconButton(
          onPressed: () {
            setState(() {
              selected = 3;
              widget.onSelect(3);
            });
          },
          icon: SvgPicture.asset(
            'assets/profile.svg',
            color: selected == 3 ? Colors.pink : const Color(0xFF292929),
          ),
        ),
      ],
    );
  }
}
