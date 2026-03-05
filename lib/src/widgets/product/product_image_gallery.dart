import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductImageGallery extends StatefulWidget {
  final List<String> images;

  const ProductImageGallery({Key? key, required this.images}) : super(key: key);

  @override
  State<ProductImageGallery> createState() => _ProductImageGalleryState();
}

class _ProductImageGalleryState extends State<ProductImageGallery> {
  late PageController _pageController;
  final RxInt _currentPage = 0.obs;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _pageController.addListener(() {
      _currentPage.value = _pageController.page?.round() ?? 0;
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double galleryHeight = (screenHeight * 0.5).clamp(300.0, 500.0);

    return SizedBox(
      height: galleryHeight,
      child: Stack(
        children: [
          Container(
            color: Colors.grey[100],
            child: PageView.builder(
              controller: _pageController,
              itemCount: widget.images.length,
              itemBuilder: (context, index) {
                return Image.network(
                  widget.images[index],
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.image_not_supported, size: 80),
                );
              },
            ),
          ),
          // Page Indicators (Dots)
          if (widget.images.length > 1)
            Positioned(
              bottom: 16,
              left: 0,
              right: 0,
              child: Center(
                child: Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      widget.images.length,
                      (index) => Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: _currentPage.value == index ? 12 : 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: _currentPage.value == index
                              ? const Color(0xFFEA8735)
                              : const Color(0xFFFFD4A8),
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
