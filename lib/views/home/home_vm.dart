
import 'package:flutter/cupertino.dart';
import 'package:ropstam_flutter_task/data/models/post_model.dart';
import 'package:ropstam_flutter_task/data/base/base_vm.dart';
import 'package:ropstam_flutter_task/data/extentions.dart';
import 'package:ropstam_flutter_task/data/services/web_services.dart';
import 'package:ropstam_flutter_task/utilities/general_utilities.dart';

import '../../data/models/validation_model.dart';

class HomeVm extends BaseVm {
  bool _loading = false;

  List<Post> _postList= [];

  List<Post> get postList => _postList;

  set postList(List<Post> value) {
    _postList = value;
    notifyListeners();
  }



  bool get loading => _loading;

  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future getPosts(BuildContext context) async {
    try{
      loading = true;

      var url = "Posts";

      var resp = await WebService.get(url);
      if (resp.statusCode == 200) {
        print('In success status condition...');
        // print('response is ${ resp.data['payload']}');
        postList =  List<Post>.from(resp.data
            .map((e) => Post.fromJson(e)));
        loading = false;
        print('value of loader in controller  is ${loading}');
        print('post list length is ${postList.length}');
      } else {
        loading = false;
        print("error is ${resp.statusCode}");
      }
    }catch(e){
      loading= false;
      GeneralUtilities.showMessage(
          context: context,
          title: "Error",
          text:
          "Server Error");

    }
  }
}

