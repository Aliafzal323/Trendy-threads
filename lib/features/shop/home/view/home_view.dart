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
                  TypeWithSuffixWidget(),
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
            _CustomSliderWidget(controller: controller),
          ],
        ),
      ),
    );
  }
}

class _CustomSliderWidget extends StatelessWidget {
  const _CustomSliderWidget({
    required this.controller,
  });

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items: const [
            _RoundedImageWidget(),
            _RoundedImageWidget(),
            _RoundedImageWidget()
          ],
          options: CarouselOptions(
            viewportFraction: 1,
            onPageChanged: (index, _) {
              controller.setCurrentIndex(index);
            },
          ),
        ),
        Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < 3; i++)
                CustomCircularContainer(
                  margin: const EdgeInsets.only(right: 10),
                  height: 4,
                  width: 16,
                  backgroundColor: controller.currentIndex.value == i
                      ? Colors.green
                      : Colors.grey,
                ),
            ],
          ),
        )
      ],
    );
  }
}

class _RoundedImageWidget extends StatelessWidget {
  const _RoundedImageWidget();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(
        AppSizes.defaultSpace,
      ),
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(AppSizes.md)),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(
            Radius.circular(AppSizes.md),
          ),
          child: Image.asset(
            'assets/images/banner_image1.png',
            // cacheHeight: 200,
            // cacheWidth: 400,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}

class TypeWithSuffixWidget extends StatelessWidget {
  const TypeWithSuffixWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Text(
        'Popular Categories',
        style: Theme.of(context).textTheme.headlineSmall,
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
    this.margin,
  });
  final double? width;
  final double? height;
  final double radius;
  final double padding;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
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
