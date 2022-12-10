import 'dart:async';
import 'dart:ui';
import 'package:biryabanci/view/widgets/TopBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:biryabanci/utils/color.dart';

class Home extends StatefulWidget {
  final onMenuTap;

  Home({this.onMenuTap});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int tabNo = 0;
  late bool overlayVisible;
  late List eduTypeList = [];
  late List idList = [];
  late List titleList = [];
  late List titlecatList = [];
  late List percentList = [];
  late List responsibilityList = [];
  late List classstatusList = [];
  late int counter = 0;
  late bool ispopup = false;
  CupertinoTabController? controller;

  late SharedPreferences logindata;

  void initialPrefs() async {
    logindata = await SharedPreferences.getInstance();
    setState(() {
   /*   id = logindata.getInt('id')!;
      firstname = logindata.getString('firstname')!;
      lastname = logindata.getString('lastname')!;
      companyid = logindata.getString('companyid')!;*/
    });
  }

  @override
  void initState() {
    initialPrefs();
    overlayVisible = false;
    controller = CupertinoTabController(initialIndex: 0);
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[

      ],
    );
  }
}

class HomePage extends StatelessWidget {
  final onMenuTap;
  final educounter;
  final firstname;


  HomePage({
    Key? key,
    required this.onMenuTap, required this.educounter, required this.firstname,
  }) : super(key: key);

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.primarycolor,
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          SafeArea(
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: <Widget>[
                SliverFixedExtentList(
                    delegate: SliverChildListDelegate.fixed([Container()]),
                    itemExtent: MediaQuery.of(context).size.height * 0.32),


              ],
            ),
          ),
          Positioned(
            top: 0,
            child: TopBar(
              controller: controller,
              expanded: true,
              onMenuTap: onMenuTap,
            ),
          )
        ],
      ),
    );
  }
}