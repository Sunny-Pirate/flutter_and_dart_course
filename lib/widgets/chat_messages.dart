import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatMessages extends StatelessWidget {
  const ChatMessages({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('chat')
          .orderBy('createdAt', descending: false)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (!snapshot.hasData || snapshot.data!.docs.isEmpty)
          return Center(child: Text('No message found.'));

        if (snapshot.hasError) {
          return Center(child: Text('Something went wrong.'));
        }

        final loadedMessages = snapshot.data!.docs;

        return ListView.builder(
          itemBuilder: (context, index) {
            return Text(loadedMessages[index].data()['text']);
          },
          itemCount: loadedMessages.length,
        );
      },
    );
  }
}
