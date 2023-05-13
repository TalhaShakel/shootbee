import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shootbee/Viwes/Utils/MyTextFromField.dart';
import 'package:shootbee/Viwes/Utils/Service&Function.dart';
import 'package:velocity_x/velocity_x.dart';

import '../Utils/AppColors.dart';
import '../Utils/MyText.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({Key? key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen>
    with SingleTickerProviderStateMixin {
  var searchfield = TextEditingController();
  late TabController tabController;
  List<Widget> _tabViews = [SearchPost(), Peopels()];

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
    // Listen to tab changes and update the views
    tabController.addListener(() {
      setState(() {
        _tabViews = [
          SearchPost(),
          Peopels(),
        ];
      });
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          20.h.heightBox,
          MyTextField(
            hintText: "Search posts",
            controller: searchfield,
            pIcon: Icons.search,
          ),
          TabBar(
            controller: tabController,
            tabs: [
              Tab(
                text: 'Post',
              ),
              Tab(
                text: 'People',
              ),
            ],
            labelColor: Colors.black,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Use the _tabViews list to show the current view
                  _tabViews[tabController.index],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Peopels extends StatelessWidget {
  const Peopels({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        title: "Talha".text.make(),
        subtitle: "talha@gmail.com".text.make(),
      ),
    );
  }
}

class SearchPost extends StatelessWidget {
  const SearchPost({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 20,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 4.0,
            mainAxisExtent: 272),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              // Get.to(() => PostScreen());
            },
            child: Container(
              height: 272,
              // width: MediaQuery.of(context).size.width * .4,
              decoration: BoxDecoration(
                  image: const DecorationImage(
                      image: AssetImage('assets/ImageGirl.png'),
                      fit: BoxFit.cover),
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(8)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                          image: const DecorationImage(
                              image: AssetImage('assets/GirlImage.png')),
                          shape: BoxShape.circle,
                          border:
                              Border.all(color: MyColor.orangeColor, width: 2)),
                    ),
                    Utils.horizontalSpacer(8),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyText(
                          text: 'Alex_Henderson',
                          fontsize: 10,
                          fontcolor: Colors.white,
                        ),
                        MyText(
                            text: 'te5min agoxt',
                            fontsize: 8,
                            fontweight: FontWeight.w500,
                            fontcolor: Colors.white.withOpacity(.7))
                      ],
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Row(
                        children: [
                          MyText(
                              text: '48',
                              fontsize: 10,
                              fontcolor: Colors.white.withOpacity(.7)),
                          Icon(Icons.heart_broken_outlined,
                              size: 10, color: Colors.white.withOpacity(.7)),
                        ],
                      ),
                    ),
                    // Utils.horizontalSpacer(5),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
