import 'package:flutter_dotenv/flutter_dotenv.dart';

final String apiUrl = dotenv.env['API_URL'] ?? "http://10.0.2.2:5000/api";
