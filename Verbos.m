//
//  Verbos.m
//  conjugverbos
//
//  Created by Peterson Guimarães Luciano on 9/29/13.
//  Copyright (c) 2013 Peterson Guimarães Luciano. All rights reserved.
//

#import "Verbos.h"
#import "ViewVerbosController.h"
#import "MyCell.h"

@interface Verbos ()

@end



@implementation Verbos
@synthesize auxLetra;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    [self getLocalDAta];
    [self.tableView registerClass:[MyCell class] forCellReuseIdentifier:@"Cell"];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
}

//- (void) viewDidAppear:(BOOL)animated
//{
//    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
//    [self getDAta];
//    [self.tableView reloadData];
//    
//
//}

//- (void) scrollViewDidScroll:(UIScrollView *)scrollView
//{
//
//    //[self getDAta];
//    //[self.tableView reloadData];
//    [self.tableView reloadData];
//    
//}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) getDAta
{
    
    //CARREGA VARIAVEL COM A URL DO WEBSERVICE
    NSString *strURL = [[NSString alloc] initWithFormat:@"http://itinerariosp.com.br:8080/verbosws/rest/verbos/letra/"];
    
    //CONCATENA A LETRA COM A URL DO WEBSERVICE
    NSString *varStr = [[strURL stringByAppendingString:auxLetra] stringByReplacingPercentEscapesUsingEncoding:NSISOLatin1StringEncoding];
    
    
    //CARREGA A URL COMPLETA NO OBJETO URL
    NSURL *url = [NSURL URLWithString:varStr];
    
    //CARREGA O RETORNO DA URL NO OBJETO TIPO DATA
    NSData *data = [NSData dataWithContentsOfURL:url];
    
    NSError *erro;
    
    if (data){
        listaverbos = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&erro];
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    }
    
    else{
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Erro de conexão" message:@"Verifique sua conexão de internet" delegate:nil cancelButtonTitle:@"Cancelar" otherButtonTitles:nil];
        [alert show];
    
    }
        
}


- (void) getLocalDAta
{
    NSString *nomeArquivo = @"letra";
    
    NSString *arquivo = [nomeArquivo stringByAppendingString:auxLetra];
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:arquivo ofType:@"json"];
    // Retrieve local JSON file
    
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

#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//#warning Potentially incomplete method implementation.
//    // Return the number of sections.
//    return 1;
//    //return [listaverbos count];
//}

//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//#warning Incomplete method implementation.
//    // Return the number of rows in the section.
//    return [listaverbos count];
//    //return 100;
//}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return [listaverbos count];

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
//        if (cell == nil) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
//        
//        NSDictionary *verbo = [listaverbos objectAtIndex:indexPath.row ];
//        cell.textLabel.text = [verbo objectForKey:@"nome"];
//        //cell.detailTextLabel.text = [verbo objectForKey:@"id_verbos"];
//
//    }
    
    NSDictionary *verbo = [listaverbos objectAtIndex:indexPath.row ];
    cell.textLabel.text = [verbo objectForKey:@"nome"];

    
    [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    
    
    //NSString *imagem = [[NSBundle mainBundle] pathForResource:auxLetra ofType:@".jpg"];
    NSString *imagem = [auxLetra stringByAppendingString:@".jpg"];
    UIImage * img = [UIImage imageNamed: imagem];
    NSData * imageData = UIImagePNGRepresentation(img);
    cell.imageView.image = [UIImage imageWithData: imageData];
    
    return cell;

}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    ViewVerbosController *detVerbos = [storyboard instantiateViewControllerWithIdentifier:@"viewVerbosDet"];
    
    [self.navigationController pushViewController:detVerbos animated:YES];
    
    NSDictionary *aux = [listaverbos objectAtIndex:indexPath.row];
    
    detVerbos.auxTempoPresente = [aux objectForKey:@"nome"];
    
    [detVerbos setTitle:NSLocalizedString(@"TITULO_VERBO", @"Message")];

}

/*
// Override to support conditional editing of the table view..- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end
