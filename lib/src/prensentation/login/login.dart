import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickdrop/src/injection/injection_container.dart' as di;
import 'package:quickdrop/src/prensentation/login/cubit/login_cubit.dart';

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
            body: ListView(
              controller: _scrollController,
              children: <Widget>[
                TextFormField(
                  controller: _emailController,
                ),
                TextFormField(
                  controller: _passwordController,
                ),
                ElevatedButton(
                  onPressed: () {
                    final String email = _emailController.text;
                    final String password = _passwordController.text;
                    BlocProvider.of<LoginCubit>(context).login(
                      email: email,
                      password: password,
                    );
                  },
                  child: const Text('login'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
