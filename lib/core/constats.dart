import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

int mainLayoutIntitalScreenIndex = 0;
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();


late Database database;