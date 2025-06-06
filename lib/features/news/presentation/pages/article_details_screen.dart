import 'package:articlely/core/helpers/helpers_functions.dart';
import 'package:articlely/core/theme/color_manager.dart';
import 'package:articlely/features/news/presentation/widgets/articleDetails/author_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../domain/entities/articles_entity.dart';
import '../widgets/articleDetails/article_date_widget.dart';
import '../widgets/articleDetails/article_description_widget.dart';
import '../widgets/articleDetails/article_image_widget.dart';
import '../widgets/articleDetails/open_article_url_widget.dart';

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
                if (article.description != null)
                  ArticleImageWidget(
                    articleImageUrl: article.urlToImage!,
                  ),
                SizedBox(height: 16.h),
                ArticleDateWidget(
                  articlePublishedAt: article.publishedAt.toString(),
                  articleSourceName: article.source.name,
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
                  AuthorWidget(articleAuthor: article.author!),
                SizedBox(height: 20.h),
                if (article.description != null) ...[
                  ArticleDescriptionWidget(
                    articleDescription: article.description!,
                  )
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
                OpenArticleUrlButton(articleUrl: article.url),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        );
      },
    );
  }
}
