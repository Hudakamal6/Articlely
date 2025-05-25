import 'package:articlely/core/helpers/helpers_functions.dart';
import 'package:articlely/core/theme/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../domain/entities/articles_entity.dart';

class ArticleDetailsBottomSheet extends StatelessWidget {
  final ArticleEntity article;

  const ArticleDetailsBottomSheet({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      maxChildSize: 0.95,
      minChildSize: 0.5,
      initialChildSize: 0.85,
      expand: false,
      builder: (context, scrollController) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
                offset: Offset(0, -4),
              )
            ],
          ),
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    height: 5.h,
                    width: 50.w,
                    margin: EdgeInsets.only(bottom: 10.h),
                    decoration: BoxDecoration(
                      color: ColorManager.primaryColor,
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                  ),
                ),

                if (article.urlToImage != null)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16.r),
                    child: Image.network(
                      article.urlToImage!,
                      width: double.infinity,
                      fit: BoxFit.contain,
                    ),
                  ),

                SizedBox(height: 16.h),

                Row(
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
                      decoration: BoxDecoration(
                        color: ColorManager.babyBlue.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      child: Text(
                        article.source.name,
                        style: TextStyle(
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w600,
                          color: ColorManager.primaryColor,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        const Icon(Icons.calendar_month,
                            size: 14, color: ColorManager.primaryColor),
                        SizedBox(width: 4.w),
                        Text(
                          HelpersFunctions.formatDate(
                              article.publishedAt.toString()),
                          style: TextStyle(
                              fontSize: 11.sp,
                              fontWeight: FontWeight.bold,
                              color: ColorManager.primaryColor),
                        ),
                      ],
                    ),
                  ],
                ),

                SizedBox(height: 12.h),

                Text(
                  article.title,
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 8.h),

                if (article.author != null)
                  Row(
                    children: [
                      const Icon(Icons.person,
                          size: 18, color: ColorManager.primaryColor),
                      SizedBox(width: 6.w),
                      Text(
                        article.author!,
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.grey.shade700,
                        ),
                      ),
                    ],
                  ),

                SizedBox(height: 20.h),

                if (article.description != null) ...[
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(bottom: 20.h),
                    padding: EdgeInsets.all(14.h),
                    decoration: BoxDecoration(
                      color: ColorManager.babyBlue.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(16.r),
                      boxShadow: [
                        BoxShadow(
                          color: ColorManager.babyBlue.withOpacity(0.2),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Description",
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                            color: ColorManager.primaryColor,
                          ),
                        ),
                        SizedBox(height: 6.h),
                        Text(
                          article.description!,
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.black87,
                            height: 1.5.h,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],

                if (article.content != null) ...[
                  Text(
                    "Content",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      article.content!,
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.grey.shade800,
                        height: 1.7.h,
                      ),
                    ),
                  ),
                ],

                SizedBox(height: 28.h),

                Center(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      HelpersFunctions.launchURL(article.url);
                    },
                    icon: const Icon(Icons.open_in_new,
                        color: ColorManager.primaryColor),
                    label: const Text(
                      'Read Full Article',
                      style: TextStyle(color: ColorManager.primaryColor),
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                          horizontal: 24.w, vertical: 12.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      backgroundColor: Colors.blue.shade50,
                    ),
                  ),
                ),

                SizedBox(height: 20.h),
              ],
            ),
          ),
        );
      },
    );
  }
}
