import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:example_frog/models/noun_error.dart';

Response onRequest(RequestContext context) {
  final req = context.request;

  if (req.method != HttpMethod.get) {
    return Response.json(
      statusCode: HttpStatus.methodNotAllowed,
      body: NounError(
        statusCode: HttpStatus.methodNotAllowed,
        message: 'Method not allowed on this route',
      ),
    );
  }
  return Response();
}
