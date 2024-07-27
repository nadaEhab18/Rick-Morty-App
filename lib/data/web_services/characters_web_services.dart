import 'package:dio/dio.dart';

import '../../constants/strings.dart';

class CharactersWebServices{
 late Dio dio;
 CharactersWebServices(){
   BaseOptions options = BaseOptions(
     baseUrl : baseUrl,
     receiveDataWhenStatusError: true,
     connectTimeout: Duration(seconds: 20), // 20sec
     receiveTimeout: Duration(seconds: 20),

   );

   dio = Dio(options);

 }
 Future<dynamic> getAllCharacters() async{
   try{
     Response response = await dio.get('character');
     // print(response.data['results']);
     return response.data['results'];
   }catch(e){
     print(e.toString());
     return [];
   }
 }

}

void main(){
  CharactersWebServices().getAllCharacters();
}
