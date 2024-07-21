import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../routes/routes.dart';
import '../../controller/home_controller.dart';
import '../../controller/state/home_state.dart';
import 'card_cat.dart';

class ListCardCats extends StatefulHookConsumerWidget {
  const ListCardCats({
    super.key,
    required this.homeState,
  });
  final HomePageState homeState;

  @override
  ConsumerState<ListCardCats> createState() => _ListCardCatsState();
}

class _ListCardCatsState extends ConsumerState<ListCardCats>
    with AutomaticKeepAliveClientMixin {
  final scrollController = ScrollController();
  final _textEditingController = TextEditingController();
  final _query = ValueNotifier('');

  @override
  void dispose() {
    scrollController.dispose();
    _textEditingController.clear();
    _query.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: SizedBox(
            height: 50,
            width: double.maxFinite,
            child: TextField(
              controller: _textEditingController,
              onChanged: (text) => _query.value = text.trim(),
              decoration: InputDecoration(
                hintText: 'name',
                suffixIcon: IconButton(
                  icon: const Icon(
                    Icons.clear,
                  ),
                  onPressed: () {
                    _textEditingController.clear();
                    _query.value = '';
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                ),
              ),
            ),
            // color: Colors.red,
          ),
        ),
        Expanded(
          child: NotificationListener(
              onNotification: (t) {
                if (t is ScrollEndNotification) {
                  final offset = scrollController.position.pixels;
                  final maxScrollExtent =
                      scrollController.position.maxScrollExtent;
                  if (offset >= maxScrollExtent) {
                    int page = widget.homeState.page;
                    ref.read(homeController.notifier).init(
                          page: page += 1,
                        );
                  }
                }
                return true;
              },
              child: ValueListenableBuilder(
                valueListenable: _query,
                builder: (_, query, __) {
                  final filteredUser = query.isEmpty
                      ? widget.homeState.listBreeds
                      : widget.homeState.listBreeds
                          .where(
                            (e) => e.name.toLowerCase().contains(
                                  query.toLowerCase(),
                                ),
                          )
                          .toList();

                  return ListView.separated(
                    controller: scrollController,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 5),
                    itemCount: filteredUser.length,
                    itemBuilder: (_, i) {
                      final cats = filteredUser[i];
                      return AspectRatio(
                        aspectRatio: 4 / 3,
                        child: GestureDetector(
                          onTap: () => Navigator.pushNamed(
                            context,
                            Routes.DETAILS,
                            arguments: cats,
                          ),
                          child: CardCat(cats: cats),
                        ),
                      );
                    },
                  );
                },
              )),
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
