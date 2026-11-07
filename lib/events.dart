import 'package:flutter/material.dart';
class EventsPage extends StatelessWidget {
  const EventsPage({super.key});
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Campus Events'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
        const Text('Upcoming Events', style: TextStyle(
          fontSize: 24, fontWeight: FontWeight.bold,
        ),
        ),
        const SizedBox(height: 16),
        eventCard(
          context,
          'Christmas Day',
          'December 25, 2026',
          Icons.star,
        ),
        eventCard(
          context,
          'New years day',
          'January 1, 2027',
          Icons.celebration,
        ),
        ],
      ),
    );
  }
  Widget eventCard(
    BuildContext context,
    String title,
    String date,
    IconData icon,
  ){
    return Card(
      margin: const EdgeInsets.only(bottom: 14),
      elevation: 3,
      child: ListTile(
        contentPadding: const EdgeInsets.all(12),
        leading: Icon(icon, size: 35, color: Colors.blue),
        title: Text(
          title, style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text('date'),
        trailing: const
        Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text(title),
              content: Text('Date: $date'),
              actions: [
                TextButton(onPressed: () => Navigator.pop(context), child: const Text('Close'),
                ),
              ],
            ),
          );
        }
      ),
    );
  }
}