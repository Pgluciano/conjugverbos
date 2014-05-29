//
//  ViewLetras.h
//  conjugverbos
//
//  Created by Peterson Guimarães Luciano on 9/30/13.
//  Copyright (c) 2013 Peterson Guimarães Luciano. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewLetras : UIViewController <UITextFieldDelegate>
{
    __weak IBOutlet UIButton *btnA;
    __weak IBOutlet UIButton *btnB;
    __weak IBOutlet UIButton *btnC;
    __weak IBOutlet UIButton *btnD;
    __weak IBOutlet UIButton *btnE;
    __weak IBOutlet UIButton *btnF;
    __weak IBOutlet UIButton *btnG;
    __weak IBOutlet UIButton *btnH;
    __weak IBOutlet UIButton *btnI;
    __weak IBOutlet UIButton *btnJ;
    __weak IBOutlet UIButton *btnL;
    __weak IBOutlet UIButton *btnM;
    __weak IBOutlet UIButton *btnN;
    __weak IBOutlet UIButton *btnO;
    __weak IBOutlet UIButton *btnP;
    __weak IBOutlet UIButton *btnQ;
    __weak IBOutlet UIButton *btnR;
    __weak IBOutlet UIButton *btnS;
    __weak IBOutlet UIButton *btnT;
    __weak IBOutlet UIButton *btnU;
    __weak IBOutlet UIButton *btnV;
    __weak IBOutlet UIButton *btnX;
    __weak IBOutlet UIButton *btnZ;
    IBOutlet UIButton *btnBuscar;
    IBOutlet UITextField *txtBuscar;
    //IBOutlet UIProgressView *progressView;
    //float progresso;
    //NSTimer *timer;
    IBOutlet UILabel *lbCarregando;
    
    NSMutableArray *listaverbos;
    NSArray *filteredList;
    
    IBOutlet UISearchDisplayController *searchDisplayController;
    IBOutlet UISearchBar *searchBar;
    
    
}
- (IBAction)btnAc:(id)sender;
- (IBAction)btnBc:(id)sender;
- (IBAction)btnCc:(id)sender;
- (IBAction)btnDc:(id)sender;
- (IBAction)btnEc:(id)sender;
- (IBAction)btnFc:(id)sender;
- (IBAction)btnGc:(id)sender;
- (IBAction)btnHc:(id)sender;
- (IBAction)btnIc:(id)sender;
- (IBAction)btnJc:(id)sender;
- (IBAction)btnLc:(id)sender;
- (IBAction)btnMc:(id)sender;
- (IBAction)btnNc:(id)sender;
- (IBAction)btnOc:(id)sender;
- (IBAction)btnPc:(id)sender;
- (IBAction)btnQc:(id)sender;
- (IBAction)btnRc:(id)sender;
- (IBAction)btnSc:(id)sender;
- (IBAction)btnTc:(id)sender;
- (IBAction)btnUc:(id)sender;
- (IBAction)btnVc:(id)sender;
- (IBAction)btnXc:(id)sender;
- (IBAction)btnZc:(id)sender;
- (IBAction)btnBuscar:(id)sender;
//- (IBAction)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;
//- (IBAction)aumentaValor:(id)sender;


@end
