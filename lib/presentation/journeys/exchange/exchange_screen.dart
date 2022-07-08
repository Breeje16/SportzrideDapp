import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportzride/presentation/journeys/exchange/price_card_tile_widget.dart';
import 'package:sportzride/presentation/resources/app_theme.dart';
import 'package:sportzride/presentation/widget/sr_drawer.dart';

class ExchangeScreen extends StatefulWidget {
  const ExchangeScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ExchangeScreenState createState() => _ExchangeScreenState();
}

class _ExchangeScreenState extends State<ExchangeScreen> {
  TextEditingController searchText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.bgMain,
        elevation: 0,
        title: const Text(
          "Trade",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        actions: [
          SizedBox(
            height: 50.h,
            width: 50.w,
            child: Image.asset("assets/images/logo.png"),
          ),
        ],
      ),
      drawer: const SRDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   crossAxisAlignment: CrossAxisAlignment.center,
            //   children: [
            //     SizedBox(
            //       height: 80.h,
            //       width: MediaQuery.of(context).size.width * 0.75,
            //       child: Padding(
            //         padding:
            //             EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
            //         child: TextField(
            //           controller: searchText,
            //           decoration: const InputDecoration(
            //             prefixIcon: Icon(
            //               Icons.search,
            //               color: Colors.white,
            //             ),
            //             border: UnderlineInputBorder(
            //               borderSide: BorderSide(
            //                 color: AppTheme.label300,
            //                 width: 10.0,
            //                 style: BorderStyle.solid,
            //               ),
            //             ),
            //             hintText: 'Search',
            //             hintStyle: TextStyle(
            //               color: Colors.white,
            //             ),
            //             enabledBorder: UnderlineInputBorder(
            //                 borderSide: BorderSide(
            //                     color: AppTheme.label300, width: 3.0)),
            //             focusedBorder: UnderlineInputBorder(
            //                 borderSide:
            //                     BorderSide(color: Colors.white, width: 3.0)),

            //             focusColor: Colors.white,
            //             // enabledBorder: OutlineInputBorder(
            //             //   borderSide:
            //             //       BorderSide(width: 3.w, color: AppColor.blueMainDark),
            //             //   borderRadius: BorderRadius.circular(15.r),
            //             // ),
            //             // focusedBorder: OutlineInputBorder(
            //             //   borderSide:
            //             //       BorderSide(width: 3.w, color: AppColor.blueMainDark),
            //             //   borderRadius: BorderRadius.circular(15.r),
            //             // ),
            //           ),
            //         ),
            //       ),
            //     ),
            //     SizedBox(
            //       width: 16.w,
            //     ),
            //     Container(
            //       height: 80.h,
            //       padding: EdgeInsets.only(bottom: 16.w, right: 12.h),
            //       child: const Icon(
            //         Icons.filter_alt,
            //         color: Colors.white,
            //         size: 30,
            //       ),
            //     ),
            //   ],
            // ),

            Column(
              children: [
                PriceCardTileWidget(
                  coinName: 'CSK/SZR',
                  growth: '2.36%',
                  logoURL: 'assets/icons/csk.png',
                  price: '2.25',
                ),
                PriceCardTileWidget(
                  coinName: 'RCB/SZR',
                  growth: '1.63%',
                  logoURL: 'assets/icons/rcb.png',
                  price: '3.13',
                ),
                PriceCardTileWidget(
                  coinName: 'MI/SZR',
                  growth: '3.46%',
                  logoURL: 'assets/icons/mi.png',
                  price: '3.00',
                ),
                PriceCardTileWidget(
                  coinName: 'PBKS/SZR',
                  growth: '0.36%',
                  logoURL: 'assets/icons/pbks.png',
                  price: '1.68',
                ),
                PriceCardTileWidget(
                  coinName: 'RR/SZR',
                  growth: '0.14%',
                  logoURL: 'assets/icons/rr.png',
                  price: '1.96',
                ),
                PriceCardTileWidget(
                  coinName: 'KKR/SZR',
                  growth: '3.26%',
                  logoURL: 'assets/icons/kkr.png',
                  price: '2.63',
                ),
                PriceCardTileWidget(
                  coinName: 'DC/SZR',
                  growth: '1.35%',
                  logoURL: 'assets/icons/dc.png',
                  price: '2.15',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
