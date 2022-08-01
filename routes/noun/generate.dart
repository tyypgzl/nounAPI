import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:example_frog/models/noun_error.dart';
import 'package:example_frog/service/words_service.dart';

Response onRequest(RequestContext context) {
  final service = context.read<WordService>();
  final params = context.request.uri.queryParameters;

  final count = params['count'];
  final firstLetter = params['firstLetter'];
  final lastLetter = params['lastLetter'];
  final lenght = params['lenght'];
  final syllableLenght = params['syllableLenght'];
  final comparison = params['comparison'];

  if (count == null || int.tryParse(count) == null) {
    return Response.json(
      statusCode: HttpStatus.badRequest,
      body: NounError(
        statusCode: HttpStatus.badRequest,
        message: '''Query parameter 'count' is not a number''',
      ),
    );
  }

  if (lenght != null && int.tryParse(lenght) == null) {
    return Response.json(
      statusCode: HttpStatus.badRequest,
      body: NounError(
        statusCode: HttpStatus.badRequest,
        message: '''Query parameter 'lenght' must be a number''',
      ),
    );
  }

  if (syllableLenght != null && int.tryParse(syllableLenght) == null) {
    return Response.json(
      statusCode: HttpStatus.badRequest,
      body: NounError(
        statusCode: HttpStatus.badRequest,
        message: '''Query parameter 'syllableLenght' must be a number''',
      ),
    );
  }
  return Response(
    body: service
        .generateNouns(
          int.parse(count),
          firstLetter: firstLetter,
          lastLetter: lastLetter,
          lenght: lenght != null ? int.parse(lenght) : null,
          syllableLenght:
              syllableLenght != null ? int.parse(syllableLenght) : null,
          comparison: Comparison.fromString(comparison),
        )
        .join(' '),
  );
}
