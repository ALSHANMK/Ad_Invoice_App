import 'package:get/get.dart';

class Userscontroller extends GetxController{

  var filteredusers=<Map<String,dynamic>>[].obs;

  final RxInt selecteduser=(-1).obs;
  RxList<Map<String,dynamic>> users=<Map<String,dynamic>>[].obs;

  @override
  void onInit()
  {
    super.onInit();
   ever(users, (_){
    filteredusers.assignAll(users);
   });
  }

  void filtering(String query)
  {
    if(query.isEmpty)
    {
      filteredusers.assignAll(users);
    }
    else {
      filteredusers.assignAll(users.where((p)=>p['name'].toString().toLowerCase().contains(query.toLowerCase())));
    }
  }

  void selection(int index)
  {
    if(selecteduser.value==index)
    {
      selecteduser.value=-1;
    }
    else {
      selecteduser.value=index;
    }
  }

  Map<String,dynamic>? get userinfo{
    if(selecteduser.value >=0 && selecteduser.value<users.length)
    {
      return users[selecteduser.value];
    }
    return null;
  }
}