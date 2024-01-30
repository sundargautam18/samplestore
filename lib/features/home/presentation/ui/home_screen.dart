import 'package:flutter/material.dart';
import 'package:samplestore/core/constants/colors.dart';
import 'package:samplestore/features/home/data/data_sources/static_data/mens_fashion.dart';
import 'package:samplestore/features/home/presentation/ui/fashion_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              appBar(),
              categoryWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

Container appBar() {
  return Container(
    decoration: const BoxDecoration(
      border: Border(
        bottom: BorderSide(
          color: ConstantColors.neutralLight,
          width: 1.0,
        ),
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
      child: AppBar(
        toolbarHeight: 60,
        title: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              color: ConstantColors.neutralLight,
              width: 1,
            ),
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.search,
                size: 26,
                color: ConstantColors.primaryColor,
              ),
              SizedBox(width: 8),
              Text(
                "Search Product",
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 12,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w400,
                  color: ConstantColors.neutralGrey,
                ),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.favorite_border_outlined,
              size: 28,
              color: ConstantColors.neutralGrey,
            ),
          ),
          Stack(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.notifications_none_outlined,
                  size: 28,
                  color: ConstantColors.neutralGrey,
                ),
              ),
              Positioned(
                right: 10,
                top: 9,
                child: Container(
                  height: 12,
                  width: 12,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: ConstantColors.primaryRed,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    ),
  );
}

Padding categoryWidget() {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Category",
                style: TextStyle(
                    color: ConstantColors.neutralDark,
                    fontFamily: "Poppins",
                    fontSize: 14,
                    fontWeight: FontWeight.w700),
              ),
              GestureDetector(
                  onTap: () {},
                  child: const Text(
                    "More Category",
                    style: TextStyle(
                      color: ConstantColors.primaryColor,
                      fontFamily: "Poppins",
                      fontSize: 14,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w700,
                    ),
                  ))
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: SizedBox(
              height: 110,
              child: ListView.separated(
                // Dynamically render data
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                // Limit height
                itemCount: menFashionList.fashionList!.length,
                itemBuilder: (context, index) {
                  return FashionCard(item: menFashionList.fashionList![index]);
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    width: 12,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
