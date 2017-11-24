//
//  ViewController.m
//  coreDataAssignment
//
//  Created by Student P_10 on 22/11/17.
//  Copyright © 2017 vaishnavifelixprogram. All rights reserved.
//

#import "ViewController.h"
#import"ProcessDataViewController.h"
#import "AppDelegate.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor cyanColor];
    self.myTable.backgroundColor = [UIColor cyanColor];
    [self fetch];

    
}
-(void)viewWillAppear:(BOOL)animated
{
    [self fetch];
}
-(void)fetch
{
    AppDelegate *delegate=(AppDelegate *)[[UIApplication sharedApplication]delegate];
    NSManagedObjectContext *context=[delegate managedObjectContext];
    NSError *error;
    NSObject *myobject;
    NSEntityDescription *entityDescription=[NSEntityDescription entityForName:@"Item" inManagedObjectContext:context];
    NSFetchRequest *request=[[NSFetchRequest alloc]init];
    [request setEntity:entityDescription];
    
    self.allObjects=[context executeFetchRequest:request error:&error];
    if(self.allObjects.count >0)
    {
        myobject=[self.allObjects firstObject];
        self.itemNameArray=[self.allObjects valueForKey:@"itemName"];
        self.itemRateArray=[self.allObjects valueForKey:@"itemID"];
        
        /*   [self.itemNameArray addObject:self.itemname];
            [self.itemRateArray addObject:self.itemrate];*/
        
        NSLog(@"NamesArray:%@",self.itemNameArray);
        NSLog(@"itemRateArray:%@",self.itemRateArray);
        
        
    }
    [self.myTable reloadData];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.itemNameArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    cell.textLabel.text=[self.itemNameArray objectAtIndex:indexPath.row];
    id rate=[self.itemRateArray objectAtIndex:indexPath.row];
    cell.detailTextLabel.text=[NSString stringWithFormat:@"%@",rate];
    cell.backgroundColor = [UIColor cyanColor];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{   [UIColor redColor];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ProcessDataViewController *pdvc =[storyboard instantiateViewControllerWithIdentifier:@"ProcessDataViewController"];

  
    [self.navigationController pushViewController:pdvc animated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
