import 'dart:io';

String fixture(String name) {
  try {
    return File('../test/fixtures/$name').readAsStringSync();
  } catch (e) {
    return File('./test/fixtures/$name').readAsStringSync();
  }
}
