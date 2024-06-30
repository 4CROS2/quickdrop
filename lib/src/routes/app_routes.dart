import 'package:flutter/material.dart';
import 'package:quickdrop/src/prensentation/app/cubit/app_cubit.dart';
import 'package:quickdrop/src/prensentation/home/home.dart';
import 'package:quickdrop/src/prensentation/loading/loading.dart';
import 'package:quickdrop/src/prensentation/login/login.dart';

class AppRoutes {
  static List<Page<dynamic>> generateRoute(
    AppStatus status,
    List<Page<dynamic>> pages,
  ) {
    switch (status) {
      case AppStatus.unauthenticated:
        return <Page<dynamic>>[Login.page()];
      case AppStatus.authenticated:
        return <Page<dynamic>>[Home.page()];
      case AppStatus.loading:
        return <Page<dynamic>>[LoadingPage.page()];
    }
  }
}
