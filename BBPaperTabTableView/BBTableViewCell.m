//
//  BBTableViewCell.m
//  BBPaperTabTableView
//
//  Created by Bryan Boyko on 8/28/14.
//  Copyright (c) 2014 none. All rights reserved.
//

#import "BBTableViewCell.h"

@interface BBTableViewCell ()

@property (nonatomic) UIView *darkCoverView;
@property (nonatomic) UIView *coverShadowView;
@property (nonatomic) BOOL firstTouch;


@end


@implementation BBTableViewCell

- (void)awakeFromNib
{
    self.paperTabShadowView = [[UIView alloc] initWithFrame:CGRectMake(80.0f, 0.0f, 234.0f, 100.0f)];
    
    CALayer *layer = self.paperTabShadowView.layer;
    
    layer.shadowOffset = CGSizeZero;
    layer.shadowColor = [[UIColor blackColor] CGColor];
    layer.shadowRadius = 3.0f;
    layer.shadowOpacity = 0.70f;
    layer.shadowPath = [self curvedShadow:layer.bounds];
    
    [self addSubview:self.paperTabShadowView];
    
    
    // create small view in the left of each cell
    self.cellView = [[UIView alloc] initWithFrame:CGRectMake(5.0f, 0.0f, 67.0f, 100.0f)];
    [self addSubview:self.cellView];
    
    // create paper tab view
    self.paperTabView = [[BBSquareGradient alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 234.0f, 100.0f)];
    [self.paperTabShadowView addSubview:self.paperTabView];
    
    
    self.firstTouch = YES;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    if (selected) {
        NSLog(@"SELECTED");
        if (self.firstTouch == YES) {
            
            // add highlight on selection
            self.darkCoverView = [[UIView alloc] initWithFrame:CGRectMake(80.0f, 0.0f, 234.0f, 100.0f)];
            self.darkCoverView.backgroundColor = [UIColor blackColor];
            self.darkCoverView.alpha = 0.2;
            [self addSubview:self.darkCoverView];
            
            // add view to cover shadow
            self.coverShadowView = [[UIView alloc] initWithFrame:CGRectMake(80.0f, 100.0f, 234.0f, 10.0f)];
            self.coverShadowView.backgroundColor = [UIColor whiteColor];
            [self addSubview:self.coverShadowView];
            
            
            // use bool to prevent multiple additions of selection views
            self.firstTouch = NO;
        }
        
    } else {
        [self.coverShadowView removeFromSuperview];
        [self.darkCoverView removeFromSuperview];
        self.firstTouch = YES;
    }

    // Configure the view for the selected state
}


- (CGPathRef)curvedShadow:(CGRect)rect
{
    CGSize size = rect.size;
    UIBezierPath* path = [UIBezierPath bezierPath];
    
    //right
    [path moveToPoint:CGPointMake(50.0f, 30.0f)];
    [path addLineToPoint:CGPointMake(size.width - 1.0f, size.height)];
    [path addLineToPoint:CGPointMake(size.width - 1.0f, size.height + 2.0f)];
    
    //curved bottom
    [path addCurveToPoint:CGPointMake(30.0f, size.height - 10.0f)
            controlPoint1:CGPointMake(size.width + 20.0f, size.height + 5.0f)
            controlPoint2:CGPointMake(size.width - 150.0f, size.height - 5.0f)];
    
    [path closePath];
    
    return path.CGPath;
}







@end
