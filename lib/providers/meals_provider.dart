import 'package:flutter_and_dart_course/data/dummy_data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final mealsProvider = Provider((ref) => dummyMeals);
