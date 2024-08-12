
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cmstask_repo/features/helper/colors.dart';
import 'package:cmstask_repo/features/helper/constants.dart';
import 'package:cmstask_repo/features/helper/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class BreakingNewsDetailScreen extends StatelessWidget {
  final String id;
  final String title;
  final String image;
  final String text;
  final String htmlDescription;

  const BreakingNewsDetailScreen({
    required this.id,
    required this.title,
    required this.image,
    required this.text,
    required this.htmlDescription,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: 'imageHero$id',
                child: Container(
                  height: 280,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                      borderRadius:  BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30)),),
                  child: Stack(
                      children: [
                        Positioned(
                          top: 0,
                          left: 0,
                          child: CachedNetworkImage(
                            height: 280,
                            width: MediaQuery.of(context).size.width,
                            imageUrl:
                            image!,
                            fit: BoxFit.contain,
                            filterQuality: FilterQuality.high,
                            placeholder: (context, url) => const Center(
                                child: CircularProgressIndicator()),
                            errorWidget: (context, url, error) =>
                                Center(
                                  child: Image.asset(
                                    Assets.errorImage,
                                    filterQuality: FilterQuality.high,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                          ),
                        ),
                        Positioned(
                          top: 15,
                          left: 15,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: const Icon(
                                Icons.arrow_back,
                                color: AppColors.brickRed,
                                size: 25,
                              ),
                            ),
                          ),
                        ),

                      ]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  title,
                  style: TextStyles.boldBlackTextStyle.copyWith(fontSize: 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  " #${text.toLowerCase()}",
                  style: TextStyles.boldBlackTextStyle.copyWith(fontSize: 16),
                ),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: HtmlWidget(htmlDescription),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
