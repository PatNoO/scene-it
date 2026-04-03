import CoreFoundation

enum Spacing {
    static let xxxSmall: CGFloat = 2
    static let xxSmall: CGFloat = 4
    static let xSmall: CGFloat = 6
    static let small: CGFloat = 8
    static let medium: CGFloat = 10
    static let large: CGFloat = 16
    static let xLarge: CGFloat = 20
    static let xxLarge: CGFloat = 22
    static let xxxLarge: CGFloat = 24
    static let xxxxLarge: CGFloat = 30
    static let huge: CGFloat = 32
    static let xHuge: CGFloat = 48
    static let xxHuge: CGFloat = 60
    static let xxxHuge: CGFloat = 80
}

enum Layout {
    static let borderWidth: CGFloat = 1
    static let borderWidthSelected: CGFloat = 2
    static let dotSize: CGFloat = 2
    static let dotSpacing: CGFloat = 22
    static let cornerRadiusSmall: CGFloat = 6
    static let cornerRadius: CGFloat = 10
    static let cornerRadiusMedium: CGFloat = 12
    static let cornerRadiusLarge: CGFloat = 14
    static let cornerRadiusButton: CGFloat = 28
    static let badgeWidth: CGFloat = 24
    static let buttonHeight: CGFloat = 60
    static let octagonCut: CGFloat = 10
    static let octagonInset: CGFloat = 8
    static let octagonStroke: CGFloat = 1.3
    static let octagonInsetStroke: CGFloat = 0.7
    static let octagonLineStroke: CGFloat = 1.2
    static let appIconSize: CGFloat = 80
    static let appIconCornerRadius: CGFloat = 14
    static let dividerHeight: CGFloat = 1
    static let scoreProgressStroke: CGFloat = 4
    static let scoreRingStroke: CGFloat = 8
    static let scoreCircleInner: CGFloat = 130
    static let scoreCircleMiddle: CGFloat = 145
    static let scoreCircleOuter: CGFloat = 160
    static let scoreCoreTrack: CGFloat = 234
    static let scoreInnerRing: CGFloat = 246
    static let scoreInnerTrack: CGFloat = 258
    static let scoreRingSize: CGFloat = 280
    static let scoreOuterRing: CGFloat = 300
    static let scoreContainerSize: CGFloat = 320
    static let glowRadius: CGFloat = 10
    static let glowRadiusSelected: CGFloat = 12
}

enum FontSize {
    static let xSmall: CGFloat = 10
    static let small: CGFloat = 11
    static let medium: CGFloat = 13
    static let large: CGFloat = 14
    static let xLarge: CGFloat = 16
    static let xxLarge: CGFloat = 18
    static let xxxLarge: CGFloat = 20
    static let icon: CGFloat = 24
    static let display: CGFloat = 40
    static let score: CGFloat = 100
}

enum Opacity {
    static let dots: Double = 0.08
    static let ghost: Double = 0.1
    static let faint: Double = 0.2
    static let disabled: Double = 0.3
    static let subtle: Double = 0.35
    static let medium: Double = 0.4
    static let faded: Double = 0.45
    static let half: Double = 0.5
    static let muted: Double = 0.6
    static let strong: Double = 0.8
    static let high: Double = 0.85
    static let almostFull: Double = 0.9
}

enum AnimationDuration {
    static let fast: Double = 0.2
    static let score: Double = 0.8
}

enum Tracking {
    static let normal: CGFloat = 2
    static let wide: CGFloat = 3
    static let lineSpacing: CGFloat = 4
}

enum AnimationAngle {
    static let progressRingStart: Double = -90
}
