import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Telegram',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Color(0xFF1A2634), // Telegram'ın koyu arka plan rengi
      ),
      home: ChatListScreen(),
    );
  }
}

class ChatListScreen extends StatelessWidget {
  // Örnek sohbet verileri
  final List<Chat> chats = [
    Chat(
      name: 'Arşivlenmiş Sohbetler',
      message: 'ARŞİV',
      date: '',
      unreadCount: 65,
      icon: Icons.archive,
      isPinned: true,
    ),
    Chat(
      name: 'TELEGRAM ',
      message: 'Telegrama hoşgeldin.',
      date: '23 Sub',
      unreadCount: 10,
      icon: Icons.telegram,
      color: Colors.blue,
    ),
    Chat(
      name: 'Veli Üni',
      message: 'Veli Üni Telegram’a katıldı!',
      date: '05 Eki',
      unreadCount: 10,
      color: Colors.red,
    ),
    Chat(
      name: 'Medineeeee',
      message: 'Medineeeee Telegram’a katıldı!',
      date: '01 Eki',
      unreadCount: 10,
    ),
    Chat(
      name: 'Melisa Mertcan',
      message: 'Melisa Mertcan Telegram’a katıldı!',
      date: '11 Eyl',
      unreadCount: 10,
      color: Colors.pinkAccent,
    ),
    Chat(
      name: 'Kartal',
      message: 'Kartal Telegram’a katıldı!',
      date: '31 Ağu',
      unreadCount: 10,
      color: Colors.purple,
    ),
    Chat(
      name: 'Kadir Memiş Üni Bolu',
      message: 'Aga',
      date: '29 Ağu',
      unreadCount: 10,

      color: Colors.blue,
    ),
    Chat(
      name: 'Ahmet Üni Çorum',
      message: 'Ahmet Üni Çorum Telegram’a katıldı!',
      date: '29 Ağu',
      unreadCount: 0,
      color: Colors.green,
    ),
    Chat(
      name: 'Emirhan Üni',
      message: '',
      date: '20 Ağu',
      unreadCount: 0,
      color: Colors.blue,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF1A2634),
        title: Text(
          'Telegram',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.white),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (context, index) {
          final chat = chats[index];
          return ChatItem(chat: chat);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.blue,
        child: Icon(Icons.camera_alt),
      ),
    );
  }
}

class Chat {
  final String name;
  final String message;
  final String date;
  final int unreadCount;
  final Color? color;
  final String? imageUrl;
  final IconData? icon;
  final bool isPinned;

  Chat({
    required this.name,
    required this.message,
    required this.date,
    required this.unreadCount,
    this.color,
    this.imageUrl,
    this.icon,
    this.isPinned = false,
  });
}

class ChatItem extends StatelessWidget {
  final Chat chat;

  const ChatItem({required this.chat});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 25,
        backgroundColor: chat.color ?? Colors.grey,
        backgroundImage: chat.imageUrl != null ? NetworkImage(chat.imageUrl!) : null,
        child: chat.icon != null
            ? Icon(chat.icon, color: Colors.white)
            : chat.imageUrl == null
                ? Text(
                    chat.name[0],
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )
                : null,
      ),
      title: Text(
        chat.name,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        chat.message,
        style: TextStyle(color: Colors.grey),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            chat.date,
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
          if (chat.unreadCount > 0)
            Container(
              margin: EdgeInsets.only(top: 6),
              padding: EdgeInsets.all(3),
              decoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
              child: Text(
                chat.unreadCount.toString(),
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
        ],
      ),
      onTap: () {
        // Sohbete tıklanınca yapılacak işlem
      },
    );
  }
}