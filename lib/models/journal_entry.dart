import 'package:flutter/material.dart';

class JournalEntryCard extends StatelessWidget {
  final String text;
  final String date;
  final VoidCallback? onTap;

  const JournalEntryCard({
    required this.text,
    required this.date,
    this.onTap,
  });

  @override
  Widget build(BuildContext context)
   {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(date, style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              Text(text),
            ],
          ),
        ),
      ),
    );
  }
}
