import 'dart:convert';

import 'package:getx_clean_architecture/features/template/business/entities/template_entity.dart';

class TemplateModel extends TemplateEntity{
  TemplateModel({required super.template});
  // TemplateModel({required String template}) : super(template: template);

  factory TemplateModel.fromJson({required Map<String, dynamic> json}){
    return TemplateModel(template: json['template']);
  }

  Map<String, dynamic> toJson(){
    return {
      'template': template
    };
  }

}