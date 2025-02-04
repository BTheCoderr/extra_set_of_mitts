import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:extra_set_of_mitts/config/routes/routes.dart';
import 'package:extra_set_of_mitts/constants/app_colors.dart';
import 'package:extra_set_of_mitts/constants/app_images.dart';
import 'package:extra_set_of_mitts/constants/app_styling.dart';
import 'package:extra_set_of_mitts/view/widget/common_image_view_widget.dart';
import 'package:extra_set_of_mitts/view/widget/custom_rectangle_btn.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int currentIndex = 0;
  final List<OnboardingPage> pages = [
    OnboardingPage(
      title: 'Welcome',
      description: 'Your trusted cleaning service management app',
      illustration: const WelcomeIllustration(),
      color: Colors.teal[50]!,
    ),
    OnboardingPage(
      title: 'Smart Dashboard',
      description: 'Track Your Earnings',
      illustration: const SmartDashboardIllustration(),
      color: Colors.blue[50]!,
    ),
    OnboardingPage(
      title: 'Job Management',
      description: 'Effortless Organization',
      illustration: const JobManagementIllustration(),
      color: Colors.green[50]!,
    ),
  ];

  late PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.blue[100]!,
            Colors.blue[50]!,
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        if (currentIndex > 0) {
                          _controller.previousPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        }
                      },
                      child: Text(
                        currentIndex > 0 ? 'Back' : '',
                        style: const TextStyle(
                          color: kTertiaryColor,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () => Get.offNamed(AppLinks.home),
                      child: const Text(
                        'Skip',
                        style: TextStyle(
                          color: kTertiaryColor,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: PageView.builder(
                  controller: _controller,
                  itemCount: pages.length,
                  onPageChanged: (index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  itemBuilder: (_, i) {
                    return SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 20),
                            Center(
                              child: Container(
                                constraints: BoxConstraints(
                                  maxHeight: size.height * 0.25,
                                  maxWidth: size.width * 0.8,
                                ),
                                child: pages[i].illustration,
                              ),
                            ),
                            const SizedBox(height: 32),
                            Text(
                              pages[i].title,
                              style: const TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: kTertiaryColor,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              pages[i].description,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey[600],
                                height: 1.5,
                              ),
                            ),
                            const SizedBox(height: 24),
                            const SizedBox(height: 32),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, -5),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        pages.length,
                        (index) => buildDot(index),
                      ),
                    ),
                    const SizedBox(height: 20),
                    CustomRectangleBtn(
                      onPressed: () {
                        if (currentIndex == pages.length - 1) {
                          Get.offNamed(AppLinks.home);
                        } else {
                          _controller.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        }
                      },
                      txt: currentIndex == pages.length - 1 ? 'Get Started' : 'Next',
                      btnRadius: 12,
                      backgroundBtnColor: kTertiaryColor,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDot(int index) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      height: 8,
      width: currentIndex == index ? 24 : 8,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: currentIndex == index ? kTertiaryColor : Colors.grey[300],
      ),
    );
  }
}

class OnboardingPage {
  final String title;
  final String description;
  final Widget illustration;
  final Color color;

  OnboardingPage({
    required this.title,
    required this.description,
    required this.illustration,
    required this.color,
  });
}
