// banner_widget.dart
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cmstask_repo/features/helper/colors.dart';
import 'package:cmstask_repo/features/helper/constants.dart';
import 'package:cmstask_repo/features/helper/styles.dart';
import 'package:cmstask_repo/features/news/presentation/category_bloc/category_bloc.dart';
import 'package:cmstask_repo/features/news/presentation/category_bloc/category_event.dart';
import 'package:cmstask_repo/features/news/presentation/category_bloc/category_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class CategoryWidget extends StatefulWidget {
  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  int _selectedIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    context.read<CategoryBloc>().add(const LoadCategoriesEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10,left: 10),
      child: BlocBuilder<CategoryBloc, CategoryState>(
        builder: (context, state) {
          if (state is CategoryLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is CategoryLoaded) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  Constants.categories,
                  style: TextStyles.boldBlackTextStyle,
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 35,
                  child: ListView.builder(
                    itemCount: state.categories.length,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return InkWell(
                          onTap: () {
                            setState(() {
                               _selectedIndex = index ;
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.only(right: 7,bottom: 5),
                            padding: const EdgeInsets.only(left: 10,right: 10.0),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: _selectedIndex == index ? AppColors.brickRed : Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1), // Lighter shadow color
                                  spreadRadius: 0, // Spread the shadow softly
                                  blurRadius: 2, // Increase blur for smoothness
                                  offset: Offset(0, 2), // Vertical offset for subtle elevation
                                ),
                              ],
                            ),
                            child: Text(
                              state.categories[index].title,
                              style: TextStyles.regularBlackTextStyle.copyWith(color:  _selectedIndex == index ? AppColors.white : AppColors.black),
                            ),
                          ));
                    },
                    scrollDirection: Axis.horizontal,
                  ),
                ),
              ],
            );
          } else if (state is CategoryError) {
            return const Center(child: Text('Failed to load banners'));
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}

// Similar widgets for CategoryWidget, NewsWidget
