import 'package:flutter/material.dart';
import '../const.dart';
import '../customeWidget/boxWidget.dart';
import '../customeWidget/textWidget.dart';
import 'dashboard_widget.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final menuItems = [
    {'icon': Icons.home, 'title': 'Overview'},
    {'icon': Icons.grid_view_rounded, 'title': 'Course'},
    {'icon': Icons.file_copy_outlined, 'title': 'Resources'},
    {'icon': Icons.message, 'title': 'Message'},
    {'icon': Icons.settings, 'title': 'Setting'},
  ];

  final List<Map<String, String>> planningData = [
    {
      'image': 'asset/readingImage.png',
      'topic': 'Reading - Beginner Topic 1',
      'time': '8:00 AM - 10:00 AM'
    },
    {
      'image': 'asset/headPhone.png',
      'topic': 'Reading',
      'time': '10:00 AM - 12:00 PM'
    },
    {
      'image': 'asset/speakerIcon.png',
      'topic': 'Speaking - Advanced Topic 1',
      'time': '1:00 PM - 2:00 PM'
    },
    {
      'image': 'asset/readingImage.png',
      'topic': 'Reading - Beginner Topic 1',
      'time': '3:00 PM - 4:00 PM'
    },
    {
      'image': 'asset/headPhone.png',
      'topic': 'Listening - Intermediate Topic 1',
      'time': '5:00 PM - 6:00 PM'
    },
  ];

  int selectedIndex = 0;
  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Sidebar Menu
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.white,
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                          height: 20,
                          width: 20,
                          child: Image.asset(
                            'asset/network.png',
                          )),
                      const SizedBox(
                        width: 10,
                      ),
                      const CustomText(
                        text: "SE • T",
                        weight: FontWeight.w900,
                        fontSize: TextSizes.large,
                        color: AppColors.primaryBlue,
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  Expanded(
                      child: ListView.builder(
                          itemCount: menuItems.length,
                          itemBuilder: (context, index) {
                            final item = menuItems[index];
                            return SidebarMenuItem(
                                icon: item['icon'] as IconData,
                                title: item['title'] as String,
                                isSelected:
                                    selectedIndex == index, // Check if selected
                                onTap: () {
                                  setState(() {
                                    selectedIndex =
                                        index; // Update selected index
                                  });
                                });
                          })),
                  SizedBox(
                    height: 300,
                    child: Image.asset(
                      'asset/human.png',
                      width: 150,
                    ),
                  ),
                  GestureDetector(
                      onTap: () {},
                      child: CustomBox(
                        radius: 10,
                        fillColor: AppColors.lightBlueBackground,
                        child: const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text: "Upgrade your plan",
                                color: Colors.black,
                                fontSize: TextSizes.medium,
                              ),
                              CustomText(
                                text: "Go to PRO",
                                color: AppColors.primaryBlue,
                                fontSize: TextSizes.small,
                              ),
                            ],
                          ),
                        ),
                      )),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),

          // Main Content
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                height: double.infinity,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Header Section
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                    text: 'Hello ',
                                    style: TextStyle(
                                        color: AppColors.primaryBlue,
                                        fontSize: TextSizes.regular)),
                                TextSpan(
                                  text: 'BRUNO',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.primaryBlue,
                                      fontSize: TextSizes.regular),
                                ),
                                TextSpan(
                                  text: ', welcome back!',
                                  style: TextStyle(
                                      color: AppColors.primaryBlue,
                                      fontSize: TextSizes.regular),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          // My Courses Section
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  const CustomText(
                                    text: "My Courses",
                                    fontSize: TextSizes.midLarge,
                                    weight: FontWeights.bold,
                                  ),
                                  const SizedBox(width: 5),
                                  TextButton(
                                      onPressed: () {},
                                      child: const CustomText(
                                        text: 'View All',
                                        color: AppColors.primaryBlue,
                                      ))
                                ],
                              ),
                              SizedBox(
                                width: 200,
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                      labelText: 'Search',
                                      prefixIcon: Icon(
                                        Icons.search,
                                        color: AppColors.textGrey,
                                      ),
                                      border: InputBorder.none),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(child: Image.asset('asset/french.png')),
                              const SizedBox(width: 10),
                              Expanded(
                                  child: Image.asset('asset/portugese.png')),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Expanded(
                                  child:
                                      Image.asset('asset/italianCourse.png')),
                              const SizedBox(width: 10),
                              Expanded(child: Image.asset('asset/german.png')),
                            ],
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),
                      // Planning Section
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  const CustomText(
                                      text: "Planning",
                                      weight: FontWeights.bold,
                                      fontSize: TextSizes.large),
                                  TextButton(
                                      onPressed: () {},
                                      child: const CustomText(
                                        text: 'View All',
                                        color: AppColors.textBlue,
                                      ))
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.calendar_month),
                                    onPressed: () => selectDate(context),
                                  ),
                                  const SizedBox(width: 10),
                                  CustomText(
                                    text: selectedDate == null
                                        ? DateTime.now()
                                            .toString()
                                            .split(' ')[0]
                                        : selectedDate!
                                            .toLocal()
                                            .toString()
                                            .split(' ')[0],
                                    fontSize: TextSizes.regular,
                                    color: AppColors.primaryBlue,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Flexible(
                                child: SizedBox(
                                  height: 300,
                                  child: ListView.builder(
                                    itemCount: planningData.length,
                                    itemBuilder: (context, index) {
                                      final item = planningData[index];
                                      return PlanningCard(
                                        image: item['image']!,
                                        topic: item['topic']!,
                                        time: item['time']!,
                                      );
                                    },
                                  ),
                                ),
                              ),
                              Flexible(
                                child: SizedBox(
                                  height: 300,
                                  child: ListView.builder(
                                    itemCount: planningData.length,
                                    itemBuilder: (context, index) {
                                      final item = planningData[index];
                                      return PlanningCard(
                                        image: item['image']!,
                                        topic: item['topic']!,
                                        time: item['time']!,
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          // Right Sidebar (Statistics and Activity)
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Profile Section
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(Icons.notifications_none_rounded,
                            color: AppColors.textGrey),
                        CustomBox(
                          fillColor: AppColors.lightBlueBackground,
                          radius: 10,
                          width: 240,
                          child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Row(
                              children: [
                                const CircleAvatar(
                                    radius: 20, child: Icon(Icons.person)),
                                const SizedBox(width: 10),
                                const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(
                                      text: "Bruno Fernandes",
                                      fontSize: TextSizes.medium,
                                    ),
                                    CustomText(
                                      text: "Basic Plan",
                                      fontSize: TextSizes.medium,
                                      color: AppColors.primaryBlue,
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                      Icons.keyboard_arrow_down_rounded),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    // Statistics
                    const CustomText(
                      text: "Statistics",
                      fontSize: TextSizes.large,
                      weight: FontWeights.bold,
                    ),
                    const SizedBox(height: TextSizes.large),
                    SizedBox(
                      height: 350, // Set finite height for the grid
                      child: GridView.count(
                        crossAxisCount: 2,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5,
                        // shrinkWrap: true,
                        // physics: const NeverScrollableScrollPhysics(),
                        children: const [
                          StatisticCard(
                              title: "Courses\nCompleted", value: "02"),
                          StatisticCard(
                              title: "Total Points\nGained", value: "250"),
                          StatisticCard(
                              title: "Courses In \nProgress", value: "03"),
                          StatisticCard(title: "Tasks \nFinished", value: "05"),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Activity
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          text: "Activity",
                          weight: FontWeights.bold,
                          fontSize: TextSizes.large,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(text: "Day"),
                            SizedBox(
                              width: 10,
                            ),
                            CustomText(
                              text: "Week",
                              color: AppColors.primaryBlue,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            CustomText(text: "Month"),
                            SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                      ],
                    ),
                    activityChart(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
