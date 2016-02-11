//
//  TableViewController.m
//  TheTranslater
//
//  Created by Brian Chen on 2/10/16.
//  Copyright © 2016 Brian Chen. All rights reserved.
//

#import "TableViewController.h"
#import "TableViewCell.h"

@interface TableViewController ()

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

//    NSLog(@"%@", self.responseData);
    self.tableAray = [[NSMutableArray alloc] initWithObjects:@"Food 1",@"Food 2",@"Food 3",@"Food 4",@"Food 5",@"Food 6",@"Food 7",@"Food 8",@"Food 9",@"Food 10", nil];

    self.navigationItem.title = self.titleOfTableView;
    
    self.listAry = [[NSArray alloc] init];
    self.numberAry = [[NSArray alloc] init];
    self.yearAry = [[NSArray alloc] init];
    
    [self fetchData];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)fetchData
{
    NSArray * items = [self.responseData valueForKeyPath:@"lfs"];
    
    for (NSDictionary * item in items)
    {
        self.listAry = [item valueForKey:@"lf"];
        self.numberAry = [item valueForKey:@"freq"];
        self.yearAry = [item valueForKey:@"since"];
    }
}

#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//    return 1;
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.listAry count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * cellIdentifier = @"myCell";
    TableViewCell *cell = (TableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        NSArray * nib = [[NSBundle mainBundle] loadNibNamed:@"TableViewCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    NSString * year = [NSString stringWithFormat:@"Since %@", [[self.yearAry objectAtIndex:indexPath.row] stringValue]];
    NSString * freq = [NSString stringWithFormat:@"Freq: %@", [[self.numberAry objectAtIndex:indexPath.row] stringValue]];
    
    cell.lbl_fullform.text = [self.listAry objectAtIndex:indexPath.row];
    cell.lbl_number.text = freq;
    cell.lbl_year.text = year;
    
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
