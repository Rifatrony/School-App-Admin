import 'package:flutter/material.dart';
import 'package:srmm/app/module/dashboard/model/menu_model.dart';

class SideMenuData{
  final menu = const<MenuModel> [
    MenuModel(icon: Icons.home, title: "Dashboard",),
    MenuModel(icon: Icons.person, title: "Student",),
    MenuModel(icon: Icons.person, title: "Teacher",),
    MenuModel(icon: Icons.person, title: "Cost",),
    MenuModel(icon: Icons.person, title: "Income",),
    MenuModel(icon: Icons.person, title: "Attendance",),
    MenuModel(icon: Icons.person, title: "Calender",),
    MenuModel(icon: Icons.person, title: "Notice",),
    MenuModel(icon: Icons.settings, title: "Settings",),
    MenuModel(icon: Icons.settings, title: "Settings",),
    MenuModel(icon: Icons.logout, title: "Logout",),
  ];
}