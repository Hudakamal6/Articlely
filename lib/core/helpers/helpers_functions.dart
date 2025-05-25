import 'package:articlely/core/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../features/news/presentation/manager/news/news_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HelpersFunctions {
  static void checkCurrentSelectedCategoryIndex(
      int index, BuildContext context, String selectedCategory) {
    if (index == 0) {
      context
          .read<NewsCubit>()
          .getNews('${Constants.apiBaseUrl}${Constants.getNewApi}news');
    } else {
      context.read<NewsCubit>().getNews(
          '${Constants.apiBaseUrl}${Constants.getNewApiByCategory} ${Constants.categoryKeyword}${selectedCategory}');
    }
  }

  static String formatDate(String? dateStr) {
    try {
      final date = DateTime.parse(dateStr ?? '');
      return DateFormat.yMMMd().add_jm().format(date);
    } catch (_) {
      return 'Unknown Date';
    }
  }

  static Future<void> launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }
}
