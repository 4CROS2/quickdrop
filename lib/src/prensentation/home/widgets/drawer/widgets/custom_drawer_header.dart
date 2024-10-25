import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickdrop/src/prensentation/app/cubit/app_cubit.dart';

class CustomDrawerHeader extends StatefulWidget {
  const CustomDrawerHeader({super.key});

  @override
  State<CustomDrawerHeader> createState() => _CustomDrawerHeaderState();
}

class _CustomDrawerHeaderState extends State<CustomDrawerHeader> {
  late final AppState _appState;

  @override
  void initState() {
    super.initState();
    _appState = context.read<AppCubit>().state;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {},
        child: SizedBox(width: double.infinity,
          child: CachedNetworkImage(
            imageUrl: _appState.user.photo,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
