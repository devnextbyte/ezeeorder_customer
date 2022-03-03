import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductDetailView extends StatefulWidget {
  const ProductDetailView({Key? key}) : super(key: key);

  @override
  State<ProductDetailView> createState() => _ProductDetailViewState();
}

class _ProductDetailViewState extends State<ProductDetailView> {
  int count = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
            'assets/download.jpg',
            height: MediaQuery.of(context).size.height * .25,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Ice Cake and shake and stay Awake',
                style: Theme.of(context)
                    .textTheme
                    .subtitle2!
                    .copyWith(fontWeight: FontWeight.w500,),
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                '\$12.45',
                style: Theme.of(context).textTheme.subtitle2!.copyWith(
                    color: Colors.black54, fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(16, 0, 16 , 16),
          child: Text(
              'Lorem ipsum dolor sit amet, consectetur Loremipsum dolor sit amet, consecteturLorem ipsum dolor sit amet, consectetur Loremipsum.'),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              getCountWidget(context),
              SizedBox(
                height: 35,
                child: ElevatedButton.icon(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    icon: const Icon(Icons.shopping_cart_rounded,size: 16,),
                    label: const Text('ADD TO CART')),
              ),
            ],
          ),
        )


      ],
    );
  }

  Widget getCountWidget(context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            if (count != 1) {
              count -= 1;
              setState(() {});
            }
          },
          child: Container(
            height: 25,
            width: 25,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: count != 1
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).primaryColor.withOpacity(.2)),
            child: const Icon(
              Icons.remove,
              size: 18,
              color: Colors.white,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            count.toString(),
            style: Theme.of(context)
                .textTheme
                .subtitle2!
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        GestureDetector(
          onTap: () {
            count += 1;
            setState(() {});
          },
          child: Container(
            height: 25,
            width: 25,
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: Theme.of(context).primaryColor),
            child: const Icon(
              Icons.add,
              size: 18,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
