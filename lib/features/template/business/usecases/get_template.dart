import 'package:getx_clean_architecture/core/errors/failure.dart';
import 'package:getx_clean_architecture/core/params/params.dart';
import 'package:getx_clean_architecture/features/template/business/entities/template_entity.dart';
import 'package:getx_clean_architecture/features/template/business/repositories/template_repository.dart';
import 'package:dartz/dartz.dart';


class GetTemplate {
  final TemplateRepository templateRepository;

  GetTemplate({required this.templateRepository});

  Future<Either<Failure, TemplateEntity>> call({required TemplateParams templateParams}) async{
    return await templateRepository.getTemplate(templateParams: templateParams);
  }
}