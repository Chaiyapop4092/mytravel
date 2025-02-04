import 'package:flutter/material.dart';
import 'package:mytravel/constants/colors.dart';
import 'package:mytravel/widgets/icon_widget.dart';

class IconTab extends StatelessWidget {
  const IconTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconWidget(title: 'Forest', color: forestColor, icon: Icons.map),
        IconWidget(title: 'Camping', color: campingColor, icon: Icons.fireplace_outlined),
        IconWidget(title: 'Boat trip', color: boatColor, icon: Icons.directions_boat_filled),
        IconWidget(title: 'Hiking', color: campingColor, icon: Icons.hiking),
        IconWidget(title: 'Sky Diving', color: forestColor, icon: Icons.airplane_ticket_outlined),
      ],
    );
  }
}
