

import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:learn_routes/core_errors/exceptions.dart';
import 'package:learn_routes/core_errors/failure.dart';
import 'package:learn_routes/core_errors/network_info.dart';
import 'package:learn_routes/ts_data_data_sources/number_trivia_local_data_source.dart';
import 'package:learn_routes/ts_data_data_sources/number_trivia_remote_data_source.dart';
import 'package:learn_routes/ts_domain_entities/number_trivia.dart';
import 'package:learn_routes/ts_domain_repositories/trivia_number_repository.dart';





typedef Future<NumberTrivial> _concreteOrRandomChoosers();

class TriviaNumberRepositoryImpl implements TriviaNumberRepository{
  final NumberTriviaRemoteDataSource remoteDataSource;
  final NumberTriviaLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  TriviaNumberRepositoryImpl({@required this.remoteDataSource,@required this.localDataSource,@required this.networkInfo});
  @override
  Future<Either<Failure, NumberTrivial>> getConcreteTriviaNumber(int number) async {
    // TODO: implement getConcreteTriviaNumber
    return await _getTrivia(()=>remoteDataSource.getConcreteTriviaNumber(number));
  }

  @override
  Future<Either<Failure, NumberTrivial>> getRandomTriviaNumber() async{
    // TODO: implement getRandomTriviaNumber
    return await _getTrivia(()=>remoteDataSource.getRandomTriviaNumber());

  } 
  Future<Either<Failure, NumberTrivial>> _getTrivia(_concreteOrRandomChoosers getConcreteOrRandom)async{
    if(await networkInfo.isConnected){
      try{
        final remoteTrivia = await getConcreteOrRandom();
        localDataSource.cacheNumberTrivia(remoteTrivia);
        return Right(remoteTrivia);
      }on ServerException{return Left(ServerFailure());}
    }
    else{
      try{
        final localTrivia = await localDataSource.getLastNumberTrivia();
        return Right(localTrivia);
      }on CacheException{return Left(CacheFailure());}
    }
  }

}