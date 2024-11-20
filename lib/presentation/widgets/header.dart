// header.dart

import 'package:flutter/material.dart';
import 'package:bw_machine_task2/utils/constants.dart';

class Header extends StatelessWidget {
  final String currentTime;
  final VoidCallback onHomePressed;

  const Header({
    super.key,
    required this.currentTime,
    required this.onHomePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: const Icon(
            Icons.home,
            color: Colors.white,
            size: 35,
          ),
          onPressed: onHomePressed,
        ),
        Center(
          child: Text(currentTime, style: q20W),
        ),
        PopupMenuButton<String>(
          onSelected: (String value) {
            print('Selected Language: $value');
          },
          itemBuilder: (BuildContext context) {
            return [
              const PopupMenuItem<String>(
                value: 'English',
                child: Text('English'),
              ),
              const PopupMenuItem<String>(
                value: 'Arabic',
                child: Text('Arabic'),
              ),
            ];
          },
          icon: const Icon(
            Icons.language,
            color: Colors.white,
            size: 35,
          ),
        ),
      ],
    );
  }
}
