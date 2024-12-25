import 'package:flutter/material.dart';

import '../const.dart';
import '../customeWidget/boxWidget.dart';
import '../customeWidget/textWidget.dart';

class SidebarMenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool isSelected; // Add a property to track selection state
  final VoidCallback onTap; // Add a callback to handle selection

  const SidebarMenuItem({
    super.key,
    required this.icon,
    required this.title,
    required this.isSelected, // Pass selection state
    required this.onTap, // Handle taps
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap, // Trigger the callback when tapped
      selected: isSelected, // Set the selected state
      selectedColor: Colors.blue, // Change color when selected
      hoverColor: Colors.black.withOpacity(0.1),
      leading: Icon(
        icon,
        color: isSelected ? Colors.blue : Colors.grey, // Change icon color
      ),
      title: CustomText(
        text: title,
        color: isSelected ? Colors.blue : Colors.black,
        weight: isSelected ? FontWeight.bold : FontWeight.normal,
      ),
      trailing: Icon(
        Icons.circle,
        size: 10,
        color: isSelected
            ? Colors.blue
            : Colors.transparent, // Keep a consistent trailing icon color
      ),
    );
  }
}

// Course Card
class CourseCard extends StatelessWidget {
  const CourseCard();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          image: const DecorationImage(image: AssetImage('asset/french.png')),
          // color: color.withOpacity(0.2),
          borderRadius: BorderRadius.circular(10),
        ),
        // child: Column(
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: [
        //     CustomText(
        //       text: title,
        //       fontSize: TextSizes.medium + 2,
        //       weight: FontWeights.bold,
        //     ),
        //     CustomText(text: "$lessons lessons"),
        //     Spacer(),
        //     CustomText(
        //       text: "$progress% complete",
        //       weight: FontWeights.bold,
        //     ),
        //   ],
        // ),
      ),
    );
  }
}

// Planning Card
class PlanningCard extends StatelessWidget {
  final String topic;
  final String time;
  final String image;

  const PlanningCard(
      {required this.topic, required this.time, required this.image});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.asset(
          image,
          height: 50,
          width: 50,
        ),
        title: CustomText(
          text: topic,
          weight: FontWeights.medium,
        ),
        subtitle: CustomText(
          text: time,
          color: Colors.grey,
          weight: FontWeights.regular,
        ),
        trailing: IconButton(
            onPressed: () {}, icon: const Icon(Icons.more_vert_outlined)),
      ),
    );
  }
}

// Statistic Card
class StatisticCard extends StatelessWidget {
  final String title;
  final String value;

  const StatisticCard({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: CustomBox(
        radius: 10,
        fillColor: AppColors.lightBlueBackground,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: CustomText(
                text: title,
                align: TextAlign.start,
                fontSize: TextSizes.medium + 2,
                color: AppColors.textBlue.withOpacity(0.7),
              ),
            ),
            const SizedBox(height: 5),
            CustomBox(
              height: 100, // Ensure height for divider visibility
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const VerticalDivider(
                    color: Colors.blue,
                    thickness: 5.0,
                    indent: 50.0,
                    endIndent: 10.0,
                    width: 20,
                  ),
                  CustomText(
                    text: value,
                    weight: FontWeights.bold,
                    fontSize: TextSizes.jumbo,
                    color: AppColors.textBlue,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget activityChart() {
  final days = ["Mon", "Tue", "Wed", "Thur", "Fri", "Sat", "Sun"];

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      const SizedBox(
        height: 20,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: List.generate(
          7,
          (index) => Column(
            children: [
              CustomBox(
                radius: 10,
                height: (index == 3 ? 100 : 50),
                width: 10,
                fillColor: index == 3
                    ? Colors.blue
                    : AppColors.primaryBlue.withOpacity(0.5),
                child: const Text(''),
              ),
              const SizedBox(
                height: 10,
              ),
              CustomText(
                text: days[index],
                fontSize: TextSizes.medium,
              )
            ],
          ),
        ),
      ),
    ],
  );
}

DateTime? selectedDate;

selectDate(BuildContext context) async {
  // Show the DatePicker dialog
  final DateTime? picked = await showDatePicker(
    context: context,
    initialDate: selectedDate ?? DateTime.now(), // Default to current date
    firstDate: DateTime(2000), // First allowed date
    lastDate: DateTime(2101), // Last allowed date
  );

  if (picked != null && picked != selectedDate) selectedDate = picked;

  return selectedDate; // Update the selected date
}
