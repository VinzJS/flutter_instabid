import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instabid/src/_index.dart';

class StoreSelectPage extends HookConsumerWidget {
  const StoreSelectPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(authControllerProvider);

    final textCtrl = useTextEditingController();
    final searchQuery = useState('');
    final showSearch = useState(false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Store'),
        actions: [
          if (!showSearch.value)
            IconButton(
              onPressed: () {
                showSearch.value = !showSearch.value;
              },
              icon: Icon(MIcons.magnify),
            ),
          IconButton(
            onPressed: () {
              const StoreCreatePageRoute().push(context);
            },
            icon: Icon(MIcons.plus),
          ),
        ],
        bottom: showSearch.value
            ? PreferredSize(
                preferredSize: const Size.fromHeight(60),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16, right: 16),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: textCtrl,
                              decoration: const InputDecoration(
                                  hintText:
                                      'Type anything to filter...',
                                  border: InputBorder.none),
                              onFieldSubmitted: (value) =>
                                  searchQuery.value = value,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              showSearch.value = !showSearch.value;
                            },
                            icon: Icon(MIcons.close),
                          ),
                        ],
                      ),
                    ),
                    const Divider(),
                  ],
                ))
            : null,
      ),
      body: state.when(
        data: (user) {
          return ValueListenableBuilder(
              valueListenable: searchQuery,
              builder: (context, value, child) {
                ///
                ///  Build the search query first
                ///
                final defaultQuery = 'user = "${user.id}" ';
                final searchValue = value;
                final query = Result.tryCatch(() {
                  if (searchValue.isEmpty) return defaultQuery;
                  return 'user = "${user.id}" && name ?~ "$searchValue"';
                }, Failure.presentation)
                    .getOrElse((x) => defaultQuery);

                ///
                /// Display the search results
                ///

                return StoreList(
                  filter: query,
                  builder: (store) => ListTile(
                    onTap: () =>
                        StoreDashboardPageRoute(store.id).push(context),
                    title: Text(store.name),
                    trailing: Icon(MIcons.chevronRight),
                  ),
                );
              });
        },
        error: (error, stack) {
          return const Center(
            child: Text('Something went wrong'),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
