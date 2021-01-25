import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';



class ArticleTileImage extends StatelessWidget {

  final String networkImageUrl;
  const ArticleTileImage({this.networkImageUrl});


  @override
  Widget build(BuildContext context) {

    /// [urlImageを取得できていない場合のif]
    final invalidNetworkImageUrl = networkImageUrl.startsWith("http");
    if(networkImageUrl == null || networkImageUrl == "" || !invalidNetworkImageUrl){
      return const Icon(Icons.broken_image);
    } else {
      return CachedNetworkImage(    /// [CachedNetworkImage: cacheする]
        imageUrl: networkImageUrl,
        placeholder: (context, url) => CircularProgressIndicator(),
        errorWidget: (context, url, error) => Icon(Icons.error),
      );
    }
  }
}