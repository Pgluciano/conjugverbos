//
//  ViewVerbosSB.h
//  conjugverbos
//
//  Created by Peterson Guimarães Luciano on 11/6/13.
//  Copyright (c) 2013 Peterson Guimarães Luciano. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewVerbosSB : UITableViewController{


    NSMutableArray *listaverbos;
    BOOL isSearching;
    
    NSArray *filteredList;
    
    NSString *auxLetra;
    
    NSDictionary *aux;

    
}

@property  NSString *auxLetra;

@end
