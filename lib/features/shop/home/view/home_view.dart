part of 'view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const _BodyView();
  }
}

class _BodyView extends StatelessWidget {
  const _BodyView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderWidget(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const _AppBarWidget(),
                  const SizedBox(
                    height: AppSizes.spaceBtwSection,
                  ),
                  const _SearchInStoreField(),
                  const SizedBox(
                    height: AppSizes.spaceBtwSection,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Text(
                      'Popular Categories',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ),
                  const SizedBox(height: AppSizes.lg),
                  const _PopularCategoriesWidget(),
                  const SizedBox(
                    height: AppSizes.spaceBtwItems,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AppBarWidget extends StatelessWidget {
  const _AppBarWidget();

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
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
      actions: const [
        BadgeAnimationWidget(),
      ],
    );
  }
}

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    super.key,
    required this.child,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      padding: const EdgeInsets.all(0),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.5,
        child: Column(
          children: [
            Stack(
              children: [
                Positioned(
                  top: -150,
                  right: -250,
                  child: CustomCircularContainer(
                    backgroundColor: Colors.white.withOpacity(0.3),
                  ),
                ),
                Positioned(
                  top: 100,
                  right: -300,
                  child: CustomCircularContainer(
                    backgroundColor: Colors.white.withOpacity(0.3),
                  ),
                ),
                child,
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CustomCircularContainer extends StatelessWidget {
  const CustomCircularContainer({
    super.key,
    this.width = 400,
    this.height = 400,
    this.radius = 400,
    this.padding = 0,
    this.backgroundColor,
  });
  final double? width;
  final double? height;
  final double radius;
  final double padding;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: backgroundColor,
      ),
    );
  }
}

class _SearchInStoreField extends StatelessWidget {
  const _SearchInStoreField();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.md),
      child: CustomTextFormField(
        hintText: 'Search in Store',
        hintTextStyle: Theme.of(context).textTheme.labelMedium,
        prefixIcon: const Icon(
          Icons.search_sharp,
        ),
      ),
    );
  }
}

class _PopularCategoriesWidget extends StatelessWidget {
  const _PopularCategoriesWidget();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 80,
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: HomeModel.items.length,
                itemBuilder: (context, index) {
                  final items = HomeModel.items;
                  return VerticalImageTextWidget(
                    title: items[index].title,
                    icon: items[index].icon,
                    onTap: () {
                      print("Pressed");
                    },
                  );
                }),
          )
        ],
      ),
    );
  }
}
