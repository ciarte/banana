class ServerException implements Exception {
  final String message;
  ServerException([this.message = 'Server error occurred']);

  @override
  String toString() => 'ServerException: $message';
}

class WrongCredentials implements Exception {}

class ConectionTimeout implements Exception {}

class InvalidCredentials implements Exception {}

class CacheException implements Exception {
  final String message;
  CacheException([this.message = 'Cache error occurred']);

  @override
  String toString() => 'CacheException: $message';
}
