import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:two_local_gals_housekeeping/config/routes/routes.dart';
import 'package:two_local_gals_housekeeping/constants/app_colors.dart';
import 'package:two_local_gals_housekeeping/constants/app_images.dart';
import 'package:two_local_gals_housekeeping/constants/app_styling.dart';
import 'package:two_local_gals_housekeeping/view/widget/common_image_view_widget.dart';
import 'package:two_local_gals_housekeeping/view/widget/custom_rectangle_btn.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int currentIndex = 0;
  final List<OnboardingContent> contents = [
    OnboardingContent(
      title: 'Welcome to 2LG',
      subtitle: 'Your Housekeeping Partner',
      description: 'Manage your schedule, track earnings, and provide excellent service - all in one place.',
      icon: Assets.imagesWalkthrought1,
      primaryAction: 'Get Started',
      secondaryAction: 'Learn More',
    ),
    OnboardingContent(
      title: 'Smart Dashboard',
      subtitle: 'Track Your Earnings',
      description: 'View your daily, weekly, and upcoming earnings at a glance. Stay on top of your income with our intuitive dashboard.',
      icon: Assets.imagesWalkthrought3,
      showPayDashboard: true,
    ),
    OnboardingContent(
      title: 'Job Management',
      subtitle: 'Effortless Organization',
      description: 'Access job details, start tasks, and navigate to locations seamlessly. Everything you need is just a tap away.',
      icon: Assets.imagesWalkthrought4,
      showJobList: true,
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
                  itemCount: contents.length,
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
                                child: CommonImageView(
                                  imagePath: contents[i].icon,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            const SizedBox(height: 32),
                            Text(
                              contents[i].title,
                              style: const TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: kTertiaryColor,
                              ),
                            ),
                            if (contents[i].subtitle != null) ...[
                              const SizedBox(height: 8),
                              Text(
                                contents[i].subtitle!,
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.grey[700],
                                ),
                              ),
                            ],
                            const SizedBox(height: 16),
                            Text(
                              contents[i].description,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey[600],
                                height: 1.5,
                              ),
                            ),
                            const SizedBox(height: 24),
                            if (contents[i].showPayDashboard)
                              _buildPayDashboard(),
                            if (contents[i].showJobList)
                              _buildJobList(),
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
                        contents.length,
                        (index) => buildDot(index),
                      ),
                    ),
                    const SizedBox(height: 20),
                    CustomRectangleBtn(
                      onPressed: () {
                        if (currentIndex == contents.length - 1) {
                          Get.offNamed(AppLinks.home);
                        } else {
                          _controller.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        }
                      },
                      txt: currentIndex == contents.length - 1 ? 'Get Started' : 'Next',
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

  Widget _buildPayDashboard() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Earnings Overview',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: kTertiaryColor,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildPayColumn('Today', '6.5', '\$200', '\$27.26'),
              _buildPayColumn('This Week', '27.5', '\$835', '\$28.45'),
              _buildPayColumn('Next Week', '30', '\$864', '\$26.26'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPayColumn(String title, String hours, String pay, String rate) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          hours,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          pay,
          style: const TextStyle(
            color: Colors.green,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          rate,
          style: TextStyle(
            color: Colors.blue[600],
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  Widget _buildJobList() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Today\'s Schedule',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: kTertiaryColor,
            ),
          ),
          const SizedBox(height: 20),
          _buildJobItem('9:30 AM', '11:00 AM', '1.5', 'Brad Alien'),
          const Divider(height: 24),
          _buildJobItem('11:30 AM', '2:30 PM', '3', 'John Jones'),
          const Divider(height: 24),
          _buildJobItem('3:00 PM', '5:00 PM', '2', 'Sara Hill'),
        ],
      ),
    );
  }

  Widget _buildJobItem(String start, String end, String hours, String customer) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              customer,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              '$start - $end',
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 14,
              ),
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: Colors.blue[50],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            '$hours hrs',
            style: TextStyle(
              color: Colors.blue[700],
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}

class OnboardingContent {
  final String title;
  final String? subtitle;
  final String description;
  final String icon;
  final bool showPayDashboard;
  final bool showJobList;
  final String? primaryAction;
  final String? secondaryAction;

  OnboardingContent({
    required this.title,
    this.subtitle,
    required this.description,
    required this.icon,
    this.showPayDashboard = false,
    this.showJobList = false,
    this.primaryAction,
    this.secondaryAction,
  });
}
