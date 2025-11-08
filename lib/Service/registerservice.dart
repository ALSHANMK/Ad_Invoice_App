import 'package:get/get.dart';
class Registerservice extends GetConnect{

  @override
  void onInit(){
    httpClient.baseUrl="http://127.0.0.1:8000/api/";
    httpClient.timeout=Duration(seconds: 30);
  }

  Future<dynamic> registeruser(Map<String,dynamic> data) async
  {
    try{
      
        final response=await post("users/register/", data);
        return response.body;
    }catch (e)
    {
      //print('Detailed error: $e');
      //print('Error type: ${e.runtimeType}');
      throw 'Registration Failed :$e';
    }

  }
  
}
