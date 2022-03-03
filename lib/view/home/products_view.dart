import 'package:easyorder/model/category_model.dart';
import 'package:easyorder/view/home/product_detail_view.dart';
import 'package:flutter/material.dart';

class ProductsView extends StatelessWidget {
  final List<CategoryModel> elements = [
    CategoryModel(
        name: 'Ice Cake and shake',
        image: 'assets/Perfect-Chocolate-Cake-IMAGE-2.jpg'),
    CategoryModel(name: 'Chicken Fajita Pizza', image: 'assets/download.jpg'),
    CategoryModel(
        name: 'Ice Cake and shake',
        image: 'assets/Perfect-Chocolate-Cake-IMAGE-2.jpg'),
    CategoryModel(name: 'Chicken Fajita Pizza', image: 'assets/download.jpg'),
    CategoryModel(
        name: 'Ice Cake and shake',
        image: 'assets/Perfect-Chocolate-Cake-IMAGE-2.jpg'),
    CategoryModel(name: 'Chicken Fajita Pizza', image: 'assets/download.jpg'),
    CategoryModel(
        name: 'Ice Cake and shake',
        image: 'assets/Perfect-Chocolate-Cake-IMAGE-2.jpg'),
    CategoryModel(name: 'Chicken Fajita Pizza', image: 'assets/download.jpg'),
    CategoryModel(
        name: 'Ice Cake and shake',
        image: 'assets/Perfect-Chocolate-Cake-IMAGE-2.jpg'),
    CategoryModel(name: 'Chicken Fajita Pizza', image: 'assets/download.jpg'),
    CategoryModel(
        name: 'Ice Cake and shake',
        image: 'assets/Perfect-Chocolate-Cake-IMAGE-2.jpg'),
    CategoryModel(name: 'Chicken Fajita Pizza', image: 'assets/download.jpg'),
  ];

  ProductsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
            child: Text(
              'Products',
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(fontWeight: FontWeight.w500, fontSize: 16),
            ),
          ),
          Expanded(
            child: GridView.extent(
                maxCrossAxisExtent: MediaQuery.of(context).size.height * .24,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
                childAspectRatio: .8,
                padding: const EdgeInsets.all(16),
                physics: const BouncingScrollPhysics(),
                children: elements
                    .map(
                      (el) => Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)),
                        elevation: 2,
                        child: InkWell(
                            borderRadius: BorderRadius.circular(25),
                            onTap: () {
                              showModalBottomSheet<void>(
                                  context: context,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(top: Radius.circular(20))

                                  ),
                                  // constraints: const BoxConstraints(),
                                  builder: (BuildContext context) {
                                    return const ProductDetailView();
                                  });
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(25),
                                      child: Image.asset(
                                        el.image,
                                        width: double.infinity,
                                        fit: BoxFit.fill,
                                      )),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(12, 6, 12, 0),
                                  child: Text(
                                    el.name,
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle2!
                                        .copyWith(fontWeight: FontWeight.w500),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(12, 6, 12, 12),
                                  child: Text('\$ 12.45',
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle2!
                                          .copyWith(
                                              color: Colors.grey,
                                              fontWeight: FontWeight.w500)),
                                ),
                              ],
                            )),
                      ),
                    )
                    .toList()),
          )
        ],
      ),
    );
  }
}
