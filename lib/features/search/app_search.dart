import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:go_router/go_router.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:samplestore/core/constants/colors/app_colors.dart';

import 'package:dropdown_button2/dropdown_button2.dart';

/// This is a very simple class, used to
/// demo the `SearchPage` package
class Person implements Comparable<Person> {
  final String name, surname;
  final num age;

  const Person(this.name, this.surname, this.age);

  @override
  int compareTo(Person other) => name.compareTo(other.name);
}

/// This is a very simple class, used to
/// demo the `SearchPage` package

class AppSearch extends StatefulWidget {
  final String query;
  const AppSearch({super.key, required this.query});

  @override
  State<AppSearch> createState() => _AppSearchState();
}

class _AppSearchState extends State<AppSearch> {
  static const people = [
    Person('Laptops', 'Barron', 64),
    Person('Bags', 'Black', 30),
    Person('Tablets', 'Edwards', 55),
    Person('Iphone', 'Johnson', 67),
  ];
  final List<String> items = ["All", "Man", "Womens", "Kids"];
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: TypeAheadField<Person>(
            suggestionsCallback: (String query) {
              List<Person> filteredPeople = people.where((person) {
                return person.name
                        .toLowerCase()
                        .contains(query.toLowerCase()) ||
                    person.surname.toLowerCase().contains(query.toLowerCase());
              }).toList();

              return filteredPeople;
            },
            builder: (context, controller, focusNode) {
              return TextField(
                  controller: controller,
                  focusNode: focusNode,
                  autofocus: true,
                  decoration: InputDecoration(
                      hintText: "Search products",
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 1, color: HexColor(primaryColor)),
                      ),
                      prefixIcon: Icon(
                        Icons.search,
                        color: HexColor(primaryColor),
                      ),
                      hintStyle: TextStyle(color: HexColor(appGrey)),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 16),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                        width: 1,
                        color: HexColor(primaryColor),
                      ))));
            },
            itemBuilder: (context, city) {
              return ListTile(
                title: Text(city.name),
                subtitle: Text(city.surname),
              );
            },
            onSelected: (city) {
              context.go(
                  Uri(path: "/search", queryParameters: {"name": city.name})
                      .toString());
            },
          ),
          actions: [
            const Icon(Icons.filter_alt),
            16.horizontalSpace,
            const Icon(Icons.sort),
            16.horizontalSpace,
          ],
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    widget.query == "all"
                        ? "All Products"
                        : "230 result found for ${widget.query}",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: HexColor(appGrey)),
                  ),
                  DropdownButtonHideUnderline(
                    child: DropdownButton2<String>(
                      isExpanded: true,
                      hint: Text(
                        'All',
                        style: TextStyle(
                          fontSize: 14,
                          color: Theme.of(context).hintColor,
                        ),
                      ),
                      items: items
                          .map((String item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ))
                          .toList(),
                      value: selectedValue,
                      onChanged: (String? value) {
                        setState(() {
                          selectedValue = value;
                        });
                      },
                      buttonStyleData: const ButtonStyleData(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        height: 40,
                        width: 140,
                      ),
                      menuItemStyleData: const MenuItemStyleData(
                        height: 40,
                      ),
                    ),
                  )
                ],
              ),
            ]),
          ),
        )));
  }
}
