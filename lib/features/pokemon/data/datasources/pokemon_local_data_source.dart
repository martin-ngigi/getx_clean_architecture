
import 'dart:convert';
import 'package:getx_clean_architecture/core/errors/exceptions.dart';
import 'package:getx_clean_architecture/features/template/data/models/template_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class TemplateLocalDataSource {
  Future<void> cacheTemplate({required TemplateModel? templateToCache});
  Future<TemplateModel> getLastTemplate();
}

const cachedTemplate = 'CACHED_TEMPLATE';

class TemplateLocalDataSourceImp implements TemplateLocalDataSource{
  final SharedPreferences sharedPreferences;

  TemplateLocalDataSourceImp({required this.sharedPreferences});

  @override
  Future<void> cacheTemplate({required TemplateModel? templateToCache}) async {
    if(templateToCache != null){
      sharedPreferences.setString(cachedTemplate, json.encode(templateToCache.toJson()));
    }
    else {
      throw CacheException();
    }
  }

  @override
  Future<TemplateModel> getLastTemplate() {
    final jsonString =sharedPreferences.getString(cachedTemplate);

    if(jsonString != null){
      return Future.value(TemplateModel.fromJson(json: json.decode(jsonString))); ///import json convert
    }
    else {
      throw CacheException();
    }
  }

}