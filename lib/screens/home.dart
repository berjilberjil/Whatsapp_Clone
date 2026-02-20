import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsin/screens/archived.dart';
import 'package:whatsin/screens/mychatscreen.dart';
import 'package:whatsin/styles/color.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, dynamic>> _chats = [
    {'name': 'Aarav', 'message': 'Let\'s meet at 7?', 'time': '09:42', 'unread': 2},
    {'name': 'Design Team', 'message': 'Shivam: Shared new mocks', 'time': '08:10', 'unread': 8},
    {'name': 'Mom', 'message': 'Call me when free', 'time': 'Yesterday', 'unread': 0},
    {'name': 'Flutter Devs', 'message': 'New package released!', 'time': 'Yesterday', 'unread': 4},
    {'name': 'Travel Buddies', 'message': 'Tickets booked ✅', 'time': 'Mon', 'unread': 0},
  ];

  String _query = '';

  @override
  Widget build(BuildContext context) {
    final filtered = _chats
        .where((c) => c['name'].toString().toLowerCase().contains(_query.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appBar,
        title: const Text('WhatsApp'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.camera_alt_outlined)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              onChanged: (value) => setState(() => _query = value),
              decoration: InputDecoration(
                hintText: 'Ask Meta AI or Search',
                filled: true,
                fillColor: AppColors.card,
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          ListTile(
            onTap: () => Get.to(const ArchivedChat()),
            leading: const Icon(Icons.archive_outlined),
            title: const Text('Archived'),
            trailing: const Text('2', style: TextStyle(color: AppColors.whatsappGreen)),
          ),
          const Divider(color: AppColors.divider, height: 1),
          Expanded(
            child: ListView.separated(
              itemCount: filtered.length,
              separatorBuilder: (_, __) => const Divider(color: AppColors.divider, indent: 72),
              itemBuilder: (context, index) {
                final chat = filtered[index];
                final unread = chat['unread'] as int;
                return ListTile(
                  onTap: () => Get.to(ChatDetailScreen(name: chat['name'].toString())),
                  leading: CircleAvatar(
                    backgroundColor: AppColors.whatsappDarkGreen,
                    child: Text(chat['name'].toString()[0]),
                  ),
                  title: Text(chat['name'].toString()),
                  subtitle: Text(chat['message'].toString(), style: const TextStyle(color: AppColors.textSecondary)),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(chat['time'].toString(), style: const TextStyle(fontSize: 12, color: AppColors.textSecondary)),
                      if (unread > 0)
                        Container(
                          margin: const EdgeInsets.only(top: 6),
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                          decoration: const BoxDecoration(
                            color: AppColors.whatsappGreen,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Text('$unread', style: const TextStyle(color: Colors.black, fontSize: 12)),
                        ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
