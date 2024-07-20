import 'package:flutter/material.dart';
import 'package:zoho_gatherly/src/ui_utils/text_styles.dart';
import 'package:zoho_gatherly/src/utils/src/colors/app_colors.dart';

class StallsCard extends StatelessWidget {
  const StallsCard({super.key, this.date, this.header, this.companyName, this.files});
  final String? date;
  final String? header;
  final String? companyName;
  final String? files;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Card(
        elevation: 1,
        color: AppColors.cardGrey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
              child: Image.asset(
                'assets/images/img.png',
                fit: BoxFit.cover,
                width: double.infinity,
                height: MediaQuery.of(context).size.height/5,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                color: Colors.white.withOpacity(0.9),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            date!,
                            style: TextStyles.smallText,
                          ),
                          SizedBox(height: 4.0),
                          Text(
                            header!,
                            style: TextStyles.headerText,
                          ),
                          SizedBox(height: 4.0),
                          Text(
                            companyName!,
                            style: TextStyles.smallText,
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            files!,
                            style: TextStyles.smallText,
                          ),
                        ],
                      ),
                      Spacer(),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: CircleAvatar(
                          maxRadius: 30,
                          backgroundColor: AppColors.redColor,
                          child: Icon(Icons.add_rounded, color: Colors.white,size: 40,),
                        ),
                      ),
                    ],
                  ),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
