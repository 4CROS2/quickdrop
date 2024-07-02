import 'package:flutter/material.dart';
import 'package:quickdrop/src/core/constants/constants.dart';
import 'package:quickdrop/src/domain/usecase/login_usecase.dart';
import 'package:quickdrop/src/injection/injection_container.dart' as di;
import 'package:quickdrop/src/prensentation/home/widgets/promotions.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();

  static Page<Home> page() => const MaterialPage<Home>(
        child: Home(),
        name: 'home',
        maintainState: true,
        allowSnapshotting: true,
      );
}

class _HomeState extends State<Home> {
  final AuthUseCase fire = di.sl<AuthUseCase>();
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          stops: const <double>[0, .2],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color>[
            Constants.primaryColor,
            Colors.white,
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: const Text(
            'location',
            style: TextStyle(fontFamily: 'RedHat'),
          ),
          centerTitle: true,
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: InkWell(
                onTap: () {},
                enableFeedback: true,
                splashColor: Colors.white.withOpacity(.5),
                borderRadius: Constants.mainBorderRadius * 2,
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.shopping_cart_outlined),
                ),
              ),
            )
          ],
        ),
        drawer: const Drawer(),
        body: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            const PromotionsAndDiscounts(),
            ElevatedButton(
                onPressed: () {
                  fire.logout();
                },
                child: const Text('exit'))
          ],
        ),
      ),
    );
  }
}
