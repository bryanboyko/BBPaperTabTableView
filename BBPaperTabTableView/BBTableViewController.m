//
//  BBTableViewController.m
//  BBPaperTabTableView
//
//  Created by Bryan Boyko on 8/28/14.
//  Copyright (c) 2014 none. All rights reserved.
//

#import "BBTableViewController.h"
#import "BBTableViewCell.h"
#import "BBSquareGradient.h"

@interface BBTableViewController ()

@property (nonatomic) BBSquareGradient *paperTabView;
@property (nonatomic) UIView *cellView;
@property (nonatomic) UIView *highlightView;
@property (nonatomic) UIView *coverShadowView;
@property (nonatomic) int selectedIndexPath;
@property (nonatomic) int deselectedIndexPath;

@end

@implementation BBTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        self.navigationItem.title = @"BBPaperTabTableView";
        
        self.selectedIndexPath = 100.0f;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //SET UP TABLEVIEW
    self.tableView.rowHeight = 120;
    self.tableView.backgroundColor = [UIColor whiteColor];
    [self.tableView setSeparatorColor:[UIColor whiteColor]];
    
    //load nib
    UINib *nib = [UINib nibWithNibName:@"BBTableViewCell" bundle:nil];
    
    //register nib containing cell
    [self.tableView registerNib:nib forCellReuseIdentifier:@"BBTableViewCell"];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 8;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BBTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BBTableViewCell" forIndexPath:indexPath];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    if ([tableView indexPathForSelectedRow].row != indexPath.row) {
        // add curved shadow to each view
        CALayer *layer = cell.paperTabShadowView.layer;
        
        layer.shadowOffset = CGSizeZero;
        layer.shadowColor = [[UIColor blackColor] CGColor];
        layer.shadowRadius = 3.0f;
        layer.shadowOpacity = 0.70f;
        layer.shadowPath = [self curvedShadow:layer.bounds];
        
        [cell addSubview:cell.paperTabShadowView];
    }
        
    
    
