import 'package:waste_inspector_ai/core/class/statusRequesr.dart';

handelResponse(var response) {
  if (response is StatusRequest) {
    return response;
  } else {
    return StatusRequest.success;
  }
}
