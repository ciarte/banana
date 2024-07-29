import 'package:flutter_dotenv/flutter_dotenv.dart';

class Enviroments {
  static String apiUrl = dotenv.env['API_SERVER'] ?? ' configurar url';
}
