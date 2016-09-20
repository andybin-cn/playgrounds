//: Playground - noun: a place where people can play

import UIKit


func testBlendMode() {
    let image = UIImage(named: "image2.jpg")!
    let size = image.size
    UIGraphicsBeginImageContextWithOptions(size, false, UIScreen.mainScreen().scale)
    //UIColor.blueColor().setFill()
    //UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1).setFill()
    let bounds = CGRectMake(0, 0, size.width, size.height)
    UIRectFill(bounds)
    //image.drawInRect(bounds)
    image.drawInRect(bounds, blendMode: .Overlay, alpha: 1.0)
    //image.drawInRect(bounds, blendMode: .DestinationIn, alpha: 1.0)
    
    let result = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()

}

func testRadiusImage() {
    let image = UIImage(named: "image2.jpg")!
    let rect = CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 200, height: 200))
    UIGraphicsBeginImageContextWithOptions(rect.size, false, UIScreen.mainScreen().scale)
    let context = UIGraphicsGetCurrentContext()
    //let path = UIBezierPath(roundedRect: rect, byRoundingCorners: UIRectCorner.AllCorners, cornerRadii: CGSize(width: 100, height: 100))
    //path.lineWidth = 2
    let radiusPath = UIBezierPath(roundedRect: rect, byRoundingCorners: UIRectCorner.AllCorners, cornerRadii: CGSize(width: 100, height: 100)).CGPath
    UIColor.blackColor().set()
    CGContextAddPath(context, radiusPath)
    CGContextClip(context)
    
    image.drawInRect(rect)
    CGContextDrawPath(context, .FillStroke)
    let output = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
}


func testBezierPath() {
    let view = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
    view.backgroundColor = UIColor.whiteColor()
    
    let backLayer = CAShapeLayer()
    let path = UIBezierPath(arcCenter: CGPoint(x: 100, y: 100), radius: 90, startAngle: CGFloat(M_PI_4 * 3), endAngle: CGFloat(M_PI * 2 + M_PI_4 ), clockwise: true)
    backLayer.fillColor = UIColor.clearColor().CGColor
    
    backLayer.strokeColor = UIColor.brownColor().colorWithAlphaComponent(0.2).CGColor
    backLayer.lineWidth = 10
    backLayer.lineCap = kCALineCapRound
    backLayer.path = path.CGPath
    view.layer.addSublayer(backLayer)
    
    let progressLayer = CAShapeLayer()
    progressLayer.fillColor =  UIColor.clearColor().CGColor
    progressLayer.strokeColor = UIColor.blackColor().CGColor
    progressLayer.lineCap = kCALineCapRound
    progressLayer.lineWidth = 10
    progressLayer.path = path.CGPath
    progressLayer.strokeEnd = 0.88
    
    let gradientLayer = CALayer()
    let gradientLayer1 = CAGradientLayer()
    gradientLayer1.frame = CGRect(x: 0, y: 0, width: view.bounds.width/2 , height: view.bounds.height)
    gradientLayer1.colors = [UIColor.redColor().CGColor ,UIColor.yellowColor().CGColor, UIColor.yellowColor().CGColor]
    gradientLayer1.locations = [0.5,0.9,1]
    gradientLayer1.startPoint = CGPoint(x: 0.5, y: 1)
    gradientLayer1.endPoint = CGPoint(x: 0.5, y: 0)
    
    
    let gradientLayer2 = CAGradientLayer()
    gradientLayer2.frame = CGRect(x: view.bounds.width/2, y: 0, width: view.bounds.width/2 , height: view.bounds.height)
    gradientLayer2.colors = [UIColor.blueColor().CGColor ,UIColor.yellowColor().CGColor, UIColor.yellowColor().CGColor]
    
    gradientLayer2.locations = [0.5,0.9,1]
    gradientLayer2.startPoint = CGPoint(x: 0.5, y: 1)
    gradientLayer2.endPoint = CGPoint(x: 0.5, y: 0)
    
    gradientLayer.frame = view.bounds
    gradientLayer.addSublayer(gradientLayer1)
    gradientLayer.addSublayer(gradientLayer2)
    view.layer.addSublayer(gradientLayer)
    gradientLayer.mask = progressLayer
    view
}

testBezierPath()




