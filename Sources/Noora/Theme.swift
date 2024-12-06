import Foundation

/// This struct represents a theme, which is used to visually configure components
/// ensuring that all components are consistent and aligned with a design identity.
public struct Theme {
    /// Noora's default theme.
    public static var `default` = Theme(
        primary: "A378F2",
        secondary: "FF8EC6",
        muted: "505050",
        accent: "FFFC67",
        danger: "FF2929",
        success: "89F94F"
    )

    /// A primary color–it should represent the brand.
    let primary: String

    /// A secondary color–it should represent a secondary color of the brand.
    let secondary: String

    /// A muted color–it's used to make content less prominent.
    let muted: String

    /// An accent color–it's used when sparingly to make a piece of content stand out.
    let accent: String

    /// A danger color–it's used sparingly to represent danger messages like errors.
    let danger: String

    /// A success color–it's used sparingly to represent a success messages like completion messages.
    let success: String

    /// Creates a new instance of the theme.
    /// - Parameters:
    ///   - primary: A  primary color–it should represent the brand.
    ///   - secondary: A secondary color–it should represent a secondary color of the brand.
    ///   - muted: A muted color–it's used to make content less prominent.
    ///   - accent: An accent color–it's used when sparingly to make a piece of content stand out.
    ///   - danger: A danger color–it's used sparingly to represent danger messages like errors.
    ///   - success: A success color–it's used sparingly to represent a success messages like completion messages.
    public init(primary: String, secondary: String, muted: String, accent: String, danger: String, success: String) {
        self.primary = primary
        self.secondary = secondary
        self.muted = muted
        self.accent = accent
        self.danger = danger
        self.success = success
    }
}
