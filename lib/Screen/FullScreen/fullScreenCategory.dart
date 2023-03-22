import 'package:flutter/material.dart';

import '../../Model/CategoryModel.dart';
import '../../Widgets/button_download_like_save.dart';


class fullScreenCategory extends StatelessWidget {


  CategoryPageModel categoryPageModel;


  fullScreenCategory(this.categoryPageModel);

  @override
  Widget build(BuildContext context) {

    return   Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Image.network(
              categoryPageModel.imgurl, fit: BoxFit.cover,
            ),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Button_D_L_S(categoryPageModel.imgurl),
            // ImageDownload(photoModel.imgurl) ,
          ),
          
        ],
      ),
    );
  }
}