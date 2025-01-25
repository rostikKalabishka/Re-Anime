enum ApiClientExceptionType { network, auth, other }

class ApiClientException implements Exception {
  final ApiClientExceptionType type;

  ApiClientException(this.type);
}
