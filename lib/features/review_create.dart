import 'dart:io';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:samplestore/core/constants/colors/app_colors.dart';
import 'package:flutter_quill/flutter_quill.dart';

class CreateReview extends StatefulWidget {
  const CreateReview({Key? key}) : super(key: key);

  @override
  State<CreateReview> createState() => _CreateReviewState();
}

class _CreateReviewState extends State<CreateReview> {
  List<File> files = [];
  QuillController _controller = QuillController.basic();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create review"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Please write Overall level of satisfaction with your shipping / Delivery Service"),
            10.verticalSpace,
               RatingBar(
                
                  initialRating: 0,
                  itemSize: 25.sp,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  glow: false,
                  ratingWidget: RatingWidget(
                    full: Icon(
                      Icons.star,
                      color: HexColor(appYellow),
                    ),
                    half: Icon(
                      Icons.star_half_sharp,
                      color: HexColor(appYellow),
                    ),
                    empty: const Icon(EvaIcons.starOutline),
                  ),
                  itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                ),
            10.verticalSpace,

            const Text(
              "Add photos",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            5.verticalSpace,
            GestureDetector(
              onTap: () async {
                FilePickerResult? result = await FilePicker.platform.pickFiles(
                  allowMultiple: true,
                  type: FileType.image,
                );
                if (result != null) {
                  setState(() {
                    files.addAll(result.files.map((file) => File(file.path!)));
                  });
                } else {
                  Alert(
                    buttons: [],
                    context: context,
                    title: "Something went wrong",
                    type: AlertType.error,
                  ).show();
                }
              },
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  border: Border.all(color: HexColor(primaryColor)),
                ),
                child: Center(
                  child: Icon(Icons.add),
                ),
              ),
            ),
            5.verticalSpace,
            if (files.length > 0)
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, // Number of items in each row
                    crossAxisSpacing:
                        10.0, // Gap between items // Gap between items vertically
                  ),
                  itemCount: files.length,
                  itemBuilder: (context, index) {
                    return buildFileItem(files[index], index);
                  },
                ),
              ),
            10.verticalSpace,
            const Text(
              "Write your review",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            5.verticalSpace,
            Container(
              decoration: BoxDecoration(border: Border.all(color: HexColor(primaryColor))),
              child: QuillToolbar.simple(
                configurations: QuillSimpleToolbarConfigurations(
                  controller: _controller,
                  showFontFamily: false,
                  showCodeBlock: false,
                  showLink: false,
                  showSearchButton: false,
                  showColorButton: false,
                  showQuote: false,
                  showDirection: false,
                  showInlineCode: false,
                  showListCheck: false,
                  showLeftAlignment: false,
                  showRightAlignment: false,
                  showStrikeThrough: false,
                  showSubscript: false,
                  showSuperscript: false,
                  showFontSize: false,
                  sharedConfigurations: const QuillSharedConfigurations(
                    locale: Locale('de'),
                  ),
                ),
              ),
            ),
            5.verticalSpace,
            Expanded(
              child:Container(
                decoration: BoxDecoration(
                  border: Border.all(color: HexColor(primaryColor)),
                ),
                child:  QuillEditor.basic(
                configurations: QuillEditorConfigurations(
                  autoFocus: true,
                  controller: _controller,
                  readOnly: false,
                   
                  placeholder: "Write your reveiw here",
                  sharedConfigurations: const QuillSharedConfigurations(
                    locale: Locale('de'),
                  ),
                ),
              ),
              ),
            ),
            10.verticalSpace, 
            Row(
              children: [
              Expanded(child: TextButton(onPressed: (){

              },     style: TextButton.styleFrom(
                          padding: const EdgeInsets.all(16),
                          backgroundColor: HexColor(primaryColor),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ), child: Text("Submit review",style: TextStyle(color: Colors.white),))),
              ]
            )
          ],
        ),
      ),
    );
  }

  Widget buildFileItem(File file, int index) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      height: 150,
      width: 150,
      child: Stack(
        children: [
          Image.file(file, fit: BoxFit.cover),
          Positioned(
            top: 5,
            right: 5,
            child: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                setState(() {
                  files.removeAt(index);
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
