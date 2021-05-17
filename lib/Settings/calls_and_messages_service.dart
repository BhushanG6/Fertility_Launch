import 'package:url_launcher/url_launcher.dart';

class CallsAndMessagesService {
  void sendEmail(String email) => launch("mailto:$email");
}