import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:radio_life/core/domain/use_cases/base/base_use_case.dart';
import 'package:universal_io/io.dart';

@injectable
class ImageToBase64UseCase extends BaseFutureUseCase<File, String> {
  @override
  Future<String> call(File params) async {
    final List<int> imageBytes = await params.readAsBytes();
    final base64Image = base64Encode(imageBytes);
    return base64Image;
  }
}
