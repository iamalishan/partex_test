import 'dart:convert';

import 'package:http/http.dart' as client;

class FirebaseNotificationClient {
  final String _host = "https://fcm.googleapis.com/fcm/send";
  final _serverKey =
      "AAAAGyMbPws:APA91bGyFPMwh6I18YiEfX2-rGfEMbGA8TvtAGjFHgdctB_qVVwfN4mit3A_4PhwENVIKSje-UOw3AcUgAWHSShYhZteVot_HNuWNsBeMWAcas7hWdnR47MWNkKYbkL33o8rI2fzay4p";
  void sendNotificationRequest({
    required String token,
    required String title,
    required String notificationBody,
  }) async {
    final header = {
      "Authorization": "key=$_serverKey",
      "Content-Type": "application/json; charset=UTF-8"
    };
    final body = {
      "to": token,
      "notification": {
        "title": title,
        "body": notificationBody,
        "priority": "high",
        "content-available": true
      },
      // "data": data
    };
    final response = await client.post(Uri.parse(_host),
        headers: header, body: jsonEncode(body));
    print(response);
  }
}
