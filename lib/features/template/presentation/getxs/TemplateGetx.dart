import 'package:get/get.dart';
import 'package:getx_clean_architecture/core/errors/failure.dart';
import 'package:getx_clean_architecture/features/template/business/entities/template_entity.dart';

class TemplateGetx extends GetxController implements GetxService {
  TemplateEntity? templateEntity;
  Failure? failure;

  TemplateGetx({ this.templateEntity, this.failure});

  void eitherFailureOrTemplate() async {
    // TemplateRe
  }
}