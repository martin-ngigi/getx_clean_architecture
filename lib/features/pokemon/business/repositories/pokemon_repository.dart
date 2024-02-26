import 'package:dartz/dartz.dart';
import 'package:getx_clean_architecture/core/errors/failure.dart';
import 'package:getx_clean_architecture/core/params/params.dart';
import 'package:getx_clean_architecture/features/template/business/entities/template_entity.dart';

abstract class TemplateRepository {
  Future<Either<Failure, TemplateEntity>> getTemplate ({required TemplateParams templateParams});
}