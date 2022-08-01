import 'package:dart_frog/dart_frog.dart';
import 'package:example_frog/service/words_service.dart';

Handler middleware(Handler handler) => handler.use(
      provider<WordService>(
        (_) => WordService(),
      ),
    );
