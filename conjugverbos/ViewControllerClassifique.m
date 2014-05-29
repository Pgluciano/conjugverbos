//
//  ViewControllerClassifique.m
//  conjugverbos
//
//  Created by Peterson Guimarães Luciano on 10/3/13.
//  Copyright (c) 2013 Peterson Guimarães Luciano. All rights reserved.
//

#import "ViewControllerClassifique.h"

@interface ViewControllerClassifique ()

@end

@implementation ViewControllerClassifique

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
    [self setTitle:NSLocalizedString(@"TITLE_CLASSIFIQUE", @"Message")];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


////LINK PARA AVALIAR O APP DENTRO DO APLICATIVO
//- (IBAction)gotoReviews:(id)sender
//{
//    //NSString *str = @"itms-apps://ax.itunes.apple.com/WebObjects/MZStore.woa";
//    NSString *str = @"itms-apps://ax.itunes.apple.com/WebObjects/MZStore.woa/wa/viewSoftware?id=737483288";
//    //str = [NSString stringWithFormat:@"%@/wa/viewContentsUserReviews?", str];
//    //str = [NSString stringWithFormat:@"%@type=Purple+Software&id=", str];
//    
//    // Here is the app id from itunesconnect
//    //str = [NSString stringWithFormat:@"%@737483288", str];
//    
//    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
//}

//LINK PARA LOJA FIREFOX
- (IBAction)gotoFirefox:(id)sender
{
    NSString *str = @"https://marketplace.firefox.com/app/conjugverbos-1";
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
}

//LINK PARA LOJA WINDOWS
- (IBAction)gotoWindows:(id)sender
{
    NSString *str = @"http://apps.microsoft.com/windows/pt-br/app/c6864335-8433-4d72-98d5-e1b97b67b0f8";
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
}


//LINK PARA WEBSITE
- (IBAction)gotoWeb:(id)sender
{
    NSString *str = @"http://conjugverbos.com.br";
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
}


-(IBAction)gotoAndroid:(id)sender
{

    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle:@"GooglePlay Store"
                          message:@"Aplicativo disponível em breve na GooglePlay Store."
                          delegate: nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
    
    [alert show];

}

@end
