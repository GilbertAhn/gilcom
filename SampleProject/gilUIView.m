//
//  gilUIView.m
//  SampleProject
//
//  Created by Gilbert Ahn on 13. 1. 8..
//  Copyright (c) 2013년 Gilbert Ahn. All rights reserved.
//

#import "gilUIView.h"

@interface gilbUIView
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

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    CGPoint pt = [[touches anyObject] locationInView:self];
    self.path = [UIBezierPath bezierPath];
    path.lineWidth = 4.0f;
    
    [path moveToPoint:pt];
    
    [self setNeedsDisplay];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    CGPoint pt = [[touches anyObject] locationInView:self];
    [path addLineToPoint:pt];
    
    [self setNeedsDisplay];
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    CGPoint pt = [[touches anyObject] locationInView:self];
    [path addLineToPoint:pt];
    
    [self setNeedsDisplay];
}

-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self touchesEnded:touches withEvent:event];
}

@end
