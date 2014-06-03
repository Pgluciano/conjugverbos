//
//  ViewAllLista.m
//  conjugverbos
//
//  Created by Peterson Guimarães Luciano on 10/8/13.
//  Copyright (c) 2013 Peterson Guimarães Luciano. All rights reserved.
//

#import "ViewAllLista.h"
#import "ViewVerbosController.h"
#import "MyCell.h"


@interface ViewAllLista ()
@property (nonatomic,strong) UIRefreshControl *refreshControl;

@end

@implementation ViewAllLista

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        //fresh control
        self.refreshControl = [[UIRefreshControl alloc]init];
        self.refreshControl = self.refreshControl;
        [self.refreshControl addTarget:self action:@selector(handleRefresh:) forControlEvents:UIControlEventValueChanged];
    }
    return self;
}

- (void) handleRefresh:(id)paramSender{
    //int64_t delayInSeconds = 1.0f;
    [self.refreshControl endRefreshing];
    [self.tableView reloadData];

}


- (void)viewDidLoad
{
    [super viewDidLoad];
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    //[self getDAta];
    [self getLocalDAta];
    [self.tableView registerClass:[MyCell class] forCellReuseIdentifier:@"Cell"];
    filteredList = [[NSMutableArray alloc] init];
    
    //[self.searchDisplayController.searchBar setShowsCancelButton:TRUE];
    
    [self.searchDisplayController.searchBar setPlaceholder:NSLocalizedString(@"LABLE_BUSCAR_TODOS_VERBOS", @"Message")];
    
    
}

- (void) viewDidAppear:(BOOL)animated
{
//    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
//    [self getDAta];
//    [self.tableView reloadData];
    //[self.searchDisplayController.searchBar setShowsCancelButton:TRUE];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (void) getDAta
{
    
    NSString *strURL = [[NSString alloc] initWithFormat:@"http://itinerariosp.com.br:8080/verbosws/rest/verbos/lista/"];
    
    NSURL *url = [NSURL URLWithString:strURL];
    
    NSData *data = [NSData dataWithContentsOfURL:url];
    
    NSError *erro;
    
    if(data){
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

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        
        ViewVerbosController *detVerbos = [storyboard instantiateViewControllerWithIdentifier:@"viewVerbosDet"];
        
        [self.navigationController pushViewController:detVerbos animated:YES];
        
        //NSDictionary *aux = [listaverbos objectAtIndex:indexPath.row];
        
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
        
        //NSDictionary *aux = [listaverbos objectAtIndex:indexPath.row];
        
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
