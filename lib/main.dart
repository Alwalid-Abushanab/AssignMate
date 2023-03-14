import 'app.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  //runApp(const StreakApp());
  BlocOverrides.runZoned(() => runApp(
        AssignMateApp(),
      ));
}
