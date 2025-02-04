import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:local_auth/local_auth.dart';
import 'package:http/http.dart' as http;
import 'core/storage/web_storage.dart';
import 'data/models/job.dart';
import 'domain/repositories/auth_repository.dart';
import 'domain/repositories/job_repository.dart';
import 'data/repositories/auth_repository_impl.dart';
import 'data/repositories/job_repository_impl.dart';
import 'data/datasources/job_local_data_source.dart';
import 'data/datasources/job_remote_data_source.dart';
import 'core/network/network_info.dart';
import 'core/services/hive_service.dart';
import 'core/services/scheduler_service.dart';
import 'presentation/bloc/auth/auth_bloc.dart';
import 'presentation/bloc/job/job_bloc.dart';
import 'presentation/screens/login_screen.dart';
import 'presentation/screens/signup_screen.dart';
import 'presentation/screens/onboarding_screen.dart';
import 'presentation/screens/home_screen.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'domain/entities/job_status.dart';
import 'domain/entities/geo_location.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Hive
  await Hive.initFlutter();

  // Register adapters
  Hive.registerAdapter(GeoLocationAdapter());
  Hive.registerAdapter(JobStatusAdapter());
  Hive.registerAdapter(TaskTypeAdapter());
  Hive.registerAdapter(JobModelAdapter());
  Hive.registerAdapter(CleaningTaskAdapter());

  // Open boxes
  await Hive.openBox<JobModel>('jobs');

  // Initialize local authentication
  final localAuth = LocalAuthentication();
  final networkInfo = NetworkInfoImpl(
    connectionChecker: kIsWeb ? null : InternetConnectionChecker(),
  );
  final client = http.Client();

  late final Box<String> authBox;
  late final Box<JobModel> jobsBox;
  late final Box<List<String>> pendingUploadsBox;
  late final Box<List<String>> photoUrlsBox;

  if (kIsWeb) {
    // For web, we'll use our WebStorage implementation
    authBox = WebBox<String>('auth');
    jobsBox = WebBox<JobModel>('jobs');
    pendingUploadsBox = WebBox<List<String>>('pending_uploads');
    photoUrlsBox = WebBox<List<String>>('photo_urls');
  } else {
    // For native platforms, use actual Hive boxes
    authBox = await Hive.openBox<String>('auth');
    jobsBox = await Hive.openBox<JobModel>('jobs');
    pendingUploadsBox = await Hive.openBox<List<String>>('pending_uploads');
    photoUrlsBox = await Hive.openBox<List<String>>('photo_urls');
  }

  final jobRepository = JobRepositoryImpl(
    remoteDataSource: JobRemoteDataSourceImpl(
      client: client,
    ),
    localDataSource: JobLocalDataSourceImpl(
      jobsBox: jobsBox,
      pendingUploadsBox: pendingUploadsBox,
      photoUrlsBox: photoUrlsBox,
    ),
  );

  final authRepository = AuthRepositoryImpl(
    client: client,
    networkInfo: networkInfo,
    authBox: authBox,
    localAuth: localAuth,
    baseUrl: 'http://localhost:3000/api/v1',
  );

  final hiveService = HiveService(
    jobsBox: jobsBox,
    pendingUploadsBox: pendingUploadsBox,
    photoUrlsBox: photoUrlsBox,
  );

  final schedulerService = SchedulerService(hiveService);

  runApp(MyApp(
    jobRepository: jobRepository,
    authRepository: authRepository,
    hiveService: hiveService,
    schedulerService: schedulerService,
  ));
}

//DO NOT REMOVE Unless you find their usage.
String dummyImg =
    'https://images.unsplash.com/photo-1558507652-2d9626c4e67a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80';

class MyApp extends StatelessWidget {
  final JobRepository jobRepository;
  final AuthRepository authRepository;
  final HiveService hiveService;
  final SchedulerService schedulerService;

