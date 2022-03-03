import 'package:flutter/material.dart';

class CartItemCard extends StatefulWidget {
  const CartItemCard({Key? key}) : super(key: key);

  @override
  State<CartItemCard> createState() => _CartItemCardState();
}

class _CartItemCardState extends State<CartItemCard> {
  int count = 1;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              'assets/Perfect-Chocolate-Cake-IMAGE-2.jpg',
              height: MediaQuery.of(context).size.height * .1,
              width: MediaQuery.of(context).size.height * .1,
              fit: BoxFit.fill,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Ice Cake and shake',
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2!
                        .copyWith(fontWeight: FontWeight.w500),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Text('\$ 12.45',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle2!
                          .copyWith(
                          color: Colors.grey,
                          fontWeight: FontWeight.w500)),

                ],
              ),
            ),
          ),
          getCountWidget()
        ],
      ),
    );
  }
  Widget getCountWidget() {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: Row(
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
                  .copyWith(fontWeight: FontWeight.w500),
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
      ),
    );
  }

}
