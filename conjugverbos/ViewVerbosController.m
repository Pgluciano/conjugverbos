//
//  ViewVerbosController.m
//  conjugverbos
//
//  Created by Peterson Guimarães Luciano on 9/29/13.
//  Copyright (c) 2013 Peterson Guimarães Luciano. All rights reserved.
//

#import "ViewVerbosController.h"

@interface ViewVerbosController ()
//@property (weak, nonatomic) IBOutlet UILabel *tempoPresente;


@end

@implementation ViewVerbosController;
@synthesize auxTempoPresente;
@synthesize tempoPresente;
@synthesize webView;
@synthesize timer;

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
    //tempoPresente.text = auxTempoPresente;
    
    [super viewDidLoad];
    
    //[webView addSubview:indicator];
    //[indicator hidesWhenStopped];
    
    //[indicator startAnimating];
	// Do any additional setup after loading the view.
    NSString *strURL = [[NSString alloc] initWithFormat:@"http://itinerariosp.com.br/conjugado.html?palavra="];
    
    NSString *varStr = [[strURL stringByAppendingString:auxTempoPresente] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSURL *url = [NSURL URLWithString:varStr];
    
    NSLog(@"%@",url);
     NSLog(@"%@",varStr);
    
   // [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://linuxsoares.github.io/conjugverbos_html5/conjugado.html?palavra=ababadar"]]];
    
    [webView loadRequest:[NSURLRequest requestWithURL:url]];
    timer=[NSTimer scheduledTimerWithTimeInterval:(1.0/2.0) target:self selector:@selector(loading) userInfo:Nil repeats:YES];
    
}

- (void) loading{

    if (!webView.loading)
        //[indicator stopAnimating];
        indicator.hidden=YES;
    
    else
        [indicator startAnimating];

}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
