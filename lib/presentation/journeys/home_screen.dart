import 'package:flutter/material.dart';
import 'package:sportzride/presentation/journeys/exchange/exchange_screen.dart';
import 'package:sportzride/presentation/journeys/explore/explore_screen.dart';
import 'package:sportzride/presentation/journeys/engage/feed_screen.dart';
import 'package:sportzride/presentation/journeys/wallet/wallet_screen.dart';
import 'package:sportzride/presentation/resources/app_theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static open(context) => Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => const HomeScreen()));

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;
  List listOfScreens = [
    const ExploreScreen(),
    const ExchangeScreen(),
    const FeedScreen(),
    const WalletScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: listOfScreens[index],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          indicatorColor: Colors.red.shade100,
          labelTextStyle: MaterialStateProperty.all(const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w800,
            color: AppTheme.powder,
          )),
        ),
        child: NavigationBar(
          height: 60,
          backgroundColor: AppTheme.secondaryc,
          selectedIndex: index,
          onDestinationSelected: (index) => setState(() => this.index = index),
          destinations: const [
            NavigationDestination(
                icon: Icon(
                  Icons.explore_outlined,
                  color: Colors.white,
                ),
                selectedIcon: Icon(Icons.explore),
                label: 'Explore'),
            NavigationDestination(
                icon: Icon(
                  Icons.analytics_outlined,
                  color: Colors.white,
                ),
                selectedIcon: Icon(Icons.analytics),
                label: 'Exchange'),
            NavigationDestination(
                icon: Icon(
                  Icons.interests,
                  color: Colors.white,
                ),
                selectedIcon: Icon(Icons.interests),
                label: 'Engage'),
            NavigationDestination(
                icon: Icon(
                  Icons.account_balance_wallet_outlined,
                  color: Colors.white,
                ),
                selectedIcon: Icon(Icons.account_balance_wallet),
                label: 'Wallet'),
          ],
        ),
      ),
    );
  }
}
