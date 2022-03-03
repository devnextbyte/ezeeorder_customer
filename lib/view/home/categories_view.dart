import 'package:easyorder/model/category_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoriesView extends StatefulWidget {
   const CategoriesView({Key? key}) : super(key: key);

  @override
  State<CategoriesView> createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {
  int selectedCategory = 0;
  List<CategoryModel> categoryList = [
    CategoryModel(name: 'All', image: 'assets/all.png'),
    CategoryModel(name: 'Breakfast', image: 'assets/breakfast.png'),
    CategoryModel(name: 'Lunch', image: 'assets/lunch.png')
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Select Food Category',
            style: Theme.of(context)
                .textTheme
                .headline6!.copyWith(fontWeight: FontWeight.w500,fontSize: 16),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.fromLTRB(16, 4, 4, 16),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.start,
              children: List.generate(
                categoryList.length,
                    (index) => Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25)),
                          elevation: 2,
                          margin: EdgeInsets.zero,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(25),
                            onTap: () {
                              selectedCategory = index;
                              setState(() {});
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: selectedCategory == index
                                    ? Theme.of(context).primaryColor
                                    : null,
                              ),
                              height: MediaQuery.of(context).size.height * .1,
                              width: MediaQuery.of(context).size.height * .1,
                              padding: const EdgeInsets.all(16),
                              child: Image.asset(categoryList[index].image),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(categoryList[index].name,
                            style: Theme.of(context).textTheme.subtitle2!.copyWith(
                                color: selectedCategory == index
                                    ? Theme.of(context).primaryColor
                                    : null,
                                fontWeight: FontWeight.normal,
                                letterSpacing: 1))
                      ],
                    ),
                    const SizedBox(width: 16)
                  ],
                ),
              )),
        ),
      ],
    );
  }
}
