import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  String senderID;
  String senderEmail;
  String receiverID;
  String message;
  final Timestamp timestamp;

  Message({
    required this.senderID,
    required this.senderEmail,
    required this.receiverID,
    required this.message,
    required this.timestamp
});

  // convert to a map
  Map<String, dynamic> toMap() {
    return {
      'senderID': senderID,
      'senderEmail': receiverID,
      'receiverID': receiverID,
      'message': message,
      'timestamp': timestamp
    };
  }

}
