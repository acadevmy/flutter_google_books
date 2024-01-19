import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'category.freezed.dart';

@freezed
class Category with _$Category {
  factory Category({
    required IconData icon,
    required String title,
    required String subtitle,
  }) = _Category;
}
