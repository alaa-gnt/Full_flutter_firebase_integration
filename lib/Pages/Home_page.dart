import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../Reusible_compenents/Note_container.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<NoteContainer> tasks = [
    NoteContainer(
      title: 'Grocery Shopping',
      content: 'Buy milk, eggs, and bread from the store.',
      date: '2024-10-01',
      color: Colors.lightBlueAccent,
    ),
    NoteContainer(
      title: 'Workout',
      content: 'Go for a 30-minute run in the park.',
      date: '2024-10-02',
      color: Colors.greenAccent,
    ),
    NoteContainer(
      title: 'Meeting with Bob',
      content: 'Discuss the new project proposal at 3 PM.',
      date: '2024-10-03',
      color: Colors.orangeAccent,
    ),
    NoteContainer(
      title: 'Read a Book',
      content: 'Finish reading "The Great Gatsby".',
      date: '2024-10-04',
      color: Colors.purpleAccent,
    ),
    NoteContainer(
      title: 'Call Mom',
      content: 'Catch up with mom over the weekend.',
      date: '2024-10-05',
      color: Colors.pinkAccent,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'My Tasks',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          final note = tasks[index];
          return Align(
            alignment: Alignment.centerLeft,
            child: SizedBox(
              width: 330,
              height: 200,
              child: NoteContainer(
                title: note.title,
                content: note.content,
                date: note.date,
                color: note.color,
              ),
            ),
          );
        },
      ),
    );
  }
}
