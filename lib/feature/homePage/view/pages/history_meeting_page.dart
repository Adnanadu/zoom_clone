import 'package:flutter/material.dart';
import 'package:zoom_clone/core/services/firestore_services.dart';
import 'package:intl/intl.dart';

class HistoryMeetingPage extends StatelessWidget {
  const HistoryMeetingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirestoreServices().meetingHistory,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (!snapshot.hasData || (snapshot.data! as dynamic).docs.isEmpty) {
          return Center(
            child: Text('No meeting history available'),
          );
        }
        return ListView.builder(
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                  "roomName: ${(snapshot.data! as dynamic).docs[index]['meetingName']}"),
              subtitle: Text(
                'Joined on ${DateFormat.yMMMd().format((snapshot.data! as dynamic).docs[index]['createdAt'].toDate())}',
              ),
            );
          },
          itemCount: (snapshot.data! as dynamic).docs.length,
        );
      },
    );
  }
}
