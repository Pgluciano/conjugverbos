//
//  ViewVerbosController.h
//  conjugverbos
//
//  Created by Peterson Guimarães Luciano on 9/29/13.
//  Copyright (c) 2013 Peterson Guimarães Luciano. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewVerbosController : UIViewController{
    NSString *auxTempoPresente;
    IBOutlet UIWebView *webView;
    IBOutlet UIActivityIndicatorView *indicator;
    NSTimer *timer;
}

@property (weak, nonatomic) IBOutlet UILabel *tempoPresente;
@property NSString *auxTempoPresente;
@property (nonatomic,retain) IBOutlet UIWebView *webView;
@property NSTimer *timer;

@end
