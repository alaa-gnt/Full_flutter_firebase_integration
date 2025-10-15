import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../Reusible_compenents/Note_container.dart';
import './Selection_page.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<Map<String, dynamic>> tasks = [
    {
      'title': 'Grocery Shopping',
      'content': 'Buy milk, eggs, and bread from the store.',
      'date': '2024-10-01',
      'color': Colors.lightBlueAccent,
    },
    {
      'title': 'Workout',
      'content': 'Go for a 30-minute run in the park.',
      'date': '2024-10-02',
      'color': Colors.greenAccent,
    },
    {
      'title': 'Meeting with Bob',
      'content': 'Discuss the new project proposal at 3 PM.',
      'date': '2024-10-03',
      'color': Colors.orangeAccent,
    },
    {
      'title': 'Read a Book',
      'content': 'Finish reading "The Great Gatsby".',
      'date': '2024-10-04',
      'color': Colors.purpleAccent,
    },
    {
      'title': 'Call Mom',
      'content': 'Catch up with mom over the weekend.',
      'date': '2024-10-05',
      'color': Colors.pinkAccent,
    },
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
      body: CustomScrollView(
        slivers: [
          //  Your header (non-scrollable part)
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      'Welcome Back!',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/SelectionPage');
                    },
                    child: Icon(Icons.add, size: 42),
                  ),
                ],
              ),
            ),
          ),

          // 🧾 Your list
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              final note = tasks[index];
              return Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: 330,
                  height: 200,
                  child: NoteContainer(
                    title: note['title'],
                    content: note['content'],
                    date: note['date'],
                    color: note['color'],
                  ),
                ),
              );
            }, childCount: tasks.length),
          ),
        ],
      ),
    );
  }
}
