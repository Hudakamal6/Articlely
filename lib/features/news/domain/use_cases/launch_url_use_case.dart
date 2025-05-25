import 'package:url_launcher/url_launcher.dart';

import '../../../../core/error/failure.dart';
import 'package:dartz/dartz.dart';

class LaunchUrlUseCase {
  Future<Either<Failure, void>> call(String url) async {
    final Uri uri = Uri.parse(url);

    if (await canLaunchUrl(uri)) {
      try {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
        return right(null);
      } catch (e) {
        return left(const Failure( 'Failed to launch the URL.'));
      }
    } else {
      return left(const Failure('Cannot launch the URL.'));
    }
  }
}