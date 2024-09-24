import 'package:flutter/material.dart';
import 'package:quickdrop/src/prensentation/home/widgets/drawer/drawer.dart';
import 'package:quickdrop/src/prensentation/home/widgets/header/header.dart';
import 'package:quickdrop/src/prensentation/home/widgets/products/products.dart';
import 'package:quickdrop/src/prensentation/home/widgets/promotions/promotions.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const HomeDrawer(),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverPersistentHeader(
            delegate: HomeHeader(),
            pinned: true,
          ),
          const SliverToBoxAdapter(
            child: PromotionsAndDiscounts(),
          ),
          const Products()
        ],
      ),
    );
  }
}
