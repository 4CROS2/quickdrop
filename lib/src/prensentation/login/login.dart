import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickdrop/src/core/constants/constants.dart';
import 'package:quickdrop/src/injection/injection_container.dart' as di;
import 'package:quickdrop/src/prensentation/login/cubit/login_cubit.dart';
import 'package:quickdrop/src/prensentation/login/widgets/auth_btn.dart';
import 'package:quickdrop/src/prensentation/login/widgets/inputs.dart';
import 'package:quickdrop/src/prensentation/login/widgets/title.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late final ScrollController _scrollController;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginCubit>(
      create: (BuildContext context) => di.sl<LoginCubit>(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (BuildContext context, LoginState state) {
          if (state is LoginSuccess) {
            Navigator.pushReplacementNamed(context, '/home');
          } else if (state is LoginError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
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
                  stops: const <double>[.34, 1],
                  end: Alignment.bottomCenter,
                  colors: <Color>[
                    Constants.primaryColor,
                    Colors.white,
                  ],
                ),
              ),
              child: SafeArea(
                child: ListView(
                  controller: _scrollController,
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  children: <Widget>[
                    const AuthTitle(),
                    const SizedBox(
                      height: 90,
                    ),
                    AuthInput(
                      isEnabled: true,
                      controller: _emailController,
                      label: 'Email',
                    ),
                    AuthInput(
                      isEnabled: true,
                      controller: _passwordController,
                      label: 'Password',
                      isObscure: true,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        '¿Olvidaste la contraseña?',
                        style: TextStyle(
                          color: Colors.white.withOpacity(.80),
                          fontFamily: 'RedHat',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: AuthBtn(
                        onTap: () {},
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
