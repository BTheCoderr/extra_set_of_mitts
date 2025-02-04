import 'package:get/get.dart';
import 'package:extra_set_of_mitts/view/screens/home/home.dart';
import 'package:extra_set_of_mitts/view/screens/job/job%20info/job_info.dart';
import 'package:extra_set_of_mitts/view/screens/launch/splash_screen.dart';
import 'package:extra_set_of_mitts/view/screens/onboarding/onboarding_screen.dart';
import 'package:extra_set_of_mitts/presentation/screens/login_screen.dart';
import 'package:extra_set_of_mitts/presentation/screens/signup_screen.dart';

class AppRoutes {
  static final List<GetPage> pages = [
    GetPage(
      name: AppLinks.splashScreen,
      page: () => SplashScreen(),
    ),
    GetPage(
      name: AppLinks.login,
      page: () => LoginScreen(),
    ),
    GetPage(
      name: AppLinks.signup,
      page: () => SignUpScreen(),
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
  static const signup = '/signup';
  static const onboarding = '/onboarding';
  static const home = '/home';
  static const jobInfo = '/job_info';
}
