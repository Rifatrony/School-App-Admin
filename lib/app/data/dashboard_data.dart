import 'package:flutter/material.dart';
import 'package:srmm/app/data/app_image.dart';
import 'package:srmm/app/module/dashboard/model/dashboard_model.dart';
import 'package:srmm/app/module/dashboard/model/menu_model.dart';

class DashboardData{
  final dashboardList = <DashboardModel> [
    DashboardModel(icon: AppImage.studentIcon, value: "280", title: "Student"),
    DashboardModel(icon: AppImage.teacherIcon, value: "12", title: "Teacher"),
    DashboardModel(icon: AppImage.feesIcon, value: "545120", title: "Fees"),
    DashboardModel(icon: AppImage.salaryIcon, value: "545120", title: "Salary"),
    DashboardModel(icon: AppImage.classIcon, value: "545120", title: "Class"),
    DashboardModel(icon: AppImage.departmentIcon, value: "545120", title: "Department"),
    DashboardModel(icon: AppImage.classIcon, value: "545120", title: "Subject"),
    DashboardModel(icon: AppImage.costIcon, value: "545120", title: "Cost"),
    DashboardModel(icon: AppImage.incomeIcon, value: "545120", title: "Income"),
    DashboardModel(icon: AppImage.bodingIcon, value: "545120", title: "Boding"),

    // DashboardModel(icon: , value: , title: ),
    // DashboardModel(icon: , value: , title: ),
    // DashboardModel(icon: , value: , title: ),
  ];
}