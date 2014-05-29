//
//  ViewSobre.m
//  conjugverbos
//
//  Created by Peterson Guimarães Luciano on 10/8/13.
//  Copyright (c) 2013 Peterson Guimarães Luciano. All rights reserved.
//

#import "ViewSobre.h"
#import "ViewControllerClassifique.h"

@interface ViewSobre ()

@end

@implementation ViewSobre

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self setTitle:NSLocalizedString(@"TITLE_ABOUT", @"Message")];
}

//LINK PARA AVALIAR O APP DENTRO DO APLICATIVO
- (IBAction)gotoReviews:(id)sender
{
    
    NSString *str = @"itms-apps://itunes.apple.com/app/id737483288";
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