//    // remove hightlight effect
//    if (indexPath.row == self.deselectedIndexPath) {
//        [self.coverShadowView removeFromSuperview];
//    }
    
    
    for (int i = 0; i < 11; i = i + 3) {
        if (indexPath.row == i) {
            
            // add paper tab view
            self.paperTabView = [[BBSquareGradient alloc] initWithFrame:CGRectMake(80.0f, 0.0f, 234.0f, 100.0f)];
            
            self.paperTabView.firstColorRed = 1.0f;
            self.paperTabView.firstColorGreen = 0.3f;
            self.paperTabView.firstColorBlue = 0.3f;
            self.paperTabView.secondColorRed = 1.0f;
            self.paperTabView.secondColorGreen = 0.7f;
            self.paperTabView.secondColorBlue = 0.7f;
            
            [cell addSubview:self.paperTabView];
            
            // add small view in left of cell
            self.cellView = [[UIView alloc] initWithFrame:CGRectMake(5.0f, 0.0f, 67.0f, 100.0f)];
            self.cellView.backgroundColor = [UIColor colorWithRed:1.0f green:0.3f blue:0.3f alpha:1.0f];
            [cell addSubview:self.cellView];
            
            // cell selection effect
            if (indexPath.row == self.selectedIndexPath) {
                
                self.coverShadowView = [[UIView alloc] initWithFrame:CGRectMake(80.0f, 0.0f, 240.0f, 110.0f)];
                self.coverShadowView.backgroundColor = [UIColor whiteColor];
                
                self.highlightView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 234.0f, 100.0f)];
                self.highlightView.backgroundColor = [UIColor colorWithRed:0.7f green:0.1f blue:0.1f alpha:1.0f];
                self.highlightView.tintColor = [UIColor blackColor];
                self.highlightView.alpha = 0.8;
                
                [self.coverShadowView addSubview:self.highlightView];
                [cell addSubview:self.coverShadowView];
            }
        }
    }
    
    for (int i = 1; i < 11; i = i + 3) {
        if (indexPath.row == i) {
            
            // add paper tab view
            self.paperTabView = [[BBSquareGradient alloc] initWithFrame:CGRectMake(80.0f, 0.0f, 234.0f, 100.0f)];
            
            self.paperTabView.firstColorRed = 1.0f;
            self.paperTabView.firstColorGreen = 1.0f;
            self.paperTabView.firstColorBlue = 0.3f;
            self.paperTabView.secondColorRed = 1.0f;
            self.paperTabView.secondColorGreen = 1.0f;
            self.paperTabView.secondColorBlue = 0.7f;
            
            [cell addSubview:self.paperTabView];
            
            // add small view in left of cell
            self.cellView = [[UIView alloc] initWithFrame:CGRectMake(5.0f, 0.0f, 67.0f, 100.0f)];
            self.cellView.backgroundColor = [UIColor colorWithRed:1.0f green:1.0f blue:0.3f alpha:1.0f];
            [cell addSubview:self.cellView];
            
            // highlight cell effect selection
            if (indexPath.row == self.selectedIndexPath) {
                self.coverShadowView = [[UIView alloc] initWithFrame:CGRectMake(80.0f, 0.0f, 240.0f, 110.0f)];
                self.coverShadowView.backgroundColor = [UIColor whiteColor];
                
                self.highlightView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 234.0f, 100.0f)];
                self.highlightView.backgroundColor = [UIColor colorWithRed:0.7f green:0.7f blue:0.1f alpha:1.0f];
                self.highlightView.tintColor = [UIColor blackColor];
                self.highlightView.alpha = 0.8;
                
                [self.coverShadowView addSubview:self.highlightView];
                [cell addSubview:self.coverShadowView];
            }
        }
    }
    
    for (int i = 2; i < 11; i = i + 3) {
        if (indexPath.row == i) {
            
            // add paper tab view
            self.paperTabView = [[BBSquareGradient alloc] initWithFrame:CGRectMake(80.0f, 0.0f, 234.0f, 100.0f)];
            
            self.paperTabView.firstColorRed = 0.3f;
            self.paperTabView.firstColorGreen = 0.3f;
            self.paperTabView.firstColorBlue = 1.0f;
            self.paperTabView.secondColorRed = 0.7f;
            self.paperTabView.secondColorGreen = 0.7f;
            self.paperTabView.secondColorBlue = 1.0f;

            [cell addSubview:self.paperTabView];
            
            
            // add small view in left of cell
            self.cellView = [[UIView alloc] initWithFrame:CGRectMake(5.0f, 0.0f, 67.0f, 100.0f)];
            self.cellView.backgroundColor = [UIColor colorWithRed:0.3f green:0.3f blue:1.0f alpha:1.0f];
            [cell addSubview:self.cellView];
            
            // highlight cell effect selection
            if (indexPath.row == self.selectedIndexPath) {
                self.coverShadowView = [[UIView alloc] initWithFrame:CGRectMake(80.0f, 0.0f, 240.0f, 110.0f)];
                self.coverShadowView.backgroundColor = [UIColor whiteColor];
                
                self.highlightView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 234.0f, 100.0f)];
                self.highlightView.backgroundColor = [UIColor colorWithRed:0.1f green:0.1f blue:0.7f alpha:1.0f];
                self.highlightView.tintColor = [UIColor blackColor];
                self.highlightView.alpha = 0.8;
                
                [self.coverShadowView addSubview:self.highlightView];
                [cell addSubview:self.coverShadowView];
            }
        }
    }
    
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.selectedIndexPath = indexPath.row;
    [tableView reloadData];
}


- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.deselectedIndexPath = indexPath.row;
    [tableView reloadData];
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *header = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 320.0, 40.0)];
    header.backgroundColor = [UIColor whiteColor];
    header.alpha = 0.8;
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(5.0f, 10.0f, 100.0f, 30.0f)];
    label.backgroundColor= [UIColor clearColor];
    label.textColor = [UIColor redColor];
    label.layer.shadowColor = (__bridge CGColorRef)([UIColor blackColor]);
    label.layer.shadowOffset = CGSizeMake(0.5, 1);
    label.layer.shadowOpacity = 0.8f;
    label.font = [UIFont boldSystemFontOfSize:17.0];
    label.text = @"Paper Tabs";
    [header addSubview:label];
    return header;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 46.0;
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
