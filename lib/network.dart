import 'dart:io';

String ipAddress() {
  String ip = "";
  if (Platform.isAndroid) {
    ip = "http://10.0.2.2:8080";
  } else if (Platform.isIOS) {
    ip = "http://127.0.0.1:8080";
  }
  return ip;
}