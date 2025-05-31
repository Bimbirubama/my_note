import 'package:flutter/material.dart';

class MoodSelector extends StatelessWidget {
  final Function(String) onSelect;

  MoodSelector({required this.onSelect});

  @override
  Widget build(BuildContext context) {
    final moods = ['😞', '😐', '🙂', '😊', '🤩'];
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: moods
          .map((mood) => IconButton(
                onPressed: () => onSelect(mood),
                icon: Text(mood, style: TextStyle(fontSize: 28)),
              ))
          .toList(),
    );
  }
}
