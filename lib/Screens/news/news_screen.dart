import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/news__cubit.dart';
import '../source/sources_title.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit, NewsState>(
      builder: (context, snapshot) {

        print("Ahmed $snapshot");
        if (snapshot is NewsLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot is NewsError) {
          return Center(child: Text(snapshot.error.toString()));
        } else if (snapshot is SourcesLoaded) {
          var sources = snapshot.source;
          return SourcesTitle(
            sources: sources,
          );
        } else {
          return const Center(child: Text('Loading...'));
        }
      },
    );
  }
}
