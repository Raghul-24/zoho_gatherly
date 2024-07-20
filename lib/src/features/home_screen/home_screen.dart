import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zoho_gatherly/src/features/home_screen/stalls_card.dart';
import 'package:zoho_gatherly/src/model/stalls_model.dart';
import 'package:zoho_gatherly/src/routing/route_constants.dart';
import 'package:zoho_gatherly/src/ui_utils/app_assets.dart';
import 'package:zoho_gatherly/src/ui_utils/text_styles.dart';
import 'package:zoho_gatherly/src/utils/src/colors/app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var splashContent = [
    {
      "date":"213se2",
      "companyName": "agirdftae",
      "images":AppAssets.homeIcon,
      "header": "Your Safetsrgdy,Our \nPriority",
      "files": "Welcome to Incisfgdfdent Reporting, where \nevery report matters"
    },
    {
      "date":"21ser32",
      "companyName": "agitae",
      "images":AppAssets.homeIcon,
      "header": "Your Safety,Our \nPriority",
      "files": "Welcome to Incident Reporsfdgting, where \nevery report matters"
    },
    {
      "date":"21wer32",
      "companyName": "agitae",
      "images":AppAssets.homeIcon,
      "header": "Your Safety,Our \nPriorsgfdity",
      "files": "Welcome to Incident Reportisgfdng, where \nevery report matters"
    },
  ];
  @override
  Widget build(BuildContext context) {
    var splash = splashContent;
    List<StallsModel> splashList =
    splash.map((sample) => StallsModel.fromJson(sample)).toList();
    return
    Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10,),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
                  elevation: 1,
                  color: AppColors.whiteColor,
                  child: TextField(
                    decoration: InputDecoration(prefixIcon: Icon(Icons.search),
                    border: InputBorder.none,
                    hintText: "Search",hintStyle: TextStyles.textColor),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 5),
                child: Text("Stalls",style: TextStyles.mainHeader),
              ),
              Container(
                height: MediaQuery.of(context).size.height/1.2,
                child: ListView.builder(
                    itemCount: splashList.length,
                    itemBuilder: (_, index) =>
                        GestureDetector(
                          onTap: (){
                            Navigator.of(context).pushNamed(
                                RouteConstants.viewUploadScreen);
                          },
                          child: StallsCard(
                                                date: splashList[index].date,
                                                files: splashList[index].image,
                                                header: splashList[index].headline,
                                                companyName: splashList[index].subtitle,
                                              ),
                        )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FancyAppbarAnimation extends StatefulWidget {

  const FancyAppbarAnimation({super.key});
  @override
  _FancyAppbarAnimationState createState() => _FancyAppbarAnimationState();
}

class _FancyAppbarAnimationState extends State<FancyAppbarAnimation> {
  var splashContent = [
    {
      "date":"213se2",
      "companyName": "agirdftae",
      "images":AppAssets.homeIcon,
      "header": "Your Safetsrgdy,Our \nPriority",
      "files": "Welcome to Incisfgdfdent Reporting, where \nevery report matters"
    },
    {
      "date":"21ser32",
      "companyName": "agitae",
      "images":AppAssets.homeIcon,
      "header": "Your Safety,Our \nPriority",
      "files": "Welcome to Incident Reporsfdgting, where \nevery report matters"
    },
    {
      "date":"21wer32",
      "companyName": "agitae",
      "images":AppAssets.homeIcon,
      "header": "Your Safety,Our \nPriorsgfdity",
      "files": "Welcome to Incident Reportisgfdng, where \nevery report matters"
    },
  ];
  final ScrollController _scrollController = ScrollController();
  Color? appBarBackground;
  late double topPosition;
  @override
  void initState() {
    topPosition = -80;
    appBarBackground = Colors.transparent;
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  double _getOpacity() {
    double op = (topPosition + 80) / 80;
    return op > 1 || op < 0 ? 1 : op;
  }

  _onScroll() {
    if (_scrollController.offset > 50) {
      if (topPosition < 0) {
        setState(() {
          topPosition = -130 + _scrollController.offset;
          if (_scrollController.offset > 130) topPosition = 0;
        });
      }
    } else {
      if (topPosition > -80) {
        setState(() {
          topPosition--;
          if (_scrollController.offset <= 0) topPosition = -80;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var splash = splashContent;
    List<StallsModel> splashList =
    splash.map((sample) => StallsModel.fromJson(sample)).toList();
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 60,),
                    Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
                      elevation: 1,
                      color: AppColors.whiteColor,
                      child: TextField(
                        decoration: InputDecoration(prefixIcon: Icon(Icons.search),
                            border: InputBorder.none,
                            hintText: "Search",hintStyle: TextStyles.textColor),
                      ),
                    ),
                    SizedBox(height: 10,),
                    const Padding(
                      padding: EdgeInsets.only(left: 5),
                      child: Text("Stalls",style: TextStyles.mainHeader),
                    ),
                    for(int i = 0;i<splashList.length;i++)...[
                      GestureDetector(
                        onTap: (){
                          Navigator.of(context).pushNamed(
                              RouteConstants.viewUploadScreen);
                        },
                        child: StallsCard(
                          date: splashList[i].date,
                          files: splashList[i].image,
                          header: splashList[i].headline,
                          companyName: splashList[i].subtitle,
                        ),
                      )
                    ]
                  ],
                ),
              ),
            ),
            Positioned(
                top: topPosition,
                left: 0,
                right: 0,
                child: Container(
                    height: 100,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 50,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: Text("Stalls",style: TextStyles.mainHeader),
                            ),
                            RawMaterialButton(
                              onPressed: () {},
                              shape: const CircleBorder(),
                              fillColor: Colors.white,
                              elevation: 0,
                              child: const Padding(
                                padding: EdgeInsets.all(
                                  12.0,
                                ),
                                child: Icon(
                                  Icons.search,color: Colors.black,
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ))),
            SizedBox(
              height: 20,
              child: AppBar(
                iconTheme: const IconThemeData(color: Colors.black),
                elevation: 0,
                backgroundColor: Colors.white,
              ),
            )
          ],
        ),
      );
  }
}
