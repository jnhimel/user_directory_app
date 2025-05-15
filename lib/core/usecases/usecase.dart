import 'package:fpdart/fpdart.dart';
import 'package:user_directory_app/core/error/failures.dart';

abstract class UseCase<SuccessType, Params> {
  Future<Either<Failure,SuccessType>> call({Params? params});
}

class NoParams{}
