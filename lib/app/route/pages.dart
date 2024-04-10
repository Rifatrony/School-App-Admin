import 'package:get/get.dart';
import 'package:srmm/app/module/home/bindings/home_bindings.dart';
import 'package:srmm/app/module/home/view/home_view.dart';
import 'package:srmm/app/module/login/bindings/login_bindings.dart';
import 'package:srmm/app/module/login/view/login_view.dart';
import 'package:srmm/app/module/student/bindings/student_binding.dart';
import 'package:srmm/app/module/student/view/add_student.dart';
import 'package:srmm/app/module/student/view/student_details_view.dart';
import 'package:srmm/app/module/student/view/student_view.dart';
import 'package:srmm/app/module/teacher/binding/teacher_binding.dart';
import 'package:srmm/app/module/teacher/view/add_teacher.dart';
import 'package:srmm/app/module/teacher/view/teacher_view.dart';
import 'package:srmm/app/route/routes.dart';

import '../module/splash/bindings/splash_bindings.dart';
import '../module/splash/view/splash_view.dart';

class AppPages {
  static const INITIAL = RouteName.splash;

  static final routes = [
    GetPage(
      name: RouteName.splash,
      page: () => const SplashView(),
      binding: SplashBindings(),
    ),

    GetPage(
      name: RouteName.login,
      page: () => LoginView(),
      binding: LoginBindings(),
    ),

    GetPage(
      name: RouteName.home,
      page: () => const HomeView(),
      binding: HomeBindings(),
    ),

    GetPage(
      name: RouteName.viewStudent,
      page: () => const StudentView(),
      binding: StudentBinding(),
    ),

    GetPage(
      name: RouteName.addStudent,
      page: () => const AddStudent(),
      binding: StudentBinding(),
    ),

    GetPage(
      name: RouteName.viewStudentDetails,
      page: () => const StudentDetailsView(),
      binding: StudentBinding(),
    ),

    GetPage(
      name: RouteName.addTeacher,
      page: () => const AddTeacherView(),
      binding: TeacherBindings(),
    ),

    GetPage(
      name: RouteName.viewTeacher,
      page: () => const TeacherView(),
      binding: TeacherBindings(),
    ),

  ];
}