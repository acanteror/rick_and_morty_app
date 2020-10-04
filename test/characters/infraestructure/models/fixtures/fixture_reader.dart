import 'dart:io';

String fixture(String name) {
  try {
    return File('../test/characters/infraestructure/models/fixtures/$name').readAsStringSync();
  } catch (e) {
    return File('./test/characters/infraestructure/models/fixtures/$name').readAsStringSync();
  }
}
