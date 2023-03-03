import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'domain/detail_provider.dart';
import 'domain/home_provider.dart';
import 'domain/login_provider.dart';
import 'interface/detail_page.dart';
import 'interface/home_page.dart';
import 'interface/login_page.dart';

class LoginInjection {
  LoginInjection._();

  static Widget injection() {
    return ListenableProvider<LoginProvider>(
      create: (context) => LoginProvider()..onInit(),
      child: const LoginPage(),
    );
  }
}

class HomeInjection {
  HomeInjection._();

  static Widget injection() {
    return ListenableProvider<HomeProvider>(
      create: (context) => HomeProvider()..onInit(context: context),
      child: const HomePage(),
    );
  }
}

class DetailInjection {
  DetailInjection._();

  static Widget injection(data) {
    return ListenableProvider<DetailProvider>(
      create: (context) => DetailProvider()..onInit(user: data),
      child: const DetailPage(),
    );
  }
}
