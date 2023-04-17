import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../Bloc/pages/Upload/upload_cubit.dart';

//nb=
void showPicker(BuildContext context) {
  showModalBottomSheet(
    backgroundColor: Colors.black,
      context: context,
      builder: (BuildContext ctx) {
        return SafeArea(
          
            child: Wrap(
              
          children: [
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Pick photo from gallery',style: TextStyle(color: Colors.white),),
              onTap: () {
                BlocProvider.of<UploadCubit>(context).imgFromGallery();
                Navigator.of(context).pop();
              },
            ) ,
             ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Take photo by camera',style: TextStyle(color: Colors.white),),
              onTap: () {
                BlocProvider.of<UploadCubit>(context).imgFromCamera();
                Navigator.of(context).pop();
              },
            )
          ],
        )
        );
      });
}
