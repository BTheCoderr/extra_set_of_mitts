import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:local_auth/local_auth.dart';
import 'package:extra_set_of_mitts/config/routes/routes.dart';
import 'package:extra_set_of_mitts/config/theme/light_theme.dart';
import 'package:extra_set_of_mitts/data/models/job.dart';
import 'package:extra_set_of_mitts/data/models/hive_adapters.dart';
import 'package:extra_set_of_mitts/data/repositories/auth_repository_impl.dart';
import 'package:extra_set_of_mitts/domain/repositories/auth_repository.dart';
import 'package:extra_set_of_mitts/presentation/bloc/auth/auth_bloc.dart';
import 'package:extra_set_of_mitts/presentation/bloc/job/job_bloc.dart';
import 'package:extra_set_of_mitts/domain/repositories/job_repository.dart';
import 'package:extra_set_of_mitts/data/repositories/job_repository_impl.dart';
import 'package:extra_set_of_mitts/core/network/network_info.dart';
import 'package:extra_set_of_mitts/data/datasources/job_local_data_source.dart';
import 'package:extra_set_of_mitts/data/datasources/job_remote_data_source.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize Hive
  await Hive.initFlutter();
  
  // Register Hive adapters
  Hive.registerAdapter(JobAdapter());
  Hive.registerAdapter(CleaningTaskAdapter());
  Hive.registerAdapter(GeoLocationAdapter());
  Hive.registerAdapter(JobStatusAdapter());
  Hive.registerAdapter(TaskTypeAdapter());
  
  // Open Hive boxes
  final jobsBox = await Hive.openBox<Job>('jobs');
  final pendingUploadsBox = await Hive.openBox<List<String>>('pending_uploads');
  final photoUrlsBox = await Hive.openBox<List<String>>('photo_urls');
  final authBox = await Hive.openBox<String>('auth');
  
  // Initialize local authentication
  final localAuth = LocalAuthentication();
  
  runApp(MyApp(
    jobsBox: jobsBox,
    pendingUploadsBox: pendingUploadsBox,
    photoUrlsBox: photoUrlsBox,
    authBox: authBox,
    localAuth: localAuth,
  ));
}

//DO NOT REMOVE Unless you find their usage.
String dummyImg =
    'https://images.unsplash.com/photo-1558507652-2d9626c4e67a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80';

class MyApp extends StatelessWidget {
  final Box<Job> jobsBox;
  final Box<List<String>> pendingUploadsBox;
  final Box<List<String>> photoUrlsBox;
  final Box<String> authBox;
  final LocalAuthentication localAuth;

  MyApp({
    required this.jobsBox,
    required this.pendingUploadsBox,
    required this.photoUrlsBox,
    required this.authBox,
    required this.localAuth,
  });

  late final networkInfo = NetworkInfoImpl();
  late final client = http.Client();

  late final jobRepository = JobRepositoryImpl(
    remoteDataSource: JobRemoteDataSourceImpl(
      client: client,
    ),
    localDataSource: JobLocalDataSourceImpl(
      jobsBox: jobsBox,
      pendingUploadsBox: pendingUploadsBox,
      photoUrlsBox: photoUrlsBox,
    ),
    networkInfo: networkInfo,
  );

  late final authRepository = AuthRepositoryImpl(
    client: client,
    networkInfo: networkInfo,
    authBox: authBox,
    localAuth: localAuth,
  );

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<JobBloc>(
          create: (context) => JobBloc(repository: jobRepository),
        ),
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(repository: authRepository),
        ),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        debugShowMaterialGrid: false,
        title: 'Extra Set of Mitts',
        theme: lightTheme,
        themeMode: ThemeMode.light,
        initialRoute: AppLinks.splashScreen,
        getPages: AppRoutes.pages,
      ),
    );
  }
}

// Mock classes for testing
class MockJobRemoteDataSource implements JobRemoteDataSource {
  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class MockJobLocalDataSource implements JobLocalDataSource {
  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
