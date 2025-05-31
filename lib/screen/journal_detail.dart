import 'package:flutter/material.dart';

class JournalDetailScreen extends StatefulWidget {
  final String? initialText;
  final String? initialMood;
  final String? date;
  final Function(String text, String mood) onSave;
  final VoidCallback? onDelete; // opsional

  JournalDetailScreen({
    this.initialText,
    this.initialMood,
    this.date,
    required this.onSave,
    this.onDelete,
  });

  @override
  _JournalDetailScreenState createState() => _JournalDetailScreenState();
}

class _JournalDetailScreenState extends State<JournalDetailScreen> {
  late TextEditingController _controller;
  String _selectedMood = '';

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialText ?? '');
    _selectedMood = widget.initialMood ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF2EC),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(widget.date ?? 'Today', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('How was your day today?', style: TextStyle(fontSize: 16)),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: ['😞', '😐', '🙂', '😊', '🤩'].map((mood) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedMood = mood;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _selectedMood == mood ? Colors.pink.shade100 : Colors.transparent,
                    ),
                    child: Text(mood, style: TextStyle(fontSize: 24)),
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            Expanded(
              child: TextField(
                controller: _controller,
                maxLines: null,
                expands: true,
                keyboardType: TextInputType.multiline,
                textAlignVertical: TextAlignVertical.top,  // ini yang penting
  decoration: InputDecoration(
    border: OutlineInputBorder(),
    hintText: 'Write something...',
    filled: true,
    fillColor: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                if (widget.onDelete != null)
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        widget.onDelete!();
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.delete),
                      label: Text("Delete"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent,
                      ),
                    ),
                  ),
                if (widget.onDelete != null) SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      widget.onSave(_controller.text, _selectedMood);
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.save),
                    label: Text("Save"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
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
