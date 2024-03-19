import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() {
    return _FiltersScreenState();
  }
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFreeSet = false;

  @override
  Widget build(BuildContext context) {
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
            value: _glutenFreeSet,
            onChanged: (isChecked) {
              setState(() {
                _glutenFreeSet = isChecked;
              });
            },
            title: Text(
              'Gluten-free',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text('obejmują tylko posiłki bez glutenu',
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
