import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:interview_project/core/assets/color_assets.dart';
import 'package:interview_project/core/assets/image_assets.dart';

import '../notifier/counter_notifier.dart';

class CounterNavigationDestination {
  final String label;
  final String iconPath;
  final String tooltip;

  CounterNavigationDestination({
    required this.iconPath,
    required this.label,
    this.tooltip = '',
  });
}

final List<CounterNavigationDestination> _navigationDestinations = [
  CounterNavigationDestination(
    iconPath: ImageAssets.home,
    label: 'Home',
  ),
  CounterNavigationDestination(
    iconPath: ImageAssets.matches,
    label: 'Matches',
  ),
  CounterNavigationDestination(
    iconPath: ImageAssets.fantasy,
    label: 'Fantasy',
  ),
  CounterNavigationDestination(
    iconPath: ImageAssets.shop,
    label: 'Shop',
  ),
  CounterNavigationDestination(
    iconPath: ImageAssets.profile,
    label: 'Profile',
  ),
];

class CounterNavigationBar extends StatelessWidget {
  const CounterNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: notifier,
      builder: (context, _) {
        return NavigationBarTheme(
          data: NavigationBarThemeData(
            backgroundColor: ColorAssets.kScaffoldBgCOlor,
            indicatorColor: Colors.transparent,
            labelTextStyle: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.selected)) {
                return const TextStyle(color: Color(0xFF008F8F));
              }
              return const TextStyle(color: Colors.black);
            }),
          ),
          child: NavigationBar(
            onDestinationSelected: (value) => notifier.selectDestination(value),
            selectedIndex: notifier.selectedNavigationIndex,
            indicatorShape: null,
            indicatorColor: Colors.transparent,
            elevation: 0,
            surfaceTintColor: Colors.transparent,
            overlayColor: const WidgetStatePropertyAll(Colors.transparent),
            destinations: _navigationDestinations.map((destination) {
              final isSelected = _navigationDestinations.indexOf(destination) ==
                  notifier.selectedNavigationIndex;
              if (destination.label.toLowerCase() == "profile".toLowerCase()) {
                return NavigationDestination(
                  icon: CircleAvatar(
                    backgroundImage: AssetImage(
                      destination.iconPath,
                    ),
                  ),
                  label: destination.label,
                  tooltip: "",
                );
              }
              return NavigationDestination(
                icon: SvgPicture.asset(
                  destination.iconPath,
                  colorFilter: ColorFilter.mode(
                    isSelected ? const Color(0xFF008F8F) : Colors.black,
                    BlendMode.srcIn,
                  ),
                ),
                label: destination.label,
                tooltip: "",
              );
            }).toList(),
          ),
        );
      },
    );
  }
}

class CounterNavigationRail extends StatelessWidget {
  const CounterNavigationRail({super.key});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
        listenable: notifier,
        builder: (context, _) {
          return NavigationRail(
            backgroundColor: ColorAssets.kScaffoldBgCOlor,
            indicatorColor: Colors.transparent,
            selectedLabelTextStyle: const TextStyle(color: Color(0xFF008F8F)),
            onDestinationSelected: (value) => notifier.selectDestination(value),
            labelType: NavigationRailLabelType.all,
            destinations: _navigationDestinations.map((destination) {
              final isSelected = _navigationDestinations.indexOf(destination) ==
                  notifier.selectedNavigationIndex;
              if (destination.label.toLowerCase() == "profile".toLowerCase()) {
                return NavigationRailDestination(
                  indicatorColor: Colors.transparent,
                  icon: CircleAvatar(
                    backgroundImage: AssetImage(
                      destination.iconPath,
                    ),
                  ),
                  label: Text(destination.label),
                );
              }
              return NavigationRailDestination(
                indicatorColor: Colors.transparent,
                icon: SvgPicture.asset(
                  destination.iconPath,
                  colorFilter: ColorFilter.mode(
                    isSelected ? const Color(0xFF008F8F) : Colors.black,
                    BlendMode.srcIn,
                  ),
                ),
                label: Text(destination.label),
              );
            }).toList(),
            selectedIndex: notifier.selectedNavigationIndex,
          );
        });
  }
}
