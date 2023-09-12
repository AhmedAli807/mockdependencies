import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockdependencies/model.dart';
import 'package:mockdependencies/web_sevice.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'fetch_album_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  group('fetchAlbum', () {
    final client = MockClient();
    test('returns an Album if the http call completes successfully', () async {
      when(client
          .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1')))
          .thenAnswer((_) async =>
          http.Response('{"userId": 1, "id": 2, "title": "mock"}', 200));

      expect(await WebService.album(client), isA<Model>());
    });

    test('throws an exception if the http call completes with an error', () {
      when(client
          .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1')))
          .thenAnswer((_) async => http.Response('Not Found', 404));

      expect(WebService.album(client), throwsException);
    });
  });
}