//
//  WallPostTableViewController.m
//  AnyWallClone
//
//  Created by Daniel Kwiatkowski on 2015-05-13.
//  Copyright (c) 2015 Daniel Kwiatkowski. All rights reserved.
//

#import "WallPostTableViewController.h"

#import "Constants.h"
#import "Post.h"

static NSUInteger const WallPostsTableViewMainSection = 0;

@interface WallPostTableViewController ()

@end

@implementation WallPostTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}


-(void)highlightCellForPost:(Post *)post{
    NSUInteger index = 0;
    // fast enum for pfobject instance
    for (PFObject *object in [self objects]) {
        Post *postFromObject = [[Post alloc]initWithPFObject:object];
        if ([post isEqual:postFromObject]) {
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:index inSection:WallPostsTableViewMainSection];
            [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionMiddle animated:YES];
            [self.tableView selectRowAtIndexPath:indexPath animated:NO scrollPosition:UITableViewScrollPositionNone];
            
            return;
        }
        index++;
    }

    
    //Dont scroll for post
    if (![post.title isEqualToString:WallCantViewPost]) {
        NSUInteger rows = [self.tableView numberOfRowsInSection:WallPostsTableViewMainSection];
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:(rows - 1) inSection:WallPostsTableViewMainSection];
        [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionBottom animated:YES];
        [self.tableView selectRowAtIndexPath:indexPath animated:NO scrollPosition:UITableViewScrollPositionNone];
        [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    }
}


-(void)unhighlightCellForpost:(Post *)post{
    //Deselect from row
    NSUInteger index = 0;
    for (PFObject *object in [self objects]) {
        Post *postFromObject = [[Post alloc]initWithPFObject:object];
        if ([post isEqual:postFromObject]) {
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:index inSection:0];
            [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
            return;
        }
        index ++;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    return 0;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

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
