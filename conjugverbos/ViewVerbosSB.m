//
//  ViewVerbosSB.m
//  conjugverbos
//
//  Created by Peterson Guimarães Luciano on 11/6/13.
//  Copyright (c) 2013 Peterson Guimarães Luciano. All rights reserved.
//

#import "ViewVerbosSB.h"
#import "ViewVerbosController.h"
#import "MyCell.h"

@interface ViewVerbosSB ()

@end

@implementation ViewVerbosSB
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
    
    [self.searchDisplayController.searchBar setPlaceholder:[NSLocalizedString(@"LABLE_BUSCAR_NA_LETRA", @"Message") stringByAppendingString:auxLetra]];
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    isSearching = NO;
    filteredList = [[NSMutableArray alloc] init];
    

    
    
    
//    //NSMutableArray *first = [NSMutableArray alloc] init];
//    for(int i =0 ; i < [listaverbos count] ; i++) {//if you have size, if don't not a problem, you could use while!
//        NSArray *second = [[NSArray alloc] initWithObjects:@"something",nil];
//        [listaverbos addObject:second];
//    }
//    
//    
//    
    NSLog(@"%@",[listaverbos objectAtIndex:0]);
    
}

-(void) viewDidAppear:(BOOL)animated
{
    [self.searchDisplayController.searchBar setPlaceholder:[NSLocalizedString(@"LABLE_BUSCAR_NA_LETRA", @"Message") stringByAppendingString:auxLetra]];

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



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
//    if (isSearching) {
//        //If the user is searching, use the list in our filteredList array.
//        return [filteredList count];
//    } else {
//        return [listaverbos count];
//    }
    
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        return [filteredList count];
        
    } else {
        return [listaverbos count];
        
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    
            if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    
            //NSDictionary *verbo = [listaverbos objectAtIndex:indexPath.row ];
            //cell.textLabel.text = [verbo objectForKey:@"nome"];
            //cell.detailTextLabel.text = [verbo objectForKey:@"id_verbos"];
    
        }
    
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        NSDictionary *verbo = [filteredList objectAtIndex:indexPath.row ];
        cell.textLabel.text = [verbo objectForKey:@"nome"];
    } else {
        NSDictionary *verbo = [listaverbos objectAtIndex:indexPath.row ];
        cell.textLabel.text = [verbo objectForKey:@"nome"];
    }
    
//    NSDictionary *verbo = [listaverbos objectAtIndex:indexPath.row ];
//    cell.textLabel.text = [verbo objectForKey:@"nome"];
    
    
    [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    
    
    //NSString *imagem = [[NSBundle mainBundle] pathForResource:auxLetra ofType:@".jpg"];
   
//    NSString *imagem = [auxLetra stringByAppendingString:@".jpg"];
//    UIImage * img = [UIImage imageNamed: imagem];
//    NSData * imageData = UIImagePNGRepresentation(img);
//    cell.imageView.image = [UIImage imageWithData: imageData];
    
    return cell;
    
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        
        ViewVerbosController *detVerbos = [storyboard instantiateViewControllerWithIdentifier:@"viewVerbosDet"];
        
        [self.navigationController pushViewController:detVerbos animated:YES];
        
        if (tableView == self.searchDisplayController.searchResultsTableView) {
            
            aux = [filteredList objectAtIndex:indexPath.row];
            
        }
        else {
            
            aux = [listaverbos objectAtIndex:indexPath.row];
        }
        
        detVerbos.auxTempoPresente = [aux objectForKey:@"nome"];
        
        [detVerbos setTitle:NSLocalizedString(@"TITULO_VERBO", @"Message")];
    }
    else
    {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"iPad_Storyboard" bundle:nil];
        
        ViewVerbosController *detVerbos = [storyboard instantiateViewControllerWithIdentifier:@"viewVerbosDet"];
        
        [self.navigationController pushViewController:detVerbos animated:YES];
        
        if (tableView == self.searchDisplayController.searchResultsTableView) {
            
            aux = [filteredList objectAtIndex:indexPath.row];
            
        }
        else {
            
            aux = [listaverbos objectAtIndex:indexPath.row];
        }
        
        detVerbos.auxTempoPresente = [aux objectForKey:@"nome"];
        
        [detVerbos setTitle:NSLocalizedString(@"TITULO_VERBO", @"Message")];
    }
    

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

#pragma mark - UISearchDisplayControllerDelegate

- (void)searchDisplayControllerWillBeginSearch:(UISearchDisplayController *)controller {
    //When the user taps the search bar, this means that the controller will begin searching.
    isSearching = YES;
}

- (void)searchDisplayControllerWillEndSearch:(UISearchDisplayController *)controller {
    //When the user taps the Cancel Button, or anywhere aside from the view.
    isSearching = NO;
}

//- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
//{
//    [self filterListForSearchText:searchString]; // The method we made in step 7
//    
//    // Return YES to cause the search result table view to be reloaded.
//    return YES;
//}

-(BOOL)searchDisplayController:(UISearchDisplayController *)controller
shouldReloadTableForSearchString:(NSString *)searchString
{
    [self filterListForSearchText:searchString
                               scope:[[self.searchDisplayController.searchBar scopeButtonTitles]
                                      objectAtIndex:[self.searchDisplayController.searchBar
                                                     selectedScopeButtonIndex]]];
    //[self.searchDisplayController.searchBar setText:[NSLocalizedString(@"LABLE_BUSCAR_NA_LETRA", @"Message") stringByAppendingString:auxLetra]];
    
    return YES;
}

//- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchScope:(NSInteger)searchOption
//{
//    [self filterListForSearchText:[self.searchDisplayController.searchBar text]]; // The method we made in step 7
//    
//    // Return YES to cause the search result table view to be reloaded.
//    return YES;
//}

#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//#warning Potentially incomplete method implementation.
//    // Return the number of sections.
//    return 0;
//}

//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//#warning Incomplete method implementation.
//    // Return the number of rows in the section.
//    return 0;
//}

//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    static NSString *CellIdentifier = @"Cell";
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
//    
//    // Configure the cell...
//    
//    return cell;
//}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
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
