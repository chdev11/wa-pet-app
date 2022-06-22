abstract class IPetException implements Exception {
  final String message;

  IPetException(this.message);
}

class PetDatasourceException extends IPetException {
  PetDatasourceException(String message) : super(message);
}

class PetLimitException extends IPetException {
  PetLimitException(String message) : super(message);
}

class PetPageException extends IPetException {
  PetPageException(String message) : super(message);
}

class PetNormalizeException extends IPetException {
  PetNormalizeException(String message) : super(message);
}

class PetInvalidOrMissingParamException extends IPetException {
  PetInvalidOrMissingParamException(String message) : super(message);
}

class PetUnauthorizedException extends IPetException {
  PetUnauthorizedException(String message) : super(message);
}

class PetBadRequestException extends IPetException {
  PetBadRequestException(String message) : super(message);
}
