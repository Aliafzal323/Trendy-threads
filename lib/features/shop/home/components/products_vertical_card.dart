import 'package:flutter/material.dart';
import 'package:trendy_threads/features/shop/home/view/view.dart';
import 'package:trendy_threads/utils/constants/sizes.dart';
import 'package:trendy_threads/utils/helpers/custom_helpers.dart';
import 'package:trendy_threads/widgets/rounded_image.dart';

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
                    top: 12,
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
