import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'image_picker.g.dart';

@Riverpod(keepAlive: true)
ImagePicker imagePicker(Ref ref) => ImagePicker();
