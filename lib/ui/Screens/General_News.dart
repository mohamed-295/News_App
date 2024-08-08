import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/Data/Cubit/cubit.dart';
import 'package:myapp/ui/widget/article_items.dart';

import '../../Data/Cubit/states.dart';

class GeneralNews extends StatelessWidget {
  const GeneralNews({super.key});

  @override
  Widget build(BuildContext context) {
     return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).general;
        return ConditionalBuilder(
            condition: state is !GetGeneralDataLoadingState,
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
