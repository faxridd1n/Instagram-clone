import 'package:cached_network_image/cached_network_image.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/Models/postModel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:readmore/readmore.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../Bloc/pages/home/page_view_cubit.dart';

  Widget itemOfPost(BuildContext context, Post post) { 
   return BlocProvider<ImageCubit>( 
     create: (_) => ImageCubit(), 
   child: BlocBuilder<ImageCubit, int>( 
     builder: (context,state){ 
       return  Container( 
        // color: Colors.black, 
         child: Column( 
           children: [ 
             const Divider(), 
             //#user info 
             Container( 
               padding: const EdgeInsets.symmetric(horizontal: 10), 
               child: Row( 
                 mainAxisAlignment: MainAxisAlignment.spaceBetween, 
                 children: [ 
                   Row( 
                    crossAxisAlignment: CrossAxisAlignment.center,
                     children: [ 
                       ClipRRect( 
                         borderRadius: BorderRadius.circular(40), 
                         child: post.userImage == null 
                             ? const Image( 
                           image: AssetImage("assets/images/f1.jpg"), 
                           width: 40, 
                           height: 40, 
                           fit: BoxFit.cover, 
                         ) 
                             : Image.network( 
                           post.userImage! , 
                           width: 40, 
                           height: 40, 
                           fit: BoxFit.cover, 
                         ), 
                       ), 
                           const SizedBox( 
                         width: 10, 
                       ), 
                       Column( 
                         crossAxisAlignment: CrossAxisAlignment.start, 
                         children: [ 
                           Text( 
                             post.fullname ?? '', 
                             style: const TextStyle( 
                                 fontWeight: FontWeight.bold, color: Colors.white,), 
                           ), 
                           const SizedBox( 
                             height: 3, 
                           ), 
                           const Text( 
                             '14.04.2023', 
                             style: TextStyle(fontWeight: FontWeight.normal,color: Colors.white,), 
                           ), 
                         ], 
                       ), 
                     ], 
                   ), 
                   true 
                       ? IconButton( 
                     icon: const Icon(Icons.more_horiz), 
                     onPressed: () { 
                       //_dialogRemovePost(post); 
                     }, 
                   ) 
                       : const SizedBox.shrink(), 
                 ], 
               ), 
             ), 
             //#post image 
             const SizedBox( 
               height: 8, 
             ), 
             SizedBox( 
              width: MediaQuery.of(context).size.width,
               height: MediaQuery.of(context).size.width, 
               child: PageView.builder( 
                 onPageChanged: (index){ 
                   context.read<ImageCubit>().changeImage(index); 
                 }, 
                 controller: context.watch<ImageCubit>().pageController, 
                 itemCount: post.postImage!.length, 
                 itemBuilder: (context,index){ 
                   return  CachedNetworkImage( 
                     width: MediaQuery.of(context).size.width, 
                     imageUrl: post.postImage![index], 
                     placeholder: (context, url) =>  Shimmer.fromColors(
                         baseColor: Colors.grey, 
                         highlightColor: Colors.white, 
                         child: Padding( 
                           padding:  const EdgeInsets.all(13), 
                           child: Container( 
                             height: MediaQuery.of(context).size.width, 
                             width: MediaQuery.of(context).size.width, 
                             decoration: BoxDecoration( 
                                 color: Colors.grey.shade600, 
                             ), 
                           ), 
                         )), 
                     errorWidget: (context, url, error) => const Icon(Icons.error), 
                     fit: BoxFit.cover, 
                   ); 
                 }, 
               ), 
             ), 
             //#like share 
             Row( 
               // mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
               children: [ 
                 SizedBox( 
                   width: MediaQuery.of(context).size.width /2- 20, 
                   child: Row( 
                     children: [ 
                       IconButton( 
                         onPressed: () { 
  
                         }, 
                         icon: true 
                             ? const Icon( 
                           EvaIcons.heart, 
                           color: Colors.red, 
                         ) 
                             :  const Icon( 
                           EvaIcons.heartOutline, 
                           color: Colors.black, 
                         ), 
                       ), 
                       IconButton( 
                         onPressed: () {}, 
                         icon: const Icon( 
                           EvaIcons.shareOutline, 
                           color: Colors.white,
                         ), 
                       ), 
                     ], 
                   ), 
                 ), 
                 post.postImage!.length > 1 ? 
                 SmoothPageIndicator( 
  
                   controller: context.watch<ImageCubit>().pageController, 
                   count: post.postImage!.length, 
                   effect: const WormEffect( 
                     dotWidth: 7.0, 
                     dotHeight: 7.0, 
                     activeDotColor: Colors.blue, 
                     dotColor: Colors.grey, 
                   ), 
                 ): const SizedBox.shrink(), 
  
               ], 
             ), 
  
             //#caption 
             Container( 
            //  color: Colors.black,
               width: MediaQuery.of(context).size.width, 
               margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10), 
               child: const ReadMoreText(
                'w;kf el;kmwp mkmfkw kwke fkm wmemfk mdsklm  sdf sdfgsdf sdf sdfs df lskdfh khjeklse fefkle jk sjk jks jks kjdkj skj dkj skjf skjf kjs kjs kjs jks',
                trimLines: 2,
                colorClickableText: Colors.grey,
                style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,),
                trimMode: TrimMode.Line,
                trimExpandedText: '  less',
                trimCollapsedText: '...more',
               )
             ), 
           ], 
         ), 
       ); 
     }, 
   ), 
   ); 
  
  
  
 }