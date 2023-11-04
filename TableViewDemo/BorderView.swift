import UIKit

class BorderView: UIView {
    public var hasTopBorder: Bool? = nil
    
    lazy var shapeLayer = layer as? CAShapeLayer
    override class var layerClass: AnyClass { CAShapeLayer.self }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        guard let hasTopBorder else { return }
        
        let radius: CGFloat = 10
        let pth = CGMutablePath()
        
        if hasTopBorder {
            pth.move(to: CGPoint(x: bounds.minX, y: bounds.maxY))
            pth.addArc(tangent1End: CGPoint(x: bounds.minX, y: bounds.minY),
                       tangent2End: CGPoint(x: bounds.maxX, y: bounds.minY),
                       radius: radius)
            pth.addArc(tangent1End: CGPoint(x: bounds.maxX, y: bounds.minY),
                       tangent2End: CGPoint(x: bounds.maxX, y: bounds.maxY),
                       radius: radius)
            pth.addLine(to: CGPoint(x: bounds.maxX, y: bounds.maxY))
        } else {
            pth.move(to: CGPoint(x: bounds.minX, y: bounds.minY))
            pth.addArc(tangent1End: CGPoint(x: bounds.minX, y: bounds.maxY),
                       tangent2End: CGPoint(x: bounds.maxX, y: bounds.maxY), radius: radius)
            pth.addArc(tangent1End: CGPoint(x: bounds.maxX, y: bounds.maxY),
                       tangent2End: CGPoint(x: bounds.maxX, y: bounds.minY), radius: radius)
            pth.addLine(to: CGPoint(x: bounds.maxX, y: bounds.minY))
        }

        shapeLayer?.path = pth
        shapeLayer?.lineWidth = 3
        shapeLayer?.fillColor = nil
        shapeLayer?.cornerRadius = radius
        shapeLayer?.strokeColor = UIColor.black.cgColor
    }
}
