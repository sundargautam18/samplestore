import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:chips_choice/chips_choice.dart';
import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:samplestore/core/constants/colors/app_colors.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:samplestore/features/landing/presentation/component/product_card.dart';
import 'package:samplestore/features/product/presentation/component/carousel.dart';

class ProductScreen extends StatefulWidget {
  final String productName;
  const ProductScreen({super.key, required this.productName});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  Color screenPickerColor = HexColor(primaryColor);
  final List<String> letters = [
    "https://cdn.britannica.com/04/123704-050-023DC490/Pair-leather-shoes.jpg",
    "https://www.shutterstock.com/image-photo/black-shoes-isolated-on-white-600nw-2241492009.jpg",
  ];
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

  List<Map<String, String>> items = [
    {"value": "green", "label": "green", "color": "#008000"},
    {"value": "red", "label": "red", "color": "#FF0000"},
    {"value": "blue", "label": "blue", "color": "#0000FF"},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:FloatingActionButton.extended(
        backgroundColor: HexColor(primaryColor),
  onPressed: ()=>{

  },
  label:const Text('Add to cart',style: TextStyle(color: Colors.white),),
  icon: const Icon(EvaIcons.shoppingCart,color: Colors.white),
),
      appBar: AppBar(
        title: Text(
          widget.productName,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        
        actions: [
          IconButton(
              onPressed: () => context.go("/search"),
              icon: const Icon(Icons.search)),
          16.horizontalSpace
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              appCarousel(letters),
              16.verticalSpace,
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Nike Air Zoom Pegasus 36 Miami",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Icon(
                      EvaIcons.heart,
                      color: Colors.red,
                    )
                  ],
                ),
                RatingBar(
                  initialRating: 2.5,
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
                16.verticalSpace,
                Text(
                  "Rs. 299,43",
                  style: TextStyle(
                      fontSize: 20.sp,
                      color: HexColor(primaryColor),
                      fontWeight: FontWeight.bold),
                ),
                16.verticalSpace,
                FormBuilder(
                    key: _formKey,
                    child: Column(
                      children: [
                        FormBuilderRadioGroup(
                            name: "size",
                            activeColor: HexColor(primaryColor),
                            decoration: InputDecoration(
                              labelText: 'Available sizes',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 15.0),
                            ),
                            options: const [
                              FormBuilderFieldOption(
                                value: 'xl',
                                child: Text('xl'),
                              ),
                              FormBuilderFieldOption(
                                value: 'lg',
                                child: Text('lg'),
                              ),
                              FormBuilderFieldOption(
                                value: 'md',
                                child: Text('md'),
                              ),
                              FormBuilderFieldOption(
                                value: 'sm',
                                child: Text('sm'),
                              ),
                            ]),
                        16.verticalSpace,
                        FormBuilderRadioGroup(
                            name: "color",
                            activeColor: HexColor(primaryColor),
                            decoration: InputDecoration(
                              labelText: 'Available colors',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 15.0),
                            ),
                            options: generateFormBuilderOptions(items)),
                      ],
                    )),

                // Show the color picker in sized box in a raised card.
              ]),
              16.verticalSpace,
              Text(
                "Specification",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
              ),
              12.verticalSpace,
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Shown:"),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "Laser",
                        style: TextStyle(color: HexColor(appGrey)),
                      ),
                      Text(
                        "Blue/Anthracite/Watermel",
                        style: TextStyle(color: HexColor(appGrey)),
                      ),
                      Text(
                        "on/White",
                        style: TextStyle(color: HexColor(appGrey)),
                      ),
                    ],
                  )
                ],
              ),
              16.verticalSpace,
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Style:"),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "CD0113-400",
                        style: TextStyle(color: HexColor(appGrey)),
                      ),
                    ],
                  )
                ],
              ),
              12.verticalSpace,
              Text(
                  "The Nike Air Max 270 React ENG combines a full-length React foam midsole with a 270 Max Air unit for unrivaled comfort and a striking visual experience.",
                  style: TextStyle(color: HexColor(appGrey))),
              16.verticalSpace,
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Review Product",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "See more",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: HexColor(primaryColor)),
                  )
                ],
              ),

              // ratings components
              8.verticalSpace,
              Column(
                children: [
                  Row(
                    children: [
                      RatingBar(
                        initialRating: 2.5,
                        itemSize: 15.sp,
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
                        itemPadding:
                            const EdgeInsets.symmetric(horizontal: 4.0),
                        onRatingUpdate: (rating) {},
                        ignoreGestures: true,
                      ),
                      Text(
                        "4.5 (5 Reviews)",
                        style:
                            TextStyle(color: HexColor(appGrey), fontSize: 12),
                      )
                    ],
                  ),

                  //review card
                  12.verticalSpace,
                  Column(children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 72,
                          height: 72,
                          clipBehavior: Clip.antiAlias,
                          decoration: const BoxDecoration(shape: BoxShape.circle
                              // Adjust the radius as needed
                              ),
                          child: Image.network(
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRKKOdmJz8Z2pDtYgFgR2u9spABvNNPKYYtGw&usqp=CAU",
                            fit: BoxFit.cover,
                          ),
                        ),
                        15.horizontalSpace,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Sam Bahadur",
                              style: TextStyle(
                                  fontSize: 14.sp, fontWeight: FontWeight.bold),
                            ),
                            4.verticalSpace,
                            RatingBar(
                              initialRating: 2.5,
                              itemSize: 15.sp,
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
                              itemPadding:
                                  const EdgeInsets.symmetric(horizontal: 4.0),
                              onRatingUpdate: (rating) {},
                              ignoreGestures: true,
                            ),
                          ],
                        )
                      ],
                    ),
                    8.verticalSpace,
                    Text(
                      "Air max are always very comfortable fit, clean and just perfect in every way. just the box was too small and scrunched the sneakers up a little bit, not sure if the box was always this small but the 90s are and will always be one of my favorites.",
                      style: TextStyle(color: HexColor(appGrey)),
                    )
                  ]),
                  16.verticalSpace,
                     Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Mega sale",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "See more",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: HexColor(primaryColor)),
                      )
                    ],
                  ),
                  12.verticalSpace,
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        const ProductCard(
                            name: "FS - Nike Air Max 270 React...", price: 500),
                        16.horizontalSpace,
                        const ProductCard(
                            name: "FS - Nike Air Max 270 React...", price: 500),
                        16.horizontalSpace,
                        const ProductCard(
                            name: "FS - Nike Air Max 270 React...", price: 500),
                        16.horizontalSpace,
                        const ProductCard(
                            name: "FS - Nike Air Max 270 React...", price: 500),
                        16.horizontalSpace,
                        const ProductCard(
                            name: "FS - Nike Air Max 270 React...", price: 500),
                        16.horizontalSpace,
                        const ProductCard(
                            name: "FS - Nike Air Max 270 React...", price: 500),
                        16.horizontalSpace,
                      ],
                    ),
                  )
                ],
              ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  List<FormBuilderFieldOption> generateFormBuilderOptions(
      List<Map<String, String>> items) {
    return items.map((item) {
      return FormBuilderFieldOption(
        value: item['value'],
        child: Text(item['label'] ?? ''),
        // You can customize color here if needed
        // For simplicity, I'm leaving it as it is
      );
    }).toList();
  }
}
