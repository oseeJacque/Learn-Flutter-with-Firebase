import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttersocial/app/data/constants/assets.dart';
import 'package:fluttersocial/app/data/constants/firebase_constant.dart';
import 'package:fluttersocial/app/data/utils/app_style.dart';
import 'package:fluttersocial/app/data/utils/bar_item.dart';
import 'package:fluttersocial/app/data/utils/constants.dart';
import 'package:fluttersocial/app/data/utils/loading_circular.dart';
import 'package:fluttersocial/app/data/utils/my_gradient.dart';
import 'package:fluttersocial/app/modules/home/controllers/auth_controller_controller.dart';
import 'package:fluttersocial/app/modules/home/views/views/home_app_page.dart';
import 'package:fluttersocial/app/modules/home/views/views/login_view.dart';
import 'package:fluttersocial/app/modules/home/views/views/member_page.dart';
import 'package:fluttersocial/app/modules/home/views/views/notif_page.dart';
import 'package:fluttersocial/app/modules/home/views/views/profil_page.dart';
import 'package:fluttersocial/app/modules/home/views/views/write_post.dart';
import 'package:fluttersocial/app/modules/models/Member.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/state_manager.dart';

class HomeView extends StatefulWidget {
  final String memberUid;
  HomeView({required this.memberUid, Key? key}) : super(key: key);

  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late StreamSubscription streamSubscription;

  final AuthControllerController authControllerController =
      Get.put(AuthControllerController());
  late Member member;
  //final Member member = Member( authControllerController.fire_user.doc(widget.memberUid).snapshots().listen((event) => ));
  int index = 0;

  GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    // member =
    //     Member(authControllerController.fire_user.doc(widget.memberUid).get()[0]);
    super.initState();
    streamSubscription = authControllerController.fire_user
        .doc(widget.memberUid)
        .snapshots()
        .listen((event) {
      member = Member(event);
    });
  }

  void dispose() {
    streamSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return (member == null)
        ? const Loading()
        : Scaffold(
            key: _globalKey,
            bottomNavigationBar: BottomAppBar(
              shape: const CircularNotchedRectangle(),
              color: AppStyles.getGreyColor(context),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  BarItem(
                      icon: homeIcon,
                      onPressed: () => bottomSelected(0),
                      selected: (index == 0)),
                  BarItem(
                      icon: friendsIcon,
                      onPressed: () => bottomSelected(1),
                      selected: (index == 1)),
                  SizedBox(width: width * 0.1),
                  BarItem(
                      icon: notifIcon,
                      onPressed: () => bottomSelected(2),
                      selected: (index == 2)),
                  BarItem(
                      icon: profileIcon,
                      onPressed: () => bottomSelected(3),
                      selected: (index == 3))
                ],
              ),
            ),
            //backgroundColor: AppStyles.getYellowColor(context),
            body: showPage(),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                _globalKey.currentState!.showBottomSheet((context) => WritePost());
              },
              backgroundColor: AppStyles.getYellowColor(context),
              child: writePost,
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
          );
  }

  bottomSelected(int position) {
    setState(() {
      this.index == position;
    });
  }

  Widget showPage() {
    switch (index) {
      case 0:
        return HomePage(member: member);
        break;

      case 1:
        return MemberPage(member: member);
        break;

      case 2:
        return NotifPage(member: member);
        break;

      case 3:
        return ProfilPage(member: member);
        break;

      default:
        return HomePage(member: member);
    }
  }
}
