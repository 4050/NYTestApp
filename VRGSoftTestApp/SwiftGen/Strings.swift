// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  /// ArticleWarehouse
  internal static let articleWarehouse = L10n.tr("URLStrings", "articleWarehouse")
  /// ArticleTableViewCell
  internal static let cellIdentifier = L10n.tr("URLStrings", "cellIdentifier")
  /// ManagedArticle
  internal static let managedArticle = L10n.tr("URLStrings", "managedArticle")
  /// https://api.nytimes.com/svc/mostpopular/v2/emailed/30.json?api-key=WX1nZ7rlTw2m0O9zGiIdNhcAoFvuAm1b
  internal static let mostEmailedURL = L10n.tr("URLStrings", "mostEmailedURL")
  /// https://api.nytimes.com/svc/mostpopular/v2/shared/30.json?api-key=WX1nZ7rlTw2m0O9zGiIdNhcAoFvuAm1b
  internal static let mostSharedURL = L10n.tr("URLStrings", "mostSharedURL")
  /// https://api.nytimes.com/svc/mostpopular/v2/viewed/30.json?api-key=WX1nZ7rlTw2m0O9zGiIdNhcAoFvuAm1b
  internal static let mostViewedURL = L10n.tr("URLStrings", "mostViewedURL")
  /// ArticleTableViewCell
  internal static let tableViewCellNibName = L10n.tr("URLStrings", "tableViewCellNibName")
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: nil, table: table)
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
