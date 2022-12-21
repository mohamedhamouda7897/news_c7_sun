import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:news_c7_sun/models/NewsDataModel.dart';
import 'package:news_c7_sun/models/sources_response.dart';
import 'package:news_c7_sun/shared/components/components.dart';

import '../../constants/constants.dart';

class ApiManager {


 static Future<SourcesResponse> getSources()async {
    //https://newsapi.org/v2/top-headlines/sources?apiKey=dc3d106e730c4256b8c275d9da58d090

    var URL = Uri.https(BASE, '/v2/top-headlines/sources',
        {"apiKey": APIKEY});
    try{
      Response  sources= await http.get(URL);
       var json=jsonDecode(sources.body);
       SourcesResponse sourcesResponse= SourcesResponse.fromJson(json);
       return sourcesResponse;
    }catch(e){
      throw e;
    }


  }

  static Future<NewsDataModel> getNewsData(String sourceId)async{

   Uri URL=Uri.https(BASE, '/v2/everything',{
     "apiKey":APIKEY,
     "sources":sourceId
   });
   Response response=await http.get(URL);
   var json=jsonDecode(response.body);
   NewsDataModel newsDataModel=NewsDataModel.fromJson(json);
   return newsDataModel;
  }
}
