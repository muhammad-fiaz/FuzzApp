import 'package:flutter/material.dart';

// Default size for the dots
const Size kDefaultSize = Size.square(9.0);

// Default spacing for the dots
const EdgeInsets kDefaultSpacing = EdgeInsets.all(6.0);

// Default shape for the dots
const ShapeBorder kDefaultShape = CircleBorder();

/// `DotsDecorator` is a class that provides customization options for dots.
/// It allows you to set the color, size, shape, and spacing for both active and inactive dots.
class DotsDecorator {
  /// Inactive dot color
  ///
  /// Default is `Colors.grey`
  final Color color;

  /// Active dot color
  ///
  /// Default is `Colors.lightBlue`
  final Color activeColor;

  /// Inactive dot size
  ///
  /// Default is `Size.square(9.0)`
  final Size size;

  /// Active dot size
  ///
  /// Default is `Size.square(9.0)`
  final Size activeSize;

  /// Inactive dot shape
  ///
  /// Default is `CircleBorder()`
  final ShapeBorder shape;

  /// Active dot shape
  ///
  /// Default is `CircleBorder()`
  final ShapeBorder activeShape;

  /// Spacing between dots
  ///
  /// Default is `EdgeInsets.all(6.0)`
  final EdgeInsets spacing;

  /// Creates a new instance of `DotsDecorator`.
  ///
  /// All parameters are optional and have default values.
  const DotsDecorator({
    this.color = Colors.grey,
    this.activeColor = Colors.lightBlue,
    this.size = kDefaultSize,
    this.activeSize = kDefaultSize,
    this.shape = kDefaultShape,
    this.activeShape = kDefaultShape,
    this.spacing = kDefaultSpacing,
  });
}