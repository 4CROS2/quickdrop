import 'dart:io';

import 'package:flutter/material.dart';
import 'package:quickdrop/src/core/constants/constants.dart';
import 'package:quickdrop/src/core/extensions/capitalize.dart';
import 'package:quickdrop/src/core/functions/page_navigation.dart';
import 'package:quickdrop/src/prensentation/login/widgets/auth_btn.dart';
import 'package:quickdrop/src/prensentation/login/widgets/divider.dart';
import 'package:quickdrop/src/prensentation/login/widgets/inputs.dart';
import 'package:quickdrop/src/prensentation/login/widgets/other_login_btn.dart';
import 'package:quickdrop/src/prensentation/login/widgets/title.dart';

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
                          isEnabled: true,
                          label: 'Nombre',
                          bottomPadding: spacing,
                        ),
                      ),
                      SizedBox(
                        width: spacing,
                      ),
                      Flexible(
                        child: AuthInput(
                          controller: _lastNameController,
                          isEnabled: true,
                          label: 'Apellido',
                          bottomPadding: spacing,
                        ),
                      )
                    ],
                  ),
                ),
                AuthInput(
                  controller: _phoneController,
                  isEnabled: true,
                  label: 'Telefono',
                  bottomPadding: spacing,
                ),
                AuthInput(
                  controller: _emailController,
                  isEnabled: true,
                  label: 'Correo',
                  bottomPadding: spacing,
                ),
                AuthInput(
                  controller: _passwordController,
                  isEnabled: true,
                  isObscure: true,
                  label: 'Constraseña',
                  bottomPadding: spacing,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: AuthBtn(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        /*  BlocProvider.of<LoginCubit>(context).login(
                          email: _emailController.text,
                          password: _passwordController.text,
                        ); */
                      }
                    },
                    // disabled: state is LoginLoading,
                    label: 'registrarse',
                  ),
                ),
                Column(
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 30.0),
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
                          onTap: () => popNavigator(context: context),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              'Ya tienes una cuenta?',
                              style: TextStyle(
                                fontFamily: 'RedHat',
                                color: Constants.primaryColor,
                                fontSize: 20,
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
    );
  }
}
