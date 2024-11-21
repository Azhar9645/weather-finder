import 'package:bw_machine_task2/generated/l10n.dart';
import 'package:flutter/material.dart';

class DisplayHeader extends StatelessWidget {
  final String currentTime;
  final Function(Locale) onLanguageChange;

  const DisplayHeader({
    super.key,
    required this.currentTime,
    required this.onLanguageChange,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: const Icon(Icons.home, color: Colors.white, size: 35),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        Center(
          child: Text(
            currentTime,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
        PopupMenuButton<String>(
          onSelected: (String value) {
            Locale newLocale =
                value == 'English' ? const Locale('en') : const Locale('ar');
            onLanguageChange(newLocale);
          },
          itemBuilder: (BuildContext context) {
            return [
              PopupMenuItem<String>(
                value: 'English',
                child: Text(S.of(context).english()),
              ),
              PopupMenuItem<String>(
                value: 'Arabic',
                child: Text(S.of(context).arabic()),
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
