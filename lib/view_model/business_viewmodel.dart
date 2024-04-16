import 'package:yelptask/model/business.dart';
import 'package:yelptask/model/business_model.dart';

class BusinessViewModel {
  final BusinessModel _businessModel = BusinessModel();

  List<Business> _businessList = [];

  List<Business> get businessListData => _businessList;

  Future<bool> fetchBusinessData() async {
    List<Business> businessList = await _businessModel.fetchMediaList();
    _businessList = businessList;
    return true;
  }
}
