import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quran_app/core/constants/app_colors.dart';
import 'package:quran_app/core/constants/app_images.dart';
import 'package:quran_app/features/calendar/calendar_page.dart';
import 'package:quran_app/features/focus/focus_page.dart';
import 'package:quran_app/features/todo_request/add_todo_page/add_todo_page.dart';
import 'package:quran_app/features/todo_list/todo_list_page.dart';
import 'package:quran_app/features/user_profile/user_profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;


  List<Widget> get _screens => const [
    TodoListPage(),
    CalendarPage(),
    FocusPage(),
    UserProfilePage(),
  ];

  List<String> get _screensTitles => const [
    "Home",
    "Calendar",
    "Focus",
    "User Profile",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_screensTitles[_currentIndex]),
        leading: _currentIndex != 0 ? const SizedBox() : IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(AppSvg.sortIcon),
        ),
        actions: _currentIndex != 0 ? [] : [
          Container(
            width: 42,
            height: 42,
            margin: const EdgeInsets.only(right: 16),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(
                    "https://userstock.io/data/wp-content/uploads/2017/09/bewakoof-com-official-205182.jpg"),
              ),
            ),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        backgroundColor: AppColors.primaryColor,
        child: SvgPicture.asset(
          AppSvg.add,
          width: 32,
          height: 32,
        ),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            backgroundColor: AppColors.sheetBackgroundColor,
            isScrollControlled: true,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            ),
            builder: (context) => const AddTodoPage(),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // This is all you need!
        backgroundColor: const Color(0xff363636),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(0.87),
        currentIndex: _currentIndex,
        onTap: (index) {
          _currentIndex = index;
          setState(() {

          });
        },
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppSvg.homeOutline),
            activeIcon: SvgPicture.asset(AppSvg.home),
            label: "Home"
          ),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(AppSvg.calendar),
              activeIcon: SvgPicture.asset(AppSvg.calendarFill),
              label: "Calendar",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppSvg.clock),
            activeIcon: SvgPicture.asset(AppSvg.clockFill),
            label: "Calendar",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppSvg.user),
            activeIcon: SvgPicture.asset(AppSvg.user),
            label: "User",
          ),
        ],
      ),
      body: _screens[_currentIndex],
    );
  }
}
