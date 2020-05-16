import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:http/http.dart' as http;
import 'package:get_it/get_it.dart';
import 'package:learn_routes/core_errors/input_converter.dart';
import 'package:learn_routes/ts_data_data_sources/number_trivia_remote_data_source.dart';
import 'package:learn_routes/ts_data_repositories/trivia_number_repositories_impl.dart';
import 'package:learn_routes/ts_domain_use_cases/get_concrete_trivial_number.dart';
import 'package:learn_routes/ts_domain_use_cases/get_random_number_trivia.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core_errors/network_info.dart';
import 'ts_data_data_sources/number_trivia_local_data_source.dart';
import 'ts_domain_repositories/trivia_number_repository.dart';
import 'ts_presentation_bloc/number_trivia_bloc.dart';


final sl = GetIt.instance;
 
Future<void> init()async{
  //registering dependencies of the app. since all classes are decoupled from one another and are only connected through constructors
  //! features : number trivia
  
  //register bloc
  sl.registerFactory(()=>NumberTriviaBloc(
      concrete: sl(),
      random: sl(),
      inputConverter: sl()));//we could also do sl.call(). its same thx
  
  //register use cases
  sl.registerLazySingleton(()=>GetConcreteTriviaNumber(sl()));//this class depends on d contract of d usecase not its imp so we have to register its impl
  sl.registerLazySingleton(()=>GetRandomNumberTrivia(sl()));// same goes for this

  //register repository implementation
  sl.registerLazySingleton<TriviaNumberRepository>(()=>TriviaNumberRepositoryImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
      networkInfo: sl()));

  //register datasources
   sl.registerLazySingleton<NumberTriviaRemoteDataSource>(()=>NumberTriviaRemoteDataSourceImpl(client: sl()));
   sl.registerLazySingleton<NumberTriviaLocalDataSource>(()=>NumberTriviaLocalDataSourceImpl(sharedPreferences: sl()));
   

  //! core
   //register input converter
    sl.registerLazySingleton(()=>InputConverter());
   //register networkInfo class
    sl.registerLazySingleton<NetworkInfo>(()=>NetworkInfoImpl(sl()));

  //!external
   //register cache dependencies(sharedPreferences)
   final sharedPreferences = await SharedPreferences.getInstance();
   sl.registerLazySingleton(()=>sharedPreferences);

   //register http client
   sl.registerLazySingleton(()=>http.Client());

   //register the data connection checker
  sl.registerLazySingleton(()=>DataConnectionChecker());

}