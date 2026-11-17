import 'dart:io';
import 'package:flutter/foundation.dart';

// Jika di Emulator Android gunakan 10.0.2.2, jika di Windows / Web / Desktop gunakan 127.0.0.1
String get baseUrl {
  if (!kIsWeb && Platform.isAndroid) {
    return 'http://10.0.2.2:8000/api';
  }
  return 'http://127.0.0.1:8000/api';
}
