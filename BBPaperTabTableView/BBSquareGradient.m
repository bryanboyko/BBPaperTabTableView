//
//  BBSquareGradient.m
//  CGGradientShape
//
//  Created by Bryan Boyko on 8/25/14.
//  Copyright (c) 2014 none. All rights reserved.
//

#import "BBSquareGradient.h"

@implementation BBSquareGradient

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    
    CGPoint center;
    center.x = self.bounds.origin.x + self.bounds.size.width/2;
    center.y = self.bounds.origin.y + self.bounds.size.height/2;
    
    
    // Get the currentContext value inside drawRect:
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    
    
    // Save the state of the current graphics context
    CGContextSaveGState(currentContext);
    
    // Setting the gradient constants
    CGFloat locations[2] = { 0.0, 1.0 };
    CGFloat components[8] = {self.firstColorRed, self.firstColorGreen, self.firstColorBlue, 1.0, // Start Color
        self.secondColorRed, self.secondColorGreen, self.secondColorBlue, 1.0};  // End color
    
    // Set the color space for gradient application
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGGradientRef gradient = CGGradientCreateWithColorComponents(colorSpace, components, locations, 2);
    
    CGPoint startPoint; // Gradient start point
    startPoint.x = 0.0f;
    startPoint.y = center.y;
    CGPoint endPoint;   // Gradient end point
    endPoint.x = self.bounds.size.width;
    endPoint.y = center.y;
    
    CGContextDrawLinearGradient(currentContext, gradient, startPoint, endPoint, 0);
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorSpace);
    
    // Restore the state of the current graphics context
    CGContextRestoreGState(currentContext);
}


@end
