import 'dart:io';

String fixture(String feature, String name) {
  try {
    return File('../test/features/$feature/infraestructure/models/fixtures/$name').readAsStringSync();
  } catch (e) {
    return File('./test/features/$feature/infraestructure/models/fixtures/$name').readAsStringSync();
  }
}
