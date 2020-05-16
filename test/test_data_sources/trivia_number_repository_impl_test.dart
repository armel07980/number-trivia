import 'package:learn_routes/core_errors/network_info.dart';
import 'package:learn_routes/ts_data_data_sources/number_trivia_local_data_source.dart';
import 'package:learn_routes/ts_data_data_sources/number_trivia_remote_data_source.dart';
import 'package:learn_routes/ts_data_repositories/trivia_number_repositories_impl.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

class MockRemoteDataSource extends Mock implements NumberTriviaRemoteDataSource{}
class MockLocalDataSource extends Mock implements NumberTriviaLocalDataSource{}
class MockNetworkInfo extends Mock implements NetworkInfo{}

void main(){
  TriviaNumberRepositoryImpl triviaNumberRepositoryImpl;
  MockRemoteDataSource mockRemoteDataSource;
  MockLocalDataSource mockLocalDataSource;
  MockNetworkInfo mockNetworkInfo;

  setUp((){
    mockRemoteDataSource = MockRemoteDataSource();
    mockLocalDataSource = MockLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();
    triviaNumberRepositoryImpl = TriviaNumberRepositoryImpl(
        localDataSource:mockLocalDataSource,
        remoteDataSource:mockRemoteDataSource,
        networkInfo:mockNetworkInfo
    );
  });
}