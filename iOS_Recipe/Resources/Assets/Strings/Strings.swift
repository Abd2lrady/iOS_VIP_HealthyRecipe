// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum Strings {
  /// All
  internal static let all = Strings.tr("Localizable", "all", fallback: "All")
  /// Keto
  internal static let keto = Strings.tr("Localizable", "keto", fallback: "Keto")
  /// Low Sugar
  internal static let lowSugar = Strings.tr("Localizable", "lowSugar", fallback: "Low Sugar")
  /// Sorry no Recipes for your query
  internal static let noResult = Strings.tr("Localizable", "NoResult", fallback: "Sorry no Recipes for your query")
  /// Recipe Website
  internal static let recipeWebsiteButtonTitle = Strings.tr("Localizable", "recipeWebsiteButtonTitle", fallback: "Recipe Website")
  /// Enter Your Recipe Here
  internal static let searchBarPlaceholder = Strings.tr("Localizable", "SearchBarPlaceholder", fallback: "Enter Your Recipe Here")
  /// Search
  internal static let searchButtonTitle = Strings.tr("Localizable", "SearchButtonTitle", fallback: "Search")
  /// Select To Filter of Your Healthy Recipes
  internal static let selectFilterTitle = Strings.tr("Localizable", "SelectFilterTitle", fallback: "Select To Filter of Your Healthy Recipes")
  /// Vegan
  internal static let vegan = Strings.tr("Localizable", "vegan", fallback: "Vegan")
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension Strings {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