  const MyApp({
    super.key,
    required this.jobRepository,
    required this.authRepository,
    required this.hiveService,
    required this.schedulerService,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => JobBloc(repository: jobRepository),
        ),
        BlocProvider(
          create: (context) => AuthBloc(repository: authRepository),
        ),
      ],
      child: MaterialApp(
        title: 'Extra Set of Mitts',
        theme: ThemeData(
          primarySwatch: Colors.teal,
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.teal,
            secondary: Colors.orange,
            brightness: Brightness.light,
          ),
          useMaterial3: true,
          inputDecorationTheme: InputDecorationTheme(
            filled: true,
            fillColor: Colors.grey[50],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: Colors.teal, width: 2),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
              backgroundColor: Colors.teal,
              foregroundColor: Colors.white,
              elevation: 2,
            ),
          ),
          outlinedButtonTheme: OutlinedButtonThemeData(
            style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
              side: const BorderSide(color: Colors.teal, width: 2),
              foregroundColor: Colors.teal,
            ),
          ),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              foregroundColor: Colors.teal,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            ),
          ),
          cardTheme: CardTheme(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 2,
          ),
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.teal,
            foregroundColor: Colors.white,
            elevation: 0,
          ),
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const LoginScreen(),
          '/signup': (context) => const SignUpScreen(),
          '/onboarding': (context) => const OnBoardingScreen(),
          '/home': (context) => const HomeScreen(),
        },
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

// Web implementation of Hive Box
class WebBox<T> extends Box<T> {
  final Map<String, T> _storage = {};
  final String _name;

  WebBox(this._name);

  @override
  T? get(key, {T? defaultValue}) => _storage[key] ?? defaultValue;

  @override
  Future<void> put(key, T value) async {
    _storage[key] = value;
  }

  @override
  Future<void> delete(key) async {
    _storage.remove(key);
  }

  @override
  bool get isOpen => true;

  @override
  String get name => _name;

  @override
  String? get path => null;

  @override
  bool get lazy => false;

  @override
  bool get isEmpty => _storage.isEmpty;

  @override
  bool get isNotEmpty => _storage.isNotEmpty;

  @override
  dynamic keyAt(int index) => _storage.keys.elementAt(index);

  @override
  Future<Iterable<int>> addAll(Iterable<T> values) async {
    int i = _storage.length;
    for (var value in values) {
      _storage[i.toString()] = value;
      i++;
    }
    return Iterable.generate(values.length, (i) => i + _storage.length);
  }

  @override
  Future<int> clear() async {
    final length = _storage.length;
    _storage.clear();
    return length;
  }

  @override
  Future<void> close() async {}

  @override
  Future<int> add(T value) async {
    final key = _storage.length.toString();
    _storage[key] = value;
    return _storage.length - 1;
  }

  @override
  Future<void> deleteFromDisk() async {}

  @override
  Future<void> flush() async {}

  @override
  T? getAt(int index) => _storage[index.toString()];

  @override
  bool containsKey(key) => _storage.containsKey(key);

  @override
  List<T> get values => _storage.values.toList();

  @override
  Iterable<T> valuesBetween({startKey, endKey}) => [];

  @override
  Stream<BoxEvent> watch({key}) => const Stream.empty();

  @override
  Future<void> putAll(Map<dynamic, T> entries) async {
    _storage.addAll(Map<String, T>.from(entries));
  }

  @override
  Future<void> putAt(int index, T value) async {
    _storage[index.toString()] = value;
  }

  @override
  Map<dynamic, T> toMap() => _storage;

  @override
  int get length => _storage.length;

  @override
  Iterable get keys => _storage.keys;

  @override
  Future<void> compact() async {}

  @override
  Future<void> deleteAll(Iterable keys) async {
    for (final key in keys) {
      _storage.remove(key);
    }
  }

  @override
  Future<void> deleteAt(int index) async {
    _storage.remove(index.toString());
  }
}
