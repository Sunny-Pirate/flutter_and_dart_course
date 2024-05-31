import 'package:uuid/uuid.dart';

final uuid = Uuid();

class Place {
   final String id;
   final String title;

  Place({required this.title}): this.id = uuid.v4();
}