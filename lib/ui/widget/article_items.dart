import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:myapp/ui/Screens/article_details_view.dart';
import 'package:myapp/utils/color_manager.dart';

Widget buildNewsItem(context ,article) {
  var urlToImage = article["urlToImage"];
  return InkWell(
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context)=>  ArticleDetailsView(url:"${article["url"]}" , Name: "${article["title"]}",)));
    },
      child: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            // child: Image.network("${article["urlToImage"]}",
            //     width: 300, height: 150),
            child: ConditionalBuilder(
                condition: urlToImage != null,
                builder: (context) => Image.network("${article["urlToImage"]}",
                width: 300, height: 150),
    
                fallback:(context) => Icon(Icons.error,color: ColorManager.bottomNavBarItemColor,)),
          ),
          const SizedBox(
            height: 3,
          ),
          Directionality(
            textDirection: TextDirection.rtl,
            child: Text("${article["title"]}",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  overflow: TextOverflow.ellipsis,
                )),
          ),
          const SizedBox(
            height: 3,
          ),
          Text("${article["publishedAt"]}",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w400,
                overflow: TextOverflow.ellipsis,
              )),
        ],
      ),
    ),
  );
}

