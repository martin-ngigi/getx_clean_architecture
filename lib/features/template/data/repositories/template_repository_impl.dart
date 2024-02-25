import 'package:dartz/dartz.dart';
import 'package:getx_clean_architecture/core/connection/network_info.dart';
import 'package:getx_clean_architecture/core/errors/exceptions.dart';
import 'package:getx_clean_architecture/core/errors/failure.dart';
import 'package:getx_clean_architecture/core/params/params.dart';
import 'package:getx_clean_architecture/features/template/business/entities/template_entity.dart';
import 'package:getx_clean_architecture/features/template/business/repositories/template_repository.dart';
import 'package:getx_clean_architecture/features/template/data/datasources/template_local_data_source.dart';
import 'package:getx_clean_architecture/features/template/data/datasources/template_remote_data_source.dart';
import 'package:getx_clean_architecture/features/template/data/models/template_model.dart';

class TemplateRepositoryImpl implements TemplateRepository {
  final TemplateRemoteDataSource remoteDataSource;
  final TemplateLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  TemplateRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, TemplateEntity>> getTemplate({required TemplateParams templateParams}) async {
    /// we have internet, so get data from remote API
    if(await networkInfo.isConnected!){
      try{
        TemplateModel remoteTemplate = await remoteDataSource.getTemplate(templateParams: templateParams);
        localDataSource.cacheTemplate(templateToCache: remoteTemplate);
        return Right(remoteTemplate);
      }
      on ServerException {
        return Left(ServerFailure(errorMessage: "This is a server exception"));
      }
    }
    else{ /// No internet connection, so get data that is stored in device
      try{
        TemplateModel localTemplate = await localDataSource.getLastTemplate();
        return Right(localTemplate);
      }
      on CacheException {
        return Left(CacheFailure(errorMessage: "This is a cache exception."));
      }
    }
  }

}