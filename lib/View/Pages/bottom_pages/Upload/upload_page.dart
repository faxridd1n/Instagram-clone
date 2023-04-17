import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../Bloc/pages/Upload/upload_cubit.dart';
import '../../../../Bloc/pages/Upload/upload_state.dart';
import 'components/show_picker.dart';

class UploadPage extends StatefulWidget {
  const UploadPage({super.key});

  @override
  State<UploadPage> createState() => _UploadPageState();
}

//nb=
class _UploadPageState extends State<UploadPage> {
  var captionCtr = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text(
          'Upload',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Billabong',
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.drive_folder_upload,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: BlocProvider<UploadCubit>(
        create: (_) => UploadCubit(),
        child: BlocBuilder<UploadCubit, UploadState>(
          builder: (context, state) {
            if (state is UploadInit) {
              return viewPage(context, null);
            }
            if (state is UploadLoad) {
              return viewPage(context, state.image!);
            }
            return const Center(
              child: Text('nothing'),
            );
          },
        ),
      ),
    );
  }

//nb=
  Widget viewPage(BuildContext context, List<File>? image) {
    return Stack(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  showPicker(context);
                },
                child: Container(
                  // width: double.infinity,
                  height: MediaQuery.of(context).size.width+100,
                  color: Colors.grey.withOpacity(0.4),
                  child: (image == null)
                      ? const Center(
                          child: Icon(
                            Icons.add_a_photo,
                            size: 50,
                            color: Colors.grey,
                          ),
                        )
                      : Stack(
                          children: [
                            GridView.builder(
                             // physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: image.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                ),
                                itemBuilder: (BuildContext context, int index) {
                                  return Image.file(
                                    image[index],
                                    width: double.infinity,
                                    height: double.infinity,
                                    fit: BoxFit.cover,
                                  );
                                }),
                            Container(
                              width: double.infinity,
                              color: Colors.black12,
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      BlocProvider.of<UploadCubit>(context);
                                    },
                                    icon: const Icon(Icons.highlight_remove),
                                    color: Colors.white,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
                child: TextField(
                  controller: captionCtr,
                  style: const TextStyle(color: Colors.black),
                  keyboardType: TextInputType.multiline,
                  minLines: 1,
                  maxLines: 5,
                  decoration: const InputDecoration(
                      hintText: 'Caption',
                      hintStyle:
                          TextStyle(fontSize: 17, color: Colors.black38)),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
