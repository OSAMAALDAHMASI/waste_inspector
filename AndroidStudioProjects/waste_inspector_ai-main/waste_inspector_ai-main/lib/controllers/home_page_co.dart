import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:image_picker/image_picker.dart';
import 'package:waste_inspector_ai/core/class/statusRequesr.dart';
import 'package:waste_inspector_ai/core/constant/app_strings.dart';
import 'package:waste_inspector_ai/data/models/title_model.dart';

abstract class HomePageCo extends GetxController {
  onTapCamera();
  onTapGellery();
  ontapSearch(File file, String prompt);
  updateExpand(int index, bool isExpanded);
  onBack();
}

class HomePageCoImp extends HomePageCo {
  File? myFile; //for path file
  bool isSearch = false; //for check page status
  List<TitleModel> titles = [
    TitleModel(title: AppStrings.examinationProcess, isExpanded: false), //المكونات وكيفية التصنيع
    TitleModel(
        title: AppStrings.manufacturingProcess, isExpanded: false), //المواد النستخدمة في التصنيع وتأثيرها على البيئه
    TitleModel(title: AppStrings.environmentalImpact, isExpanded: false), // تأثير المتدة على البيئة
    TitleModel(title: AppStrings.reuseSuggestions, isExpanded: false), // كيفية إعادة الاستخدتم
    TitleModel(title: AppStrings.reduceUse, isExpanded: false), // كيفية التقليل من الإستخدام
    TitleModel(title: AppStrings.information, isExpanded: false), // معلومات إضافيه
  ];
  Map<String, dynamic> responseData = {};
  List body = [];
  StatusRequest statusRequestGemaini = StatusRequest.loading;
  //for use gemini ai 👇
  final String apiKey = 'AIzaSyDS17WQQ9aFAmDUqH-atc5B0jYuDSgnDRw';
  late final GenerativeModel visionModel;

  @override
  void onInit() {
    super.onInit();
    visionModel = GenerativeModel(
      model: 'gemini-pro-vision',
      apiKey: apiKey,
    );
  }

  @override
  onTapCamera() async {
    XFile? xfile = await ImagePicker().pickImage(source: ImageSource.camera);
    myFile = xfile != null ? File(xfile.path) : null;
    update();
    Get.back();
  }

  @override
  onTapGellery() async {
    XFile? xfile = await ImagePicker().pickImage(source: ImageSource.gallery);
    myFile = xfile != null ? File(xfile.path) : null;
    update();
    Get.back();
  }

  @override
  ontapSearch(File file, String prompt) async {
    isSearch = true;
    statusRequestGemaini = StatusRequest.loading;
    update();
    try {
      var response = await visionModel.generateContent([
        Content.multi([
          TextPart(prompt), // ماذا تريد منه أن يفعل بالصورة
          // The only accepted mime types are image/*.
          DataPart('image/jpeg', await file.readAsBytes()), // الصوره
        ])
      ]);
      var text = response.text;

      if (text == null) {
        statusRequestGemaini = StatusRequest.failur;
        update();
      } else {
        responseData = jsonDecode(text);
        print(responseData);
        body = responseData.values.map((e) => e).toList(); // لأخذ الأجوبه من كل جزئ في الماب
        statusRequestGemaini = StatusRequest.success;
        update();
      }
    } catch (e) {
      statusRequestGemaini = StatusRequest.errorServer;
      update();
    }

    update();
  }

  @override
  onBack() {
    isSearch = false;
    update();
  }

  @override
  updateExpand(int index, bool isExpanded) {
    titles[index].isExpanded = isExpanded;
    update();
  }
}
