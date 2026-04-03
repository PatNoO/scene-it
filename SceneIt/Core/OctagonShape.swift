import SwiftUI

struct OctagonShape: Shape, InsettableShape {
    var cut: CGFloat = Layout.octagonCut
    var insetAmount: CGFloat = Spacing.none

    func path(in rect: CGRect) -> Path {
        let cut = self.cut
        let r = rect.insetBy(dx: insetAmount, dy: insetAmount)
        var path = Path()
        path.move(to: CGPoint(x: r.minX + cut, y: r.minY))
        path.addLine(to: CGPoint(x: r.maxX - cut, y: r.minY))
        path.addLine(to: CGPoint(x: r.maxX, y: r.minY + cut))
        path.addLine(to: CGPoint(x: r.maxX, y: r.maxY - cut))
        path.addLine(to: CGPoint(x: r.maxX - cut, y: r.maxY))
        path.addLine(to: CGPoint(x: r.minX + cut, y: r.maxY))
        path.addLine(to: CGPoint(x: r.minX, y: r.maxY - cut))
        path.addLine(to: CGPoint(x: r.minX, y: r.minY + cut))
        path.closeSubpath()
        return path
    }

    func inset(by amount: CGFloat) -> OctagonShape {
        var shape = self
        shape.insetAmount += amount
        return shape
    }
}

#Preview {
    OctagonShape()
        .stroke(Color.red, lineWidth: Layout.previewLineWidth)
        .frame(width: Layout.previewFrameWidth, height: Layout.previewFrameHeight)
        .padding()
}
