import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:waste_inspector_ai/core/class/curd.dart';
import 'package:waste_inspector_ai/core/class/statusRequesr.dart';
import 'package:waste_inspector_ai/core/constant/app_strings.dart';
import 'package:waste_inspector_ai/core/functions/handel_response.dart';
import 'package:waste_inspector_ai/data/models/title_model.dart';
import 'package:waste_inspector_ai/data/remote/home_page_remote.dart';

abstract class HomePageCo extends GetxController {
  onTapCamera();
  onTapGellery();
  ontapSearch(File file, String prompt);
  updateExpand(int index, bool isExpanded);
  getGoogleSearch(String searchText);
  onTapImageGoogleSearch(String url) ;
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
    TitleModel(title: AppStrings.forYou, isExpanded: false), // عرض محتوى من جوجل
  ];
  Map<String, dynamic> responseData = {};
  List body = [];
  StatusRequest statusRequestGemaini = StatusRequest.loading;
  List googleSearchItems = [];
  final HomePageRemote homePageRemote = HomePageRemote(Curd());
  StatusRequest statusRequestGoogleSearch = StatusRequest.loading;
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
      print(response.text) ;

      if (text == null) {
        statusRequestGemaini = StatusRequest.failur;
        update();
      } else {
        responseData = jsonDecode(text);
        print(responseData["Title"]);
        body = responseData.values.map((e) => e).toList(); // لأخذ الأجوبه من كل جزئ في الماب
         getGoogleSearch(responseData["Title"]);
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

  @override
  getGoogleSearch(String searchText) async {
    statusRequestGoogleSearch = StatusRequest.loading;
    update();
    var response = await homePageRemote.googleSearchPost(searchText);
    StatusRequest handeling = handelResponse(response);
    if (handeling == StatusRequest.success) {
      googleSearchItems = response["result"];
      statusRequestGoogleSearch = StatusRequest.success;
      update();
    } else {
      statusRequestGoogleSearch = StatusRequest.errorServer;
    }
  }
  
  @override
  onTapImageGoogleSearch(String url) async{
   Uri openUrl = Uri.parse(url) ;
   if (!await launchUrl(openUrl)) {
    throw Exception('Could not launch $openUrl');
  }

  }
}
