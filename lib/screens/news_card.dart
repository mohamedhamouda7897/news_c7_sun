import 'package:flutter/material.dart';
import 'package:news_c7_sun/models/NewsDataModel.dart';
import 'package:cached_network_image/cached_network_image.dart';
class NewsCard extends StatelessWidget {

  Articles articles;
  NewsCard(this.articles);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 6),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
            border: Border.all(color: Colors.green),
            borderRadius: BorderRadius.circular(12)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CachedNetworkImage(
            imageUrl:articles.urlToImage??"" ,
            height: 180,
            placeholder: (context, url) => Center(child:
            CircularProgressIndicator(color: Colors.green,)),
            errorWidget: (context, url, error) =>
                Icon(Icons.error),
          ),
          // Image.network(articles.urlToImage??"",
          //   height: 180,
          //   fit: BoxFit.fill,
          // ),
          Text(articles.author??"",style: TextStyle(
            fontSize: 13,
            color: Colors.grey.shade500
          ),),
          Text(articles.title??"",style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black
          ),),
          Text(articles.publishedAt?.substring(0,10)??"",textAlign: TextAlign.right,),

        ],
      ),
    );
  }
}
