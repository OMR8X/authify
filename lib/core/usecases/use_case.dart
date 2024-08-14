import 'package:auhtify/core/resources/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase<Type, Parameter> {
  Future<Either<Failure, Type>> call([Parameter parameter]);
}

class NoParameter {}
