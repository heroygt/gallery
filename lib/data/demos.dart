// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:collection';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show describeEnum;
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/gallery_localizations.dart';
import 'package:flutter_gen/gen_l10n/gallery_localizations_zh.dart'
    show GalleryLocalizationsZh;
import 'package:gallery/data/icons.dart';

import 'package:gallery/deferred_widget.dart';

const _docsBaseUrl = 'https://api.flutter.dev/flutter';
const _docsAnimationsUrl =
    'https://pub.dev/documentation/animations/latest/animations';

enum GalleryDemoCategory {
  study,
  material,
  cupertino,
  other,
}

class GalleryDemo {
  const GalleryDemo({
    @required this.title,
    @required this.subtitle,
    // This parameter is required for studies.
    this.studyId,
    // Parameters below are required for non-study demos.
    this.slug,
    this.icon,
    this.configurations,
  })  : assert(title != null),
        assert(subtitle != null),
        assert(slug != null || studyId != null);

  final String title;
  final String subtitle;
  final String studyId;
  final String slug;
  final IconData icon;
  final List<GalleryDemoConfiguration> configurations;

  String get describe => '${slug ?? studyId}';
}

class GalleryDemoConfiguration {
  const GalleryDemoConfiguration({
    this.title,
    this.description,
    this.documentationUrl,
    this.buildRoute,
  });

  final String title;
  final String description;
  final String documentationUrl;
  final WidgetBuilder buildRoute;
}

List<GalleryDemo> allGalleryDemos(GalleryLocalizations localizations) =>
    studies(localizations).values.toList();

List<String> allGalleryDemoDescriptions() =>
    allGalleryDemos(GalleryLocalizationsZh())
        .map((demo) => demo.describe)
        .toList();

Map<String, GalleryDemo> studies(GalleryLocalizations localizations) {
  return <String, GalleryDemo>{
    'oneSpark': GalleryDemo(
      title: 'OneSpark',
      subtitle: localizations.replyDescription,
      studyId: 'oneSpark',
    )
  };
}


Map<String, GalleryDemo> slugToDemo(BuildContext context) {
  final localizations = GalleryLocalizations.of(context);
  return LinkedHashMap<String, GalleryDemo>.fromIterable(
    allGalleryDemos(localizations),
    key: (dynamic demo) => demo.slug as String,
  );
}

/// Awaits all deferred libraries for tests.
Future<void> pumpDeferredLibraries() {
  final futures = <Future<void>>[
    // DeferredWidget.preload(typography.loadLibrary),
  ];
  return Future.wait(futures);
}
