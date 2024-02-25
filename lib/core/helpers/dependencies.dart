import 'package:get/get.dart';
import 'package:getx_clean_architecture/features/template/presentation/getxs/TemplateGetx.dart';

Future<void> init() async{
  Get.lazyPut(() => TemplateGetx());
}