//
//  ViewController.h
//  coreDataAssignment
//
//  Created by Student P_10 on 22/11/17.
//  Copyright © 2017 vaishnavifelixprogram. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *myTable;
@property(nonatomic,retain)NSArray *name,*rate;
@property NSArray *allObjects;
@property(nonatomic,retain)NSMutableArray *itemNameArray,*itemRateArray;
@property(nonatomic,retain)NSMutableString *itemname,*itemrate;


@end

