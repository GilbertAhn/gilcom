//
//  gilUIView.m
//  SampleProject
//
//  Created by Gilbert Ahn on 13. 1. 8..
//  Copyright (c) 2013년 Gilbert Ahn. All rights reserved.
//

#import "gilUIView.h"

@interface gilbUIView
{
}
- (void)drawTouch:(CGPoint)pt;
@end

@implementation gilUIView
@synthesize path;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

- (void)drawRect:(CGRect)rect
{
    [path stroke];
}


- (void)drawTouch:(CGPoint)pt
{
    CGRect rect;
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    rect.origin.x = pt.x-1;
    rect.origin.y = pt.y-1;
    rect.size.width = 3;
    rect.size.height = 3;
    CGContextAddEllipseInRect(ctx, rect);
    CGContextSetFillColor(ctx, CGColorGetComponents([[UIColor blueColor] CGColor]));
    CGContextFillPath(ctx);
}

unsigned long count;
CGPoint pt1, pt2, pt3;
/* Change git config */

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    CGPoint pt = [[touches anyObject] locationInView:self];
    self.path = [UIBezierPath bezierPath];
    path.lineWidth = 4.0f;
    count = 0;

    [path moveToPoint:pt];
   
    pt3 = pt2;
    pt2 = pt1;
    pt1 = pt;
    [self setNeedsDisplay];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    CGPoint pt = [[touches anyObject] locationInView:self];

    count++;
    [path addQuadCurveToPoint:pt controlPoint:pt1];
    pt3 = pt2;
    pt2 = pt1;
    pt1 = pt;
    
    [self setNeedsDisplay];
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    CGPoint pt = [[touches anyObject] locationInView:self];

    count++;
    [path addLineToPoint:pt];
    pt3 = pt2;
    pt2 = pt1;
    pt1 = pt;
    
    [self setNeedsDisplay];
}

-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self touchesEnded:touches withEvent:event];
}

@end
