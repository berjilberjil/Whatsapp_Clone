import 'package:flutter/material.dart';
import 'package:whatsin/styles/color.dart';

class UpdatesScreen extends StatelessWidget {
  const UpdatesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final channels = ['Flutter Daily', 'Cricket Zone', 'Tech Radar', 'Startup India'];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appBar,
        title: const Text('Updates'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
        ],
      ),
      body: ListView(
        children: [
          const ListTile(
            title: Text('Status'),
            subtitle: Text('Tap to add status update', style: TextStyle(color: AppColors.textSecondary)),
            leading: CircleAvatar(backgroundColor: AppColors.whatsappDarkGreen, child: Icon(Icons.add)),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 8, 16, 4),
            child: Text('Channels', style: TextStyle(color: AppColors.textSecondary)),
          ),
          ...channels.map(
            (name) => ListTile(
              leading: CircleAvatar(backgroundColor: AppColors.card, child: Text(name[0])),
              title: Text(name),
              subtitle: const Text('New updates available', style: TextStyle(color: AppColors.textSecondary)),
              trailing: const Icon(Icons.chevron_right),
            ),
          ),
        ],
      ),
    );
  }
}
