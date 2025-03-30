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
    final controller = Get.put(HomeController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeaderWidget(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _AppBarWidget(),
                  SizedBox(
                    height: AppSizes.spaceBtwSection,
                  ),
                  _SearchInStoreField(),
                  SizedBox(
                    height: AppSizes.spaceBtwSection,
                  ),
                  TypeWithSuffixWidget(
                    title: 'Popular Categories',
                  ),
                  SizedBox(
                    height: AppSizes.lg,
                  ),
                  _PopularCategoriesWidget(),
                  SizedBox(
                    height: AppSizes.spaceBtwItems,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: AppSizes.lg,
            ),
            CustomSliderWidget(
              controller: controller,
            ),
            const SizedBox(
              height: AppSizes.lg,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TypeWithSuffixWidget(
                    title: 'Popular Products',
                    suffix: 'View All',
                    onTap: () {},
                  ),
                  const SizedBox(
                    height: AppSizes.lg,
                  ),
                  Row(
                    children: [
                      VeticalProductCard(
                        imageUrl: 'assets/images/splash_image.png',
                        onPressed: () {},
                      ),
                      const Spacer(),
                      VeticalProductCard(
                        imageUrl: 'assets/images/splash_image.png',
                        onPressed: () {},
                      ),
                    ],
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

class VeticalProductCard extends StatelessWidget {
  const VeticalProductCard({
    super.key,
    this.imageUrl,
    this.title,
    this.subtitle,
    this.priceRange,
    this.onPressed,
  });
  final String? imageUrl;
  final String? title;
  final String? subtitle;
  final String? priceRange;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final dark = CustomHelpers.isDark(context);
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 245,
        width: MediaQuery.of(context).size.width * 0.44,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            AppSizes.producstImageRadius,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 50,
              spreadRadius: 7,
              offset: const Offset(0, 2),
            ),
          ],
          color: dark ? Colors.white : Colors.grey,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomCircleContainer(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              height: 140,
              child: Stack(
                children: [
                  RoundedImageWidget(
                    imageUrl: imageUrl ?? '',
                    applyImageRadius: true,
                  ),
                  Positioned(
                    top: 12,
                    child: CustomCircleContainer(
                        radius: AppSizes.sm,
                        backgroundColor: Colors.orange,
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppSizes.sm,
                          vertical: AppSizes.xs,
                        ),
                        child: Text(
                          '25%',
                          style:
                              Theme.of(context).textTheme.labelLarge!.copyWith(
                                    color: Colors.black,
                                  ),
                        )),
                  ),
                  const Positioned(
                    top: 0,
                    right: 0,
                    child: CustomCircularIcon(
                      icon: Icon(
                        Icons.favorite_outline,
                        color: Colors.red,
                        size: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: AppSizes.spaceBtwItems / 2,
            ),
            //Title,Price,Cart

            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ProductTitleText(
                    title: 'Green Nike Air Shoes',
                  ),
                  const SizedBox(
                    height: AppSizes.spaceBtwItems / 2,
                  ),
                  Row(
                    children: [
                      Text(
                        'Nike',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      const SizedBox(
                        width: AppSizes.xs,
                      ),
                      const Icon(
                        Icons.verified,
                        size: 15,
                        color: Colors.black,
                      ),
                    ],
                  ),
                  // const Spacer(),
                  Row(
                    children: [
                      const Text(
                        '\$122.6',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.all(1),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(6),
                            bottomRight: Radius.circular(16),
                          ),
                          color: Colors.black,
                        ),
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductTitleText extends StatelessWidget {
  const ProductTitleText({
    super.key,
    this.title,
    this.maxLines,
    this.textAlign,
    this.style,
  });
  final String? title;
  final int? maxLines;
  final TextAlign? textAlign;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Text(
      title ?? '',
      style: style ?? Theme.of(context).textTheme.titleSmall,
      maxLines: maxLines ?? 2,
      textAlign: textAlign ?? TextAlign.left,
      overflow: TextOverflow.ellipsis,
    );
  }
}

class CustomCircularIcon extends StatelessWidget {
  const CustomCircularIcon({
    super.key,
    this.icon,
    this.onPressed,
  });
  final Icon? icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0,
      top: 12,
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(
                0.9,
              ),
              borderRadius: BorderRadius.circular(
                100,
              )),
          child: icon,
        ),
      ),
    );
  }
}

class TypeWithSuffixWidget extends StatelessWidget {
  const TypeWithSuffixWidget({
    super.key,
    this.title,
    this.suffix,
    this.onTap,
  });
  final String? title;
  final String? suffix;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title ?? '',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const Spacer(),
        GestureDetector(
          onTap: onTap,
          child: Text(
            suffix ?? '',
            style: Theme.of(context).textTheme.labelLarge,
          ),
        ),
      ],
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
                  child: CustomCircleContainer(
                    backgroundColor: Colors.white.withOpacity(0.3),
                  ),
                ),
                Positioned(
                  top: 100,
                  right: -300,
                  child: CustomCircleContainer(
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

class CustomCircleContainer extends StatelessWidget {
  const CustomCircleContainer({
    super.key,
    this.width,
    this.height,
    this.radius = AppSizes.cardRadiusLg,
    this.padding,
    this.backgroundColor,
    this.margin,
    this.child,
  });
  final double? width;
  final double? height;
  final double radius;
  final EdgeInsetsGeometry? padding;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? margin;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: width,
      height: height,
      padding: padding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: backgroundColor,
      ),
      child: child,
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
