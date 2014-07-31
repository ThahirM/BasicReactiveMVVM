//
//  TMHomeViewController.m
//  BasicReactiveMVVM
//
//  Created by Thahir on 24/07/14.
//  Copyright (c) 2014 Thahir. All rights reserved.
//

#import "TMHomeViewController.h"
#import "TMSearchViewModel.h"
#import "TMResultsViewController.h"
#import "TMTableViewBinder.h"
#import "TMTableViewCell.h"

@interface TMHomeViewController () <TMReactiveView, TMTableViewBinderDelegate>
@property (weak, nonatomic) IBOutlet UITextField *textFieldSearch;
@property (weak, nonatomic) IBOutlet UIButton *buttonSearch;

@end

@implementation TMHomeViewController

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
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    // set a view model if we dont have one
    if (!_viewModel) _viewModel = [TMSearchViewModel new];
    
    // bind view model
    [self bindViewModel];
    
}

- (void)bindViewModel {
    RAC(self.viewModel, searchText) = self.textFieldSearch.rac_textSignal;
    
    self.buttonSearch.rac_command = self.viewModel.executeSearch;
    
    [self.viewModel.executeSearchCompletionSignal subscribeNext:^(id x) {
        [self.textFieldSearch resignFirstResponder];
        [self performSegueWithIdentifier:@"kSegueResults" sender:self];
        
    }];

    TMTableViewBinder *tableViewBinder = [TMTableViewBinder bindTableView:self.tableView withSourceSignal:self.viewModel.executeSearchCompletionSignal selectionCommand:nil cellClass:[TMTableViewCell class]];
    tableViewBinder.delegate = self;
}

#pragma mark - Table view data source

//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//    // Return the number of rows in the section.
//    return self.viewModel.searchResults.count;
//}
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"kSearchCell"];
//    cell.textLabel.text = self.viewModel.searchResults[indexPath.row];
//    return cell;
//}
/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

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
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
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


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"kSegueResults"]) {
        TMResultsViewController *vc = segue.destinationViewController;
        vc.viewModel = _viewModel;
    }
}


@end
