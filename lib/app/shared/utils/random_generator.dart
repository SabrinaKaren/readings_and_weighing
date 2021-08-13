import 'dart:math';
import 'package:faker/faker.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

class RandomGenerator {

  var faker = new Faker();
  var uuid = Uuid();

  static const maxConst = 200;

  String generateName() {
    return faker.person.name();
  }

  String generateEmail() {
    return faker.internet.email();
  }

  String generateUserName() {
    return faker.internet.userName();
  }

  String generateSentence() {
    return faker.lorem.sentence();
  }

  String generatePrefix() {
    return faker.person.prefix();
  }

  String generateSuffix() {
    return faker.person.suffix();
  }

  String generateIpv6Address() {
    return faker.internet.ipv6Address();
  }

  String generateUuid() {
    return uuid.v4();
  }

  int generateInt({int? max}) {
    var rng = new Random();
    return rng.nextInt(max ?? maxConst);
  }

  double generateDouble() {
    var rng = new Random();
    return this.generateInt() + rng.nextDouble();
  }

  String generateDate() {
    return DateFormat('dd/MM/yyyy').format(DateTime.now().subtract(Duration(days: this.generateInt())));
  }

}