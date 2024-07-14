import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zoho_gatherly/src/features/home_screen/home_search_bar.dart';
import 'package:zoho_gatherly/src/ui_utils/text_styles.dart';
import 'package:zoho_gatherly/src/utils/src/colors/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20,horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50,),
            Padding(
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
            Padding(
              padding: EdgeInsets.only(left: 5),
              child: Text("Stalls",style: TextStyles.mainHeader),
            )
          ],
        ),
      ),
    );
  }
}
