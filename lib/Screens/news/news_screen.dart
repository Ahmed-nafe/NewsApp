import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/Model/category_model.dart';
import 'package:newsapp/Screens/Cubit/home_cubit.dart';
import '../source/sources_title.dart';

class NewsScreen extends StatelessWidget {
  static String routeName = "news";
  CategoryModel categoryModel;
  NewsScreen({super.key, required this.categoryModel});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getSource(categoryModel.id)..getNewsData(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          if (state is NewsLoading) {
            const Center(child: CircularProgressIndicator());
          }
          else if (state is NewsError) {
            Center(child: Text("Error Is ${state.error.toString()}"));
            print(state.error.toString());
          }
          else if (state is SourcesLoaded) {
            context.read<HomeCubit>().getNewsData();
             // SourcesTitle();
          }
          else if (state is NewsLoaded) {}
          else if (state is ChangeNewsState) {
            context.read<HomeCubit>().getNewsData();
          }
        },
        builder: (context, state) {
          return const SourcesTitle();
        },
      ),
    );
  }
}
