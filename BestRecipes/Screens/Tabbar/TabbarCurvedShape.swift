import SwiftUI

struct TabbarCurvedShape: View {
    
    let radius, height: CGFloat
    
    var body: some View {
        Path { path in
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: UIScreen.main.bounds.width, y: 0))
            path.addLine(to: CGPoint(x: UIScreen.main.bounds.width, y: height))
            
            path.addArc(center: CGPoint(x: UIScreen.main.bounds.width / 2, y: height),
                        radius: radius, startAngle: .zero, endAngle: .init(degrees: 180),
                        clockwise: true)
            
            path.addLine(to: CGPoint(x: 0, y: height))
        }
        .fill(Color.theme.сustomWhite)
        .rotationEffect(.init(degrees: 180))
        .shadow(color: Color.theme.customGray.opacity(0.5), radius: 3, x: 0, y: -2)
    }
}

struct TabbarCurvedShape_Previews: PreviewProvider {
    static var previews: some View {
        TabbarCurvedShape(radius: 40, height: 90)
    }
}
