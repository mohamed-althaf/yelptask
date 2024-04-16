import 'package:yelptask/model/business.dart';
import 'package:yelptask/model/business_service.dart';

class BusinessModel {
  final BusinessSerivce _businessSerivce = BusinessSerivce();

  Future<List<Business>> fetchBusinessList() async {
    dynamic response = await _businessSerivce.get();
    final jsonData = response['businesses'] as List;
    List<Business> businessList =
        jsonData.map((value) => Business.fromJson(value)).toList();
    return businessList;
  }
}
