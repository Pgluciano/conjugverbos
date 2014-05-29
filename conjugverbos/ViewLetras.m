//
//  ViewLetras.m
//  conjugverbos
//
//  Created by Peterson Guimarães Luciano on 9/30/13.
//  Copyright (c) 2013 Peterson Guimarães Luciano. All rights reserved.
//

#import "ViewLetras.h"
#import "Verbos.h"
#import "ViewVerbosController.h"
#import "ViewVerbosSB.h"
#import "ViewAllLista.h"


@interface ViewLetras ()


@end

@implementation ViewLetras


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


//-(IBAction)aumentaValor:(id)sender{
//    
//    
//    if (progresso >= 1.0){
//    
//    
//        [timer invalidate];
//        
//    }
//    progresso += 0.01;
//    [progressView setProgress:progresso];
//
//
//
//
//}

- (void)viewDidAppear:(BOOL)animated{

    //progresso = 0.0;
    //[progressView setProgress:progresso];
    //lbCarregando.hidden=YES;
    //lbCarregando.text = @"";

}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //searchBar.hidden=YES;
    filteredList = [[NSMutableArray alloc] init];
    [self getLocalDAta];
    
    
    [self.searchDisplayController.searchBar setPlaceholder:NSLocalizedString(@"LABLE_BUSCAR_TODOS_VERBOS", @"Message")];
    
    
    
    // Set vertical effect
    UIInterpolatingMotionEffect *verticalMotionEffect = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.y" type:UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis];
    
    verticalMotionEffect.minimumRelativeValue = @(-40);
    verticalMotionEffect.maximumRelativeValue = @(40);
    
    // Set horizontal effect
    UIInterpolatingMotionEffect *horizontalMotionEffect =
    [[UIInterpolatingMotionEffect alloc]
     initWithKeyPath:@"center.x"
     type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
    
    horizontalMotionEffect.minimumRelativeValue = @(-40);
    horizontalMotionEffect.maximumRelativeValue = @(40);
    
    // Create group to combine both
    UIMotionEffectGroup *group = [UIMotionEffectGroup new];
    group.motionEffects = @[horizontalMotionEffect, verticalMotionEffect];
    
    // Add both effects to your view
    //[self.view addMotionEffect:group];
    [btnA addMotionEffect:group];
    [btnB addMotionEffect:group];
    [btnC addMotionEffect:group];
    [btnD addMotionEffect:group];
    [btnE addMotionEffect:group];
    [btnF addMotionEffect:group];
    [btnG addMotionEffect:group];
    [btnH addMotionEffect:group];
    [btnI addMotionEffect:group];
    [btnJ addMotionEffect:group];
    [btnL addMotionEffect:group];
    [btnM addMotionEffect:group];
    [btnN addMotionEffect:group];
    [btnO addMotionEffect:group];
    [btnP addMotionEffect:group];
    [btnQ addMotionEffect:group];
    [btnR addMotionEffect:group];
    [btnS addMotionEffect:group];
    [btnT addMotionEffect:group];
    [btnU addMotionEffect:group];
    [btnV addMotionEffect:group];
    [btnX addMotionEffect:group];
    [btnZ addMotionEffect:group];
    
    
    
    
    
    
    
    
    

    //[self refreshJson]; //Atualiza jsons
    //self.tabBarController.tabBar.barStyle = UIBarStyleBlack;
    //self.navigationController.navigationBar.barTintColor = [UIColor blueColor];
    //self.navigationController.navigationBar.titleTextAttributes = @{UITextAttributeTextColor : [UIColor blueColor]};
    
    //self.navigationController.navigationItem.backBarButtonItem.tintColor = [UIColor blueColor];
    
    //progresso = 0.0;
    //[progressView setProgress:progresso];
    
     //inicia animacao de load das letras
//    [UIView beginAnimations:nil context:NULL];
//    //[UIView setAnimationDelay:0.0];
//    
//
//    [UIView setAnimationDuration:0.5];
//    [btnA setAlpha:1];
//    [btnB setAlpha:1];
//    [btnC setAlpha:1];
//    [btnD setAlpha:1];
//    [UIView setAnimationDelay:1.0];
//    [btnE setAlpha:1];
//    [btnF setAlpha:1];
//    [btnG setAlpha:1];
//    [btnH setAlpha:1];
//    [UIView setAnimationDelay:1.5];
//    [btnI setAlpha:1];
//    [btnJ setAlpha:1];
//    [btnL setAlpha:1];
//    [btnM setAlpha:1];
//    [UIView setAnimationDelay:2.0];
//    [btnN setAlpha:1];
//    [btnO setAlpha:1];
//    [btnP setAlpha:1];
//    [btnQ setAlpha:1];
//    [UIView setAnimationDelay:2.5];
//    [btnR setAlpha:1];
//    [btnS setAlpha:1];
//    [btnT setAlpha:1];
//    [btnU setAlpha:1];
//    [UIView setAnimationDelay:3.0];
//    [btnV setAlpha:1];
//    [btnX setAlpha:1];
//    [btnZ setAlpha:1];
//    [UIView commitAnimations];
    
    
	// Do any additional setup after loading the view.
    
    
    
    
    // Add swipeGestures
    UISwipeGestureRecognizer *oneFingerSwipeDown = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(oneFingerSwipeDown:)];
    [oneFingerSwipeDown setDirection:UISwipeGestureRecognizerDirectionDown];
    [[self view] addGestureRecognizer:oneFingerSwipeDown];
    
    
}

