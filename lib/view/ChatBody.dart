import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChatBody extends StatefulWidget {
  const ChatBody({super.key});

  @override
  ChatBodyState createState() => ChatBodyState();
}

class ChatBodyState extends State<ChatBody> {
  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
      .collection('Messages')
      .orderBy('createAt', descending: true)
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _usersStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading");
        }

        return ListView(
          children: snapshot.data!.docs
              .map((DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data()! as Map<String, dynamic>;
                return Card(
                  shadowColor: Colors.white54,
                  margin: const EdgeInsets.all(1.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(children: [
                        Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: Text(
                              data['nickName'],
                              style: TextStyle(fontSize: 15),
                            )),
                        Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: Text(data['name'])),
                        Padding(
                            padding: const EdgeInsets.only(right: 0.0),
                            child: Text(DateFormat('yyyy/MM/dd kk:mm:ss')
                                .format(data['createAt'].toDate())
                                .toString())),
                      ]),
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: Text(data['message'], textAlign: TextAlign.left),
                      )
                    ],
                  ),
                );
                // ListTile(
                //   title: SelectableText(data['nickName']),
                //   subtitle: SelectableText(data['message']),
                // );
              })
              .toList()
              .cast(),
        );
      },
    );
  }
}
