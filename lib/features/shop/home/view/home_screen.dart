import 'package:flutter/material.dart';
import 'package:trendy_threads/features/shop/home/Models/home_model.dart';
import 'package:trendy_threads/widgets/text_formfield.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Good day for Shopping',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Text(
                'Ali Afzal',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Stack(
                alignment: Alignment.topRight,
                children: [
                  Icon(
                    Icons.notifications_none_outlined,
                  ),
                  Positioned(
                    top: -8,
                    child: Text(
                      '2',
                    ),
                  ),
                ],
              ),
            ),
          ]),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Container(
            color: Colors.green,
            padding: const EdgeInsets.all(0),
            child: const Stack(
              children: [CustomCircularContainer()],
            ),
          ),
        ],
      )

          // Column(
          //   children: [
          //     Container(
          //       decoration: BoxDecoration(
          //         color: Colors.green.withOpacity(0.5),
          //       ),
          //       height: MediaQuery.of(context).size.height * 0.4,
          //       child: Padding(
          //         padding: const EdgeInsets.symmetric(
          //           horizontal: 18.0,
          //         ),
          //         child: Column(
          //           children: [
          //             Column(
          //               crossAxisAlignment: CrossAxisAlignment.start,
          //               children: [
          //                 SizedBox(
          //                   height: MediaQuery.of(context).size.height * 0.03,
          //                 ),
          //                 const _SearchInStoreField(),
          //                 SizedBox(
          //                   height: MediaQuery.of(context).size.height * 0.05,
          //                 ),
          //                 const _PopularCategoriesWidget()
          //               ],
          //             ),
          //           ],
          //         ),
          //       ),
          //     ),
          //     // Column(
          //     //   children: [
          //     //     SizedBox(
          //     //       height: MediaQuery.of(context).size.height * 0.01,
          //     //     ),
          //     //     Text(
          //     //       'Trending Products',
          //     //       style: Theme.of(context).textTheme.headlineSmall,
          //     //     ),
          //     //   ],
          //     // )
          //   ],
          // ),

          ),
    );
  }
}

class CustomCircularContainer extends StatelessWidget {
  const CustomCircularContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 400,
      padding: const EdgeInsets.all(0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(400),
          color: Colors.white.withOpacity(0.1)),
    );
  }
}

class _SearchInStoreField extends StatelessWidget {
  const _SearchInStoreField();

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      hintText: 'Search in Store',
      hintTextStyle: Theme.of(context).textTheme.labelMedium,
      prefixIcon: const Icon(
        Icons.search_sharp,
      ),
    );
  }
}

class _PopularCategoriesWidget extends StatelessWidget {
  const _PopularCategoriesWidget();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Popular Categories',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.03),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.17,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: HomeModel.items.length,
              itemBuilder: (context, index) {
                final items = HomeModel.items;
                return SizedBox(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          height: 50,
                          width: 50,
                          child: Icon(items[index].icon),
                        ),
                        Text(
                          items[index].title,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                );
              }),
        )
      ],
    );
  }
}
