import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/Screens/Cubit/home_cubit.dart';
import 'package:newsapp/Screens/source/source_item.dart';
import '../news/news_items.dart';

class SourcesTitle extends StatefulWidget {
  const SourcesTitle({
    super.key,
  });

  @override
  State<SourcesTitle> createState() => _SourcesTitleState();
}

class _SourcesTitleState extends State<SourcesTitle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {},
      builder: (context, state) {
        return Column(
          children: [
            DefaultTabController(
              initialIndex: context.read<HomeCubit>().index,
              length: context.read<HomeCubit>().sources.length,
              child: TabBar(
                labelPadding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 4),
                onTap: (value) {
                  context.read<HomeCubit>().changeSourceState(value);
                },
                dividerColor: Colors.transparent,
                indicatorColor: Colors.transparent,
                isScrollable: true,
                tabs: context
                    .read<HomeCubit>()
                    .sources
                    .map(
                      (e) => SourceItem(
                        text: e.name ?? "",
                        isSelected:
                            context.read<HomeCubit>().sources.indexOf(e) ==
                                context.read<HomeCubit>().index,
                      ),
                    )
                    .toList(),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: context.read<HomeCubit>().articles.length,
                itemBuilder: (context, index) {
                  return NewsItems(
                    articles: context.read<HomeCubit>().articles[index],
                  );
                },
              ),
            ),
          ],
        );
      },
    ));
  }
}
