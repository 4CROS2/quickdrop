import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:quickdrop/src/core/constants/constants.dart';
import 'package:quickdrop/src/core/extensions/string_extensions.dart';
import 'package:quickdrop/src/core/functions/page_navigation.dart';
import 'package:quickdrop/src/core/functions/validators.dart';
import 'package:quickdrop/src/injection/injection_container.dart';
import 'package:quickdrop/src/prensentation/login/cubit/login_cubit.dart';
import 'package:quickdrop/src/prensentation/login/widgets/auth_btn.dart';
import 'package:quickdrop/src/prensentation/login/widgets/divider.dart';
import 'package:quickdrop/src/prensentation/login/widgets/inputs.dart';
import 'package:quickdrop/src/prensentation/login/widgets/other_login_btn.dart';
import 'package:quickdrop/src/prensentation/login/widgets/title.dart';
import 'package:quickdrop/src/prensentation/signup/signup.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();

  static Page<Login> page() => const MaterialPage<Login>(
        child: Login(),
      );
}

class _LoginState extends State<Login> {
  late final ScrollController _scrollController;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final GlobalKey<FormState> _formKey;
  late AppLocalizations _localizations;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _formKey = GlobalKey<FormState>();
  }

  @override
  void didChangeDependencies() {
    _localizations = AppLocalizations.of(context)!;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  String _localizationResponse({required String code}) {
    switch (code) {
      case '500':
        return _localizations.invalidCredential;
      case '501':
        return _localizations.invalidEmail;
      case '502':
        return _localizations.userDisabled;
      case '503':
        return _localizations.userNotFound;
      case '504':
        return _localizations.wrongPassword;
      default:
        return _localizations.unknownError;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginCubit>(
      create: (BuildContext context) => sl<LoginCubit>(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (BuildContext context, LoginState state) {
          if (state is LoginError) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: Text(
                    _localizationResponse(code: state.message),
                  ),
                ),
              );
          }
        },
        builder: (BuildContext context, LoginState state) {
          return Scaffold(
            body: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  stops: const <double>[.54, 1],
                  end: Alignment.bottomCenter,
                  colors: <Color>[
                    Constants.primaryColor,
                    Colors.white,
                  ],
                ),
              ),
              child: SafeArea(
                child: Form(
                  key: _formKey,
                  child: ListView(
                    controller: _scrollController,
                    physics: const BouncingScrollPhysics(),
                    keyboardDismissBehavior:
                        ScrollViewKeyboardDismissBehavior.onDrag,
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    children: <Widget>[
                      const AuthTitle(),
                      const SizedBox(
                        height: 90,
                      ),
                      AuthInput(
                        isEnabled: state is! LoginLoading,
                        controller: _emailController,
                        label: AppLocalizations.of(context)!
                            .emailLabel
                            .capitalize(),
                        validator: emailvalidator,
                      ),
                      AuthInput(
                        isEnabled: state is! LoginLoading,
                        controller: _passwordController,
                        label: AppLocalizations.of(context)!
                            .passwordLabel
                            .capitalize(),
                        isObscure: true,
                        validator: passwordValidator,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          AppLocalizations.of(context)!
                              .passwordRecovery
                              .capitalize(),
                          style: TextStyle(
                            color: Colors.white.withOpacity(.80),
                            fontFamily: 'RedHat',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 25),
                        child: AuthBtn(
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              BlocProvider.of<LoginCubit>(context).login(
                                email: _emailController.text,
                                password: _passwordController.text,
                              );
                            }
                          },
                          disabled: state is LoginLoading,
                          label: AppLocalizations.of(context)!.loginButton,
                        ),
                      ),
                      Column(
                        children: <Widget>[
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 15.0),
                            child: AuthDivider(),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Expanded(
                                child: OtherLoginBtn(
                                  onTap: () {},
                                  image: 'assets/images/svg/google.svg',
                                  label: 'google'.capitalize(),
                                ),
                              ),
                              if (Platform.isIOS)
                                Flexible(
                                  child: Row(
                                    children: <Widget>[
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Flexible(
                                        child: OtherLoginBtn(
                                          onTap: () {},
                                          image: 'assets/images/svg/apple.svg',
                                          label: 'iCloud',
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 35.0),
                        child: Align(
                          alignment: Alignment.center,
                          child: InkWell(
                            onTap: () => PageNavigation.pushNavigator(context,
                                page: const SignUp()),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                AppLocalizations.of(context)!
                                    .newUser
                                    .capitalize(),
                                style: TextStyle(
                                  fontFamily: 'RedHat',
                                  color: Constants.primaryColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
