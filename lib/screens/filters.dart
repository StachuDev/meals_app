import 'package:flutter/material.dart';
import 'package:meals_app/providers/filters_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});

  // initState() method enable us access to widget. property to (get widget selectedMealFilters parameter)
  // @override
  // void initState() {
  //   super.initState();
  //   final filtersState = ref.read(filtersProvider);

  //   _glutenFreeFilterSet = filtersState[Filter.glutenFree]!;
  //   _lactoseFreeFilterSet = filtersState[Filter.lactoseFree]!;
  //   _vegetarianFilterSet = filtersState[Filter.vegetarian]!;
  //   _veganFilterSet = filtersState[Filter.vegan]!;
  // }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filters = ref.watch(filtersProvider);

    void selectFilter(Filter filter, bool isChecked) {
      // final bool currentState = !(filters[filter]!);
      ref.read(filtersProvider.notifier).setFilter(filter, isChecked);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Twoje filtry'),
      ),
      // drawer: MainDrawer(
      //   onSelectScreen: (identifier) {
      //     Navigator.of(context).pop();
      //     if (identifier == 'filters') {
      //       Navigator.of(context).push(MaterialPageRoute(
      //         builder: (ctx) => const FiltersScreen(),
      //       ));
      //     }
      //   },
      // ),
      body: Column(
        children: [
          SwitchListTile(
            value: filters[Filter.glutenFree]!,
            onChanged: (isChecked) {
              selectFilter(Filter.glutenFree, isChecked);
            },
            title: Text(
              'Gluten-free',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text('Tylko posiłki bez glutenu',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground)),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 24),
          ),
          SwitchListTile(
            value: filters[Filter.lactoseFree]!,
            onChanged: (isChecked) {
              selectFilter(Filter.lactoseFree, isChecked);
            },
            title: Text(
              'Lactose-free',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text('Tylko posiłki bez laktozy',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground)),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 24),
          ),
          SwitchListTile(
            value: filters[Filter.vegetarian]!,
            onChanged: (isChecked) {
              selectFilter(Filter.vegetarian, isChecked);
            },
            title: Text(
              'Vegetarian',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text('Tylko posiłki wegetariańskie',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground)),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 24),
          ),
          SwitchListTile(
            value: filters[Filter.vegan]!,
            onChanged: (isChecked) {
              selectFilter(Filter.vegan, isChecked);
            },
            title: Text(
              'Vegan',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text('Tylko posiłki wegańskie',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground)),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 24),
          ),
        ],
      ),
    );
  }
}
