//
//  ViewController.m
//  AnimateSequentially
//
//  Created by Steve Greenwood on 27/02/2015.
//  Copyright (c) 2015 Steve Greenwood. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *view1;
@property (weak, nonatomic) IBOutlet UIView *view2;
@property (weak, nonatomic) IBOutlet UILabel *label1;
@property (weak, nonatomic) IBOutlet UILabel *label2;

@end

@implementation ViewController

@synthesize view1, view2, label1, label2;

UIColor *normalColor;
UIColor *highlightedColor;
CGPoint view1StartPoint, view2StartPoint, lable1StartPoint, lable2StartPoint;
float duration, yOffset;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    duration = 2.0;
    yOffset = 100.0;
    normalColor = [UIColor lightGrayColor];
    highlightedColor = [UIColor greenColor];
    view1StartPoint = view1.center;
    view2StartPoint = view2.center;
    lable1StartPoint = label1.center;
    lable2StartPoint = label2.center;
    [self resetEverything:nil];
}

- (IBAction)animateViews:(id)sender
{
    [UIView animateWithDuration:duration
                     animations:^{
                         [view1 setBackgroundColor:highlightedColor];       // animates correctly
//                         [view1 setAlpha:0.2];                              // animates correctly
                         CGPoint p = view1.center;
                         p.y -= yOffset;
                         view1.center = p;                                 // animates correctly
                     }
                     completion:^(BOOL finished){
                         [UIView animateWithDuration:duration
                                          animations:^{
                                              [view2 setBackgroundColor:highlightedColor];
//                                              [view2 setAlpha:0.2];
                                              CGPoint p = view2.center;
                                              p.y -= yOffset;
                                              view2.center = p;                                 // animates correctly
                                          }
                                          completion:nil];
                     }
     ];
}

- (IBAction)animateLabelsSimple:(id)sender      // does NOT works sequentially
{
    [UIView animateWithDuration:duration
                     animations:^{
                         [label1 setBackgroundColor:highlightedColor];      // changes instantly
//                         [label1 setTextColor:[UIColor orangeColor]];       // changes instantly
//                         [label1 setAlpha:0.2];                             // animates correctly
                         CGPoint p = label1.center;
                         p.y -= yOffset;
                         label1.center = p;                                 // animates correctly
                     }
                     completion:^(BOOL finished){
                         [UIView animateWithDuration:duration
                                          animations:^{
                                              [label2 setBackgroundColor:highlightedColor];
//                                              [label2 setTextColor:[UIColor orangeColor]];
//                                              [label2 setAlpha:0.2];
                                              CGPoint p = label2.center;
                                              p.y -= yOffset;
                                              label2.center = p;
                                          }
                                          completion:nil];
                     }
     ];
}

- (IBAction)resetEverything:(id)sender
{
    [view1 setBackgroundColor:normalColor];
    [view2 setBackgroundColor:normalColor];
    [label1 setBackgroundColor:normalColor];
    [label2 setBackgroundColor:normalColor];
    
    [view1 setAlpha:1.0];
    [view2 setAlpha:1.0];
    [label1 setAlpha:1.0];
    [label2 setAlpha:1.0];
    
    [label1 setTextColor:[UIColor blackColor]];
    [label2 setTextColor:[UIColor blackColor]];

    view1.center = view1StartPoint;
    view2.center = view2StartPoint;
    label1.center = lable1StartPoint;
    label2.center = lable2StartPoint;
}


@end
