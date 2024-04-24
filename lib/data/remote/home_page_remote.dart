import 'package:waste_inspector_ai/core/class/curd.dart';
import 'package:waste_inspector_ai/core/constant/app_links.dart';

class HomePageRemote {
  Curd curd;
  HomePageRemote(this.curd);
  googleSearchPost(String searchText) async {
    var response = await curd.postdata(AppLinks.googleSearch, {
      "text": searchText,
      "safesearch": 'off',
      "region": 'wt-wt',
      "color": '',
      "size": '',
      "type_image": '',
      "layout": '',
      "max_results": 10
    }, {
      'content-type': 'application/json',
      'X-RapidAPI-Key': AppLinks.googleSearchApiKey,
      'X-RapidAPI-Host': AppLinks.xRapidAPIHost
    });
    return response.fold((l) => l, (r) => r);
  }
}
