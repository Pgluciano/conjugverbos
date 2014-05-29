//
//  ViewAllLista.h
//  conjugverbos
//
//  Created by Peterson Guimarães Luciano on 10/8/13.
//  Copyright (c) 2013 Peterson Guimarães Luciano. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewAllLista : UITableViewController{
    NSMutableArray *listaverbos;
    NSArray *filteredList;
    NSDictionary *aux;
}

@end
