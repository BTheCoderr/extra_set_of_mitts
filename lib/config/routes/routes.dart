import 'package:get/get.dart';
import 'package:two_local_gals_housekeeping/view/screens/auth/login/login.dart';
import 'package:two_local_gals_housekeeping/view/screens/home/home.dart';
import 'package:two_local_gals_housekeeping/view/screens/job/job%20info/job_info.dart';
import 'package:two_local_gals_housekeeping/view/screens/launch/splash_screen.dart';
import 'package:two_local_gals_housekeeping/view/screens/onboarding/onboarding_screen.dart';

class AppRoutes {
  static final List<GetPage> pages = [
    GetPage(
      name: AppLinks.splashScreen,
      page: () => SplashScreen(),
    ),
    GetPage(
      name: AppLinks.login,
      page: () => Login(),
    ),
    GetPage(
      name: AppLinks.onboarding,
      page: () => OnBoardingScreen(),
    ),
    GetPage(
      name: AppLinks.home,
      page: () => HomeScreen(),
    ),
    GetPage(
      name: AppLinks.jobInfo,
      page: () => JobInfoScreen(),
    ),
  ];
}

class AppLinks {
  static const splashScreen = '/splash_screen';
  static const login = '/login';
  static const onboarding = '/onboarding';
  static const home = '/home';
  static const jobInfo = '/job_info';
}
