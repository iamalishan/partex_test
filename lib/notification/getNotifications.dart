import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:partex_test/notification/notificationService.dart';

class GetNotification {
  
  static void notificationForTerminatedApp() {
    FirebaseMessaging.instance.getInitialMessage().then(
      (message) {
        print("FirebaseMessaging.instance.getInitialMessage");
        if (message != null) {
          print("New Notification");
          if (message.notification!.body!.isNotEmpty) {
            print(message.notification?.body);
          }
        }
      },
    );
  }

  static void notificationForeground() {
    FirebaseMessaging.onMessage.listen(
      (message) {
        print("FirebaseMessaging.onMessage.listen");
        if (message.notification != null) {
          LocalNotificationService.createanddisplaynotification(message);
        }
      },
    );
  }

  static void notificationBackground() {
    FirebaseMessaging.onMessageOpenedApp.listen(
      (message) {
        print("FirebaseMessaging.onMessageOpenedApp.listen");
        if (message.notification != null) {
          print(message.notification!.body);
        }
      },
    );
  }
}
