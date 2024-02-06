import 'package:flutter/material.dart';

import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pokemon/model/pokemon_model.dart';
import 'package:pokemon/service/pokemon.service.dart';

class Pokemon extends StatefulWidget {
  const Pokemon({super.key});

  @override
  State<Pokemon> createState() => _PaginationState();
}

class _PaginationState extends State<Pokemon> {
  static const _pageSize = 2;

  final PagingController<int, Result> _pagingController =
      PagingController(firstPageKey: 0);

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final newItems = await ApiService.fetchUserList(pageKey, _pageSize);
      final isLastPage = newItems!.results!.length < _pageSize;
      if (isLastPage) {
        _pagingController.appendLastPage(newItems.results!);
      } else {
        final nextPageKey = pageKey + newItems.results!.length;
        _pagingController.appendPage(newItems.results!, nextPageKey);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  @override
  Widget build(BuildContext context) =>
      // Don't worry about displaying progress or error indicators on screen; the
      // package takes care of that. If you want to customize them, use the
      // [PagedChildBuilderDelegate] properties.
      Scaffold(
        backgroundColor: const Color.fromARGB(255, 86, 207, 179),
        body: PagedListView<int, Result>(
          pagingController: _pagingController,
          builderDelegate: PagedChildBuilderDelegate<Result>(
              animateTransitions: true,
              // [transitionDuration] has a default value of 250 milliseconds.
              transitionDuration: const Duration(milliseconds: 500),
              itemBuilder: (context, item, index) => Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromARGB(255, 104, 104, 104),
                          offset: Offset(
                            1.5,
                            2.5,
                          ),
                          blurRadius: 3.0,
                          spreadRadius: 0.5,
                        ), //BoxShadow
                        BoxShadow(
                          color: Colors.white,
                          offset: Offset(0.0, 0.0),
                          blurRadius: 0.0,
                          spreadRadius: 0.0,
                        ), //BoxShadow
                      ],
                      border: Border.all(
                          color: const Color.fromARGB(255, 110, 110, 110)),
                    ),
                    padding: const EdgeInsets.all(5),
                    margin:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: ListTile(
                      leading: Image.network(item.imageUrl!),
                      title: Text(
                        capitalize(
                          item.name!,
                        ),
                        style:
                            const TextStyle(color: Colors.black, fontSize: 20),
                      ),
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          '/detail',
                          arguments: item,
                        );
                      },
                    ),
                  )),
        ),
      );

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }
}

String capitalize(String text) {
  return text.isNotEmpty ? text[0].toUpperCase() + text.substring(1) : text;
}
