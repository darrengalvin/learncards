import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '/components/walk_through_explainer_widget.dart';

// Focus widget keys for this walkthrough
final iconButtonVup35iwy = GlobalKey();

/// infoButton
///
/// This is where the user learns where the info button is and its purpose
List<TargetFocus> createWalkthroughTargets(BuildContext context) => [
      /// Step 1
      TargetFocus(
        keyTarget: iconButtonVup35iwy,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.Circle,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => const WalkThroughExplainerWidget(),
          ),
        ],
      ),
    ];