- (void)oneFingerSwipeDown:(UITapGestureRecognizer *)recognizer {
    // Insert your own code to handle swipe left
    [self.searchDisplayController setActive:TRUE];
    [self.searchDisplayController.searchBar setShowsCancelButton:TRUE];
    [self.searchDisplayController.searchBar becomeFirstResponder];
}

- (void) getLocalDAta
{
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"Lista" ofType:@"json"];
    // Retrieve local JSON file - Old:Lista
    
    NSError *erro = nil; // This so that we can access the error if something goes wrong
    
    NSData *data = [NSData dataWithContentsOfFile:filePath options:NSDataReadingMappedIfSafe error:&erro];
    // Load the file into an NSData object called JSONData
    
    
    if (data){
        listaverbos = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&erro];
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    }
    
    else{
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Erro de conexão" message:@"Verifique sua conexão de internet" delegate:nil cancelButtonTitle:@"Cancelar" otherButtonTitles:nil];
        [alert show];
        
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        //
        //        NSDictionary *verbo = [listaverbos objectAtIndex:indexPath.row ];
        //        cell.textLabel.text = [verbo objectForKey:@"nome"];
        //        //cell.detailTextLabel.text = [verbo objectForKey:@"id_verbos"];
        //
        //
    }
    
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        NSDictionary *verbo = [filteredList objectAtIndex:indexPath.row ];
        cell.textLabel.text = [verbo objectForKey:@"nome"];
    } else {
        NSDictionary *verbo = [listaverbos objectAtIndex:indexPath.row ];
        cell.textLabel.text = [verbo objectForKey:@"nome"];
    }
    
    //NSDictionary *verbo = [listaverbos objectAtIndex:indexPath.row ];
    //cell.textLabel.text = [verbo objectForKey:@"nome"];
    
    [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    
    return cell;
    
}


- (void)filterListForSearchText:(NSString *)searchText scope:(NSString*)scope
{
    //[filteredList removeAllObjects]; //clears the array from all the string objects it might contain from the previous searches
    
    //    for (NSString *title in listaverbos) {
    //        NSRange nameRange = [title rangeOfString:searchText options:NSCaseInsensitiveSearch];
    //        if (nameRange.location != NSNotFound) {
    //            [filteredList addObject:title];
    //        }
    //    }
    
    NSPredicate *resultPredicate = [NSPredicate
                                    predicateWithFormat:@"SELF.nome BEGINSWITH[cd] %@",
                                    searchText];
    
    filteredList = [listaverbos filteredArrayUsingPredicate:resultPredicate];
}

-(BOOL)searchDisplayController:(UISearchDisplayController *)controller
shouldReloadTableForSearchString:(NSString *)searchString
{
    [self filterListForSearchText:searchString
                            scope:[[self.searchDisplayController.searchBar scopeButtonTitles]
                                   objectAtIndex:[self.searchDisplayController.searchBar
                                                  selectedScopeButtonIndex]]];
    
    return YES;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    ViewVerbosController *detVerbos = [storyboard instantiateViewControllerWithIdentifier:@"viewVerbosDet"];
    
    [self.navigationController pushViewController:detVerbos animated:YES];
    
    //NSDictionary *aux = [listaverbos objectAtIndex:indexPath.row];
    
//    if (tableView == self.searchDisplayController.searchResultsTableView) {
//        
//        aux = [filteredList objectAtIndex:indexPath.row];
//        
//    }
//    else {
//        
//        aux = [listaverbos objectAtIndex:indexPath.row];
//    }
    
    detVerbos.auxTempoPresente = [[filteredList objectAtIndex:indexPath.row] objectForKey:@"nome"];
    
    [detVerbos setTitle:NSLocalizedString(@"TITULO_VERBO", @"Message")];
    //[detVerbos setTitle:@"Conjugação do verbo"];
    
}


