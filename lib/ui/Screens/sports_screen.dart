import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/Data/Cubit/cubit.dart';
import 'package:myapp/Data/Cubit/states.dart';

import '../widget/article_items.dart';

class SportsScreen extends StatelessWidget {
  const SportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
     return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).sports;
        return ConditionalBuilder(
            condition: state is !GetSportsDataLoadingState,
            builder: (context) => ListView.separated(
                itemBuilder: (context, index) {
                  return buildNewsItem(context,list[index]);
                },
                separatorBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Divider(
                      color: Colors.grey,
                      thickness: 1,
                    ),
                  );
                },
                itemCount: list.length),
            fallback: (context) =>const Center(child:  CircularProgressIndicator()));
      },
    );
  }
}
