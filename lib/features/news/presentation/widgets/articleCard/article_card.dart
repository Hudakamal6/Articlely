import 'package:articlely/core/theme/color_manager.dart';
import 'package:articlely/features/news/presentation/widgets/articleCard/see_article_details_button.dart';
import 'package:flutter/material.dart';
import '../../../domain/entities/articles_entity.dart';
import '../../pages/article_details_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ArticleCard extends StatelessWidget {
  final ArticleEntity article;

  const ArticleCard({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
       showArticleDetails(context);
      },
      child: Container(
        height: 170.h,
        margin: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 12,
              spreadRadius: 1,
              offset: Offset(0, 4),
            ),
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          children: [
            Positioned.fill(
              child: article.urlToImage != null
                  ? Image.network(
                      article.urlToImage!,
                      fit: BoxFit.cover,
                    )
                  : Container(
                      color: ColorManager.babyBlue,
                      child: const Center(
                        child: Icon(Icons.image, size: 50, color: Colors.white),
                      ),
                    ),
            ),
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.transparent,
                      Colors.black.withOpacity(0.65),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 14.w,
              right: 14.w,
              bottom: 16.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    article.title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w700,
                      height: 1.2.h,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    article.description ?? '',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 11.sp,
                      height: 1.2.h,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 7.h),
                  SeeArticleDetailsButton(publishedAt: article.publishedAt.toString(),onPress:(){
                    showArticleDetails(context);
                  },)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  void showArticleDetails(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
      ),
      builder: (_) => ArticleDetailsBottomSheet(article: article),
    );
  }


}
