import 'package:flutter/material.dart';
import 'app.dart';
import 'core/di/service_locator.dart';

void main() async {
  await initializeDependencies();
  runApp(const MyApp());
}
