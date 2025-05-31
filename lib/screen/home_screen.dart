import 'package:flutter/material.dart';
import 'package:my_note/screen/journal_detail.dart';
import '../widgets/journal_entry_card.dart';
import '../widgets/custom_bottom_navbar.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  String _searchQuery = '';

  final List<Map<String, String>> entries = [
    {
      'date': 'Mon, 03 Mar 2024',
      'text': 'I feel inspired before starting a new journey',
      'mood': '😊',
    },
    {
      'date': 'Mon, 26 Dec 2022',
      'text': 'I am allowed to ask for what I want and what I need',
      'mood': '😊',
    },
    {
      'date': 'Tue, 12 Apr 2024',
      'text': 'Had a productive day at work, feeling accomplished!',
      'mood': '😄',
    },
    {
      'date': 'Wed, 13 Apr 2024',
      'text': 'Sometimes it’s okay to just relax and breathe.',
      'mood': '😌',
    },
    {
      'date': 'Thu, 14 Apr 2024',
      'text': 'I struggled a bit today, but I kept going.',
      'mood': '😞',
    },
    {
      'date': 'Fri, 15 Apr 2024',
      'text': 'Had a great time with friends',
      'mood': '😍',
    },
    {
      'date': 'Sat, 16 Apr 2024',
      'text': 'Trying new things today.',
      'mood': '🙂',
    },
    {
      'date': 'Sun, 17 Apr 2024',
      'text': 'Feeling grateful for all the small joys in life.',
      'mood': '😊',
    },
    {
      'date': 'Mon, 18 Apr 2024',
      'text': 'Focusing on self-care and mental health today.',
      'mood': '🧘‍♂️',
    },
  ];

  Widget _buildBody() {
    switch (_selectedIndex) {
      case 0:
        final filteredEntries = entries
            .where((entry) => entry['text']!
                .toLowerCase()
                .contains(_searchQuery.toLowerCase()))
            .toList();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'My Note',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search journal...',
                  prefixIcon: Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: EdgeInsets.symmetric(vertical: 0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    _searchQuery = value;
                  });
                },
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: filteredEntries.isEmpty
                  ? Center(
                      child: Text(
                        'No entries found.',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    )
                  : GridView.builder(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 12,
                        childAspectRatio: 0.9,
                      ),
                      itemCount: filteredEntries.length,
                      itemBuilder: (ctx, index) {
                        final entry = filteredEntries[index];
                        return JournalEntryCard(
                          text: entry['text']!,
                          date: entry['date']!,
                          mood: entry['mood'],
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => JournalDetailScreen(
                                  initialText: entry['text'],
                                  initialMood: entry['mood'],
                                  date: entry['date'],
                                  onSave: (newText, newMood) {
                                    setState(() {
                                      entry['text'] = newText;
                                      entry['mood'] = newMood;
                                    });
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text('Data berhasil diedit')),
                                    );
                                  },
                                ),
                              ),
                            );
                          },
                          onEdit: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => JournalDetailScreen(
                                  initialText: entry['text'],
                                  initialMood: entry['mood'],
                                  date: entry['date'],
                                  onSave: (newText, newMood) {
                                    setState(() {
                                      entry['text'] = newText;
                                      entry['mood'] = newMood;
                                    });
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text('Data berhasil diedit')),
                                    );
                                  },
                                ),
                              ),
                            );
                          },
                          onDelete: () {
                            showDialog(
                              context: context,
                              builder: (ctx) => AlertDialog(
                                title: Text('Delete Entry'),
                                content: Text('Are you sure you want to delete this entry?'),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.of(ctx).pop(),
                                    child: Text('Cancel'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      setState(() {
                                        entries.remove(entry);
                                      });
                                      Navigator.of(ctx).pop();
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(content: Text('Data berhasil dihapus')),
                                      );
                                    },
                                    child: Text('Delete', style: TextStyle(color: Colors.red)),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                    ),
            ),
          ],
        );

      case 1:
        return Center(
          child: Text(
            'Belum ada',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        );

      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF2EC),
      body: SafeArea(child: _buildBody()),
      bottomNavigationBar: CustomBottomNavbar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      floatingActionButton: _selectedIndex == 0
          ? FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => JournalDetailScreen(
                      date: 'Today',
                      onSave: (newText, newMood) {
                        setState(() {
                          entries.insert(0, {
                            'date': 'Today',
                            'text': newText,
                            'mood': newMood,
                          });
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Data berhasil disimpan')),
                        );
                      },
                    ),
                  ),
                );
              },
              child: Icon(Icons.add),
              backgroundColor: Colors.pinkAccent,
            )
          : null,
    );
  }
}
