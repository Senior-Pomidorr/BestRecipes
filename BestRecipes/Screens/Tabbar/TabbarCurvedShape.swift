import SwiftUI

struct TabbarCurvedShape: View {
    
    let radius, height: CGFloat
    let width = UIScreen.main.bounds.width
    
    let magicRatio = 0.07826
    
    var body: some View {
        Path { path in
            path.move(to: CGPoint(x: 0, y: magicRatio * height))
            path.addLine(to: CGPoint(x: width * 0.355, y: magicRatio * height))
            path.addCurve(to: CGPoint(x: 0.41372 * width, y: 0.21761*height), control1: CGPoint(x: 0.38099*width, y: magicRatio * height), control2: CGPoint(x: 0.40301 * width, y: 0.14038*height))
            path.addCurve(to: CGPoint(x: 0.50133*width, y: 0.43478*height), control1: CGPoint(x: 0.42758*width, y: 0.31761*height), control2: CGPoint(x: 0.45394*width, y: 0.43478*height))
            path.addCurve(to: CGPoint(x: 0.58895*width, y: 0.21761*height), control1: CGPoint(x: 0.54873*width, y: 0.43478*height), control2: CGPoint(x: 0.57508*width, y: 0.31761*height))
            path.addCurve(to: CGPoint(x: 0.64767*width, y: magicRatio * height), control1: CGPoint(x: 0.59966*width, y: 0.14038*height), control2: CGPoint(x: 0.62167*width, y: magicRatio * height))
            path.addLine(to: CGPoint(x: width, y: magicRatio * height))
            path.addLine(to: CGPoint(x: width, y: height))
            path.addLine(to: CGPoint(x: 0, y: height))
            path.addLine(to: CGPoint(x: 0, y: magicRatio * height))
            path.closeSubpath()
        }
        .fill(Color.theme.сustomWhite)
        .shadow(color: Color.theme.customGray.opacity(0.5), radius: 3, x: 0, y: -2)
    }
}

struct TabbarCurvedShape_Previews: PreviewProvider {
    static var previews: some View {
        TabbarCurvedShape(radius: 40, height: 90)
    }
}
