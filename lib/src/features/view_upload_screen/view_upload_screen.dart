import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:size_setter/size_setter.dart';
import 'package:zoho_gatherly/src/common_widgets/attach_loader_button.dart';
import 'package:zoho_gatherly/src/common_widgets/dotted_lines.dart';
import 'package:zoho_gatherly/src/db/DBHelper.dart';
import 'package:zoho_gatherly/src/features/view_upload_screen/image_view.dart';
import 'package:zoho_gatherly/src/model/photo.dart';
import 'package:zoho_gatherly/src/model/utility.dart';
import 'package:zoho_gatherly/src/providers/upload_data_provider.dart';
import 'package:zoho_gatherly/src/ui_utils/app_assets.dart';
import 'package:zoho_gatherly/src/ui_utils/text_styles.dart';
import 'package:zoho_gatherly/src/utils/src/colors/app_colors.dart';

class ViewUploadScreen extends StatefulWidget {
  const ViewUploadScreen({super.key});

  @override
  State<ViewUploadScreen> createState() => _ViewUploadScreenState();
}

class _ViewUploadScreenState extends State<ViewUploadScreen> {
  dynamic currentPage = 0;
  @override
  Widget build(BuildContext context) {
    ImagePicker picker = ImagePicker();
    var height = (MediaQuery.of(context).size.height).h;
    return Scaffold(
      extendBodyBehindAppBar: true,
      body:
      Consumer<UploadDataProvider>(builder: (context, provider, child)=>Stack(
        children: [
          CarouselSlider(
            items: [
              for (int i = 0; i <provider.fileList!.length; i++)...[
                ImageView(width: double.infinity,
                  isRemove: true,
                  file: provider.fileList?[i],
                ),
              ]
            ],
            options: CarouselOptions(
              height:height < 900 ? MediaQuery.of(context).size.height :MediaQuery.of(context).size.height /1.5,
              enlargeCenterPage: false,
              autoPlay: false,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: false,
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              viewportFraction: 1,
              onPageChanged:(index,reason) {
                currentPage = index;
                setState(() {});
              },
            ),
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height/2.8,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  for (int i = 0;
                  i <provider.fileList!.length;
                  i++) ...[
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: AppColors.whiteColor,
                              borderRadius: BorderRadius.circular(5)),
                          height: 4.0,
                        ),
                      ),
                    ),
                  ]
                ],
              ),
            ),
          ),
          Positioned(right: 20,
              top: 60,child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                child: const Padding(
                  padding: EdgeInsets.all(5.0),
                  child:Icon(Icons.upload),
                ),
              )),
          Positioned(left: 20,
              top: 60,child: GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  child: const Padding(
                    padding: EdgeInsets.all(5),
                    child: Icon(Icons.arrow_back_ios_new_outlined),
                  ),
                ),
              )),
          Container(
            height: (MediaQuery.of(context).size.height / .08).h,
            alignment: Alignment.topCenter,
            padding: EdgeInsets.only(
              top: ((MediaQuery.of(context).size.height < 900)
                  ? MediaQuery.of(context).size.height * .73
                  : MediaQuery.of(context).size.height * .45)
                  .h,
            ),
            child: Container(
              width: double.infinity,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'TechTrends',
                      style: TextStyles.headerText.copyWith(fontSize: 28),
                    ),
                    const SizedBox(height: 4.0),
                    const Text(
                      'TechTrends Technologies',
                      style: TextStyles.smallText,
                    ),
                    const SizedBox(height: 4.0),
                     Text(
                      '${provider.fileList!.length} Files',
                      style: TextStyles.smallText,
                    ),
                    const Spacer(),
                    //AttachingFileWidget(),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: DottedBorder(
                        borderType: BorderType.RRect,
                        radius: const Radius.circular(5),
                        dashPattern: const [6, 6],
                        color: Colors.grey,
                        child: GestureDetector(
                          onTap: () async {
                            List<XFile?>? pickedFileList = [];
                            pickedFileList = await picker.pickMultiImage();
                            for (int i = 0;
                            i < pickedFileList.length;
                            i++) {
                              if (context.mounted) {
                                provider.addImage(
                                    pickedFileList[i], context);
                              }
                            }
                          },
                          child: const SizedBox(height: 100,width: double.infinity,child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.attachment_outlined,
                                  size: 25.0,
                                ),
                                SizedBox(height: 8.0),
                                Text('Attach file',style: TextStyles.smallText,),
                              ],
                            ),
                          ),),
                        ),),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),),
    );
  }
}
