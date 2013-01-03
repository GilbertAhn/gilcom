//
//  gilViewController.m
//  SampleProject
//
//  Created by Gilbert Ahn on 13. 1. 3..
//  Copyright (c) 2013년 Gilbert Ahn. All rights reserved.
//

#import "gilViewController.h"

@interface gilViewController ()

@end

@implementation gilViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

/* Setup type of application */
#ifdef LITE_VERSION
    _labelAppName.text = @"Sample App Lite";
#else
    _labelAppName.text = @"Sample App Full";
#endif
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