- (void)refreshJson{

    NSString *urlAsString = @"http://itinerariosp.com.br:8080/verbosws/rest/verbos/letra/u";
    
    NSURL *url = [NSURL URLWithString:urlAsString];
    
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    
    [NSURLConnection sendAsynchronousRequest:urlRequest queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        
        if([data length] > 0 && error == nil){
        
           // NSString *documentsDir = [NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES) objectAtIndex:0];
            
            NSString *filePath = [[NSBundle mainBundle] pathForResource:@"ListaOnline" ofType:@"json"];
            
            //NSString *filePath = [documentsDir stringByAppendingPathComponent:@"listaOnline.json"];
            
            //NSString *filePath = @"listaOnline.json";
            //teste mudanca de diretorio
            
            [data writeToFile:filePath atomically:YES];
            
            NSLog(@"Download com sucesso para %@.",filePath);
        }
        else if ([data length] == 0 && error == nil){
            NSLog(@"Não Baixou o Json");
        }
        else if (error != nil){
        
            NSLog(@"Aconteceu um erro = %@",error);
        }
    }];

}

// OCULTAR TECLADO AO TOCAR FORA DO TEXT BOX.
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = [[event allTouches] anyObject];
    
    //Verifique se o seu textField está com o teclado aberto e se o toque foi fora dele.
    if ([txtBuscar isFirstResponder] &&
        [touch view] != txtBuscar &&
        [touch view] != btnBuscar) {
        [txtBuscar resignFirstResponder];
    }
    [super touchesBegan:touches withEvent:event];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) carregaVerbos: (NSString*)letra{
    
    
    //UITouch *touch = [[event allTouches] anyObject];
    
    //Verifique se o seu textField está com o teclado aberto e se o toque foi fora dele.
    if ([txtBuscar isFirstResponder]) {
        [btnBuscar resignFirstResponder];
    }
    //[super touchesBegan:touches withEvent:event];
    
    //timer=[NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(aumentaValor:) userInfo:Nil repeats:YES];
    //lbCarregando.text = @"carregando verbos...";

    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    Verbos *listaVerbos = [storyboard instantiateViewControllerWithIdentifier:@"viewVerbosSB"];
    
    [self.navigationController pushViewController:listaVerbos animated:YES];
    
    //NSDictionary *aux = [listaverbos objectAtIndex:indexPath.row];
    
    listaVerbos.auxLetra = letra;
    
    //[listaVerbos setTitle:@"Selecione um Verbo"];
    [listaVerbos setTitle:NSLocalizedString(@"TITLE_VERBOS", @"Message")];

}

- (IBAction)btnBuscar:(id)sender{
    
    //NSLog([NSString stringWithFormat:@"%d", txtBuscar.text.length]);
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    
    [txtBuscar resignFirstResponder];
    
    
    if (txtBuscar.text.length < 1) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Campo de busca vazio" message:@"Digite o verbo desejado no campo de busca." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    
    }
    else{
        
        NSString *strURL = [[NSString alloc] initWithFormat:@"http://itinerariosp.com.br:8080/verbosws/rest/verbos/palavra/"];
        
        NSString *varStr = [strURL stringByAppendingString:txtBuscar.text];
        
        NSURL *url = [NSURL URLWithString:varStr];
        
        NSData *data = [NSData dataWithContentsOfURL:url];
        
        
        //NSError *erro;
    
    if (data.length > 2){
        
        
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        
        ViewVerbosController *detVerbos = [storyboard instantiateViewControllerWithIdentifier:@"viewVerbosDet"];
        
        [self.navigationController pushViewController:detVerbos animated:YES];
        
        detVerbos.auxTempoPresente = txtBuscar.text;
        
        [detVerbos setTitle:NSLocalizedString(@"TITULO_VERBO", @"Message")];
        
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    }
    
    else if (!data && txtBuscar.text.length > 0){
        
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Erro de conexão" message:@"Verifique sua conexão de internet" delegate:nil cancelButtonTitle:@"Cancelar" otherButtonTitles:nil];
        [alert show];
    
    }
    
    else{
        
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Verbo não encontrado" message:@"Verifique se a grafia do verbo está correta." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        
    }
    }
    
}

- (IBAction)btnSearch:(id)sender
{
//    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//    
//    ViewAllLista *viewLista = [storyboard instantiateViewControllerWithIdentifier:@"ViewAllLista"];
//    
//    [self.navigationController pushViewController:viewLista animated:YES];
//    
//    
//    [viewLista.searchDisplayController setActive:TRUE];
//    
//    [viewLista.searchDisplayController.searchBar setShowsCancelButton:TRUE];
//    //[viewLista.searchDisplayController.searchBar setShowsCancelButton:TRUE animated:TRUE];
//    
//    [viewLista.searchDisplayController.searchBar becomeFirstResponder];
    


    //searchBar.hidden=NO;
    [self.searchDisplayController setActive:TRUE];
    [self.searchDisplayController.searchBar setShowsCancelButton:TRUE];
    [self.searchDisplayController.searchBar becomeFirstResponder];
    
    
    


}




- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    // Return the number of rows in the section.
    //return [listaverbos count];
    //return 100;
    
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        return [filteredList count];
        
    } else {
        return [listaverbos count];
        
    }
}

//- (id)initWithSearchBar:(UISearchBar *)searchBar contentsController:(UIViewController *)viewController

//
//
//- (void)filterListForSearchText:(NSString *)searchText scope:(NSString*)scope
//{
//    //[filteredList removeAllObjects]; //clears the array from all the string objects it might contain from the previous searches
//    
//    //    for (NSString *title in listaverbos) {
//    //        NSRange nameRange = [title rangeOfString:searchText options:NSCaseInsensitiveSearch];
//    //        if (nameRange.location != NSNotFound) {
//    //            [filteredList addObject:title];
//    //        }
//    //    }
//    
//    NSPredicate *resultPredicate = [NSPredicate
//                                    predicateWithFormat:@"SELF.nome BEGINSWITH[cd] %@",
//                                    searchText];
//    
//    filteredList = [listaverbos filteredArrayUsingPredicate:resultPredicate];
//}
//
//
//-(BOOL)searchDisplayController:(UISearchDisplayController *)controller
//shouldReloadTableForSearchString:(NSString *)searchString
//{
//    [self filterListForSearchText:searchString
//                            scope:[[self.searchDisplayController.searchBar scopeButtonTitles]
//                                   objectAtIndex:[self.searchDisplayController.searchBar
//                                                  selectedScopeButtonIndex]]];
//    
//    return YES;
//}

//
//- (void) getLocalDAta
//{
//    
//    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"Lista" ofType:@"json"];
//    // Retrieve local JSON file - Old:Lista
//    
//    NSError *erro = nil; // This so that we can access the error if something goes wrong
//    
//    NSData *data = [NSData dataWithContentsOfFile:filePath options:NSDataReadingMappedIfSafe error:&erro];
//    // Load the file into an NSData object called JSONData
//    
//    
//    if (data){
//        listaverbos = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&erro];
//        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
//    }
//    
//    else{
//        
//        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Erro de conexão" message:@"Verifique sua conexão de internet" delegate:nil cancelButtonTitle:@"Cancelar" otherButtonTitles:nil];
//        [alert show];
//        
//    }
//    
//}



- (IBAction)btnAc:(id)sender {
    
    //lbCarregando.text = @"carregando verbos...";

    [self carregaVerbos:@"A"];
    
}

- (IBAction)btnBc:(id)sender {
    
    [self carregaVerbos:@"B"];
    
}

- (IBAction)btnCc:(id)sender {
    
    [self carregaVerbos:@"C"];
    
}

- (IBAction)btnDc:(id)sender {
    
    [self carregaVerbos:@"D"];
    
}

- (IBAction)btnEc:(id)sender {
    
    [self carregaVerbos:@"E"];
    
}

- (IBAction)btnFc:(id)sender {
    
    [self carregaVerbos:@"F"];
    
}

- (IBAction)btnGc:(id)sender {
    
    [self carregaVerbos:@"G"];
    
}

- (IBAction)btnHc:(id)sender {
    
    [self carregaVerbos:@"H"];
    
}

- (IBAction)btnIc:(id)sender {
    
    [self carregaVerbos:@"I"];
    
}

- (IBAction)btnJc:(id)sender {
    
    [self carregaVerbos:@"J"];
    
}

- (IBAction)btnLc:(id)sender {
    
    [self carregaVerbos:@"L"];
    
}

- (IBAction)btnMc:(id)sender {
    
    [self carregaVerbos:@"M"];
    
}

- (IBAction)btnNc:(id)sender {
    
    [self carregaVerbos:@"N"];
    
}

- (IBAction)btnOc:(id)sender {
    
    [self carregaVerbos:@"O"];
    
}

- (IBAction)btnPc:(id)sender {
    
    [self carregaVerbos:@"P"];
    
}
- (IBAction)btnQc:(id)sender {
    
    [self carregaVerbos:@"Q"];
    
}
- (IBAction)btnRc:(id)sender {
    
    [self carregaVerbos:@"R"];
    
}
- (IBAction)btnSc:(id)sender {
    
    [self carregaVerbos:@"S"];
    
}
- (IBAction)btnTc:(id)sender {
    
    [self carregaVerbos:@"T"];
    
}
- (IBAction)btnUc:(id)sender {
    
    [self carregaVerbos:@"U"];
    
}
- (IBAction)btnVc:(id)sender {
    
    [self carregaVerbos:@"V"];
    
}
- (IBAction)btnXc:(id)sender {
    
    [self carregaVerbos:@"X"];
    
}
- (IBAction)btnZc:(id)sender {
    
    [self carregaVerbos:@"Z"];
    
}


@end
