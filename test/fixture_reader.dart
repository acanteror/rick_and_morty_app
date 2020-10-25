import 'dart:io';

String fixture(String feature, String layer, String name) {
  try {
    return File('../test/features/$feature/$layer/fixtures/$name').readAsStringSync();
  } catch (e) {
    return File('./test/features/$feature/$layer/fixtures/$name').readAsStringSync();
  }
}
