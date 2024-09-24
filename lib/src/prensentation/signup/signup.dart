import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:quickdrop/src/core/constants/constants.dart';
import 'package:quickdrop/src/core/extensions/string_extensions.dart';
import 'package:quickdrop/src/core/functions/page_navigation.dart';
import 'package:quickdrop/src/injection/injection_container.dart' as di;
import 'package:quickdrop/src/prensentation/login/widgets/auth_btn.dart';
import 'package:quickdrop/src/prensentation/login/widgets/divider.dart';
import 'package:quickdrop/src/prensentation/login/widgets/inputs.dart';
import 'package:quickdrop/src/prensentation/login/widgets/other_login_btn.dart';
import 'package:quickdrop/src/prensentation/login/widgets/title.dart';
import 'package:quickdrop/src/prensentation/signup/cubit/signup_cubit.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late final GlobalKey<FormState> _formKey;
  late final ScrollController _scrollController;
  late final TextEditingController _nameController;
  late final TextEditingController _lastNameController;
  late final TextEditingController _phoneController;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  final double spacing = 18.0;
  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
    _scrollController = ScrollController();
    _nameController = TextEditingController();
    _lastNameController = TextEditingController();
    _phoneController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignupCubit>(
      create: (BuildContext context) => di.sl<SignupCubit>(),
      child: Scaffold(
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
          child: BlocConsumer<SignupCubit, SignupState>(
            listener: (BuildContext context, SignupState state) {
              if (state is SignupFailure) {
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    SnackBar(
                      content: Text(state.message),
                    ),
                  );
              }
            },
            builder: (BuildContext context, SignupState state) => SafeArea(
              child: Form(
                key: _formKey,
                child: ListView(
                  controller: _scrollController,
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  children: <Widget>[
                    const AuthTitle(),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Row(
                        children: <Widget>[
                          Flexible(
                            child: AuthInput(
                              controller: _nameController,
                              isEnabled: state is! SignupLoading,
                              label: AppLocalizations.of(context)!
                                  .nameLabel
                                  .capitalize(),
                              bottomPadding: spacing,
                            ),
                          ),
                          SizedBox(
                            width: spacing,
                          ),
                          Flexible(
                            child: AuthInput(
                              controller: _lastNameController,
                              isEnabled: state is! SignupLoading,
                              label: AppLocalizations.of(context)!
                                  .lastNameLabel
                                  .capitalize(),
                              bottomPadding: spacing,
                            ),
                          )
                        ],
                      ),
                    ),
                    AuthInput(
                      controller: _phoneController,
                      isEnabled: state is! SignupLoading,
                      label:
                          AppLocalizations.of(context)!.phoneLabel.capitalize(),
                      bottomPadding: spacing,
                    ),
                    AuthInput(
                      controller: _emailController,
                      isEnabled: state is! SignupLoading,
                      label:
                          AppLocalizations.of(context)!.emailLabel.capitalize(),
                      bottomPadding: spacing,
                    ),
                    AuthInput(
                      controller: _passwordController,
                      isEnabled: state is! SignupLoading,
                      isObscure: true,
                      label: AppLocalizations.of(context)!
                          .passwordLabel
                          .capitalize(),
                      bottomPadding: spacing,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: AuthBtn(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            BlocProvider.of<SignupCubit>(context).signUp(
                              name: _nameController.text,
                              lastName: _lastNameController.text,
                              phone: _phoneController.text,
                              email: _emailController.text,
                              password: _passwordController.text,
                            );
                          }
                        },
                        disabled: state is SignupLoading,
                        label: AppLocalizations.of(context)!.signInButton,
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
                              ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 35.0),
                          child: Align(
                            alignment: Alignment.center,
                            child: InkWell(
                              onTap: () => PageNavigation.popNavigator(context),
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Text(
                                  AppLocalizations.of(context)!
                                      .haveAccount
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
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
