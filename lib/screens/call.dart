import 'package:flutter/material.dart';
import 'package:whatsin/styles/color.dart';

class CallScreen extends StatelessWidget {
  const CallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final recents = [
      {'name': 'Aarav', 'time': 'Today, 10:23', 'video': false},
      {'name': 'Mom', 'time': 'Today, 08:15', 'video': true},
      {'name': 'Design Team', 'time': 'Yesterday, 20:45', 'video': true},
      {'name': 'Aditi', 'time': 'Yesterday, 14:10', 'video': false},
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appBar,
        title: const Text('Calls'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
        ],
      ),
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text('Favorites', style: TextStyle(color: AppColors.textSecondary)),
          ),
          const ListTile(
            leading: CircleAvatar(backgroundColor: AppColors.whatsappDarkGreen, child: Icon(Icons.favorite)),
            title: Text('Add favorite'),
          ),
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text('Recent', style: TextStyle(color: AppColors.textSecondary)),
          ),
          ...recents.map(
            (call) => ListTile(
              leading: CircleAvatar(backgroundColor: AppColors.card, child: Text(call['name'].toString()[0])),
              title: Text(call['name'].toString()),
              subtitle: Text(call['time'].toString(), style: const TextStyle(color: AppColors.textSecondary)),
              trailing: Icon(call['video'] == true ? Icons.videocam : Icons.call, color: AppColors.whatsappGreen),
            ),
          ),
        ],
      ),
    );
  }
}
