//
//  BBTableViewCell.m
//  BBPaperTabTableView
//
//  Created by Bryan Boyko on 8/28/14.
//  Copyright (c) 2014 none. All rights reserved.
//

#import "BBTableViewCell.h"

@interface BBTableViewCell ()


@end


@implementation BBTableViewCell

- (void)awakeFromNib
{
    
    
    self.paperTabShadowView = [[UIView alloc] initWithFrame:CGRectMake(80.0f, 0.0f, 234.0f, 100.0f)];
    

    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}






@end
