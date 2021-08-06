import 'package:faker/faker.dart';

class RandomGenerator {

  var faker = new Faker();

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

}