//
//  MyTableViewController.m
//  ios_hmwk1
//
//  Created by Xiaoting Ye on 2/7/13.
//  Copyright (c) 2013 Xiaoting Ye. All rights reserved.
//

#import "MyTableViewController.h"

@interface MyTableViewController ()
/*
{
    NSArray *videolist;
}
 */
@end

@implementation MyTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        NSError* error = nil;
        /*
         * this is the playlist that we get from youtube 
         */
        NSURL* playlist_url = [NSURL URLWithString:@"http://gdata.youtube.com/feeds/api/playlists/PL8AB7A9E390FB5F19?alt=json"];
        /*
         * get the data from the obove url
         */
        NSData* data = [NSData dataWithContentsOfURL:playlist_url];
        /*
         * parse the data 
         */
        NSDictionary* json_parsed = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
        /*
         * get the parts that we are interested in 
         */
        NSDictionary* json_feeds = [json_parsed objectForKey:@"feed"];
        /*
         * compose the rows 
         */
        _strings = [json_feeds objectForKey:@"entry"];
        
        
        //_strings = [[NSMutableArray alloc] initWithObjects:@"a1", @"a2", @"a3", @"a4", nil];
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    [[self tableView] registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    [[self tableView] setEditing:NO animated:YES];
    /* The tile of our app */
    self.title = @"MiniList";

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [_strings count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    NSLog(@"test");
    // [[cell textLabel] setText:[_strings objectAtIndex:[indexPath row]]];
    // Configure the cell...
    NSDictionary* entry = _strings[[indexPath row]];
    
    /* 
     * By these three steps we display the title of each video on the screen in each row 
     */
    NSDictionary* item_title = [entry objectForKey:@"title"];
    NSString* title = [item_title objectForKey:@"$t"];
    cell.textLabel.text = title;
  
    
    /*
     * display the thumbnail image on the left part of the rows 
     */
    NSDictionary *json_group = [entry objectForKey:@"media$group"];
    NSArray* item_image = [json_group objectForKey:@"media$thumbnail"];
    NSString *image_url_str = [item_image[1] objectForKey:@"url"];
    NSURL *image_url = [NSURL URLWithString:image_url_str];
    NSData *image = [NSData dataWithContentsOfURL:image_url];
    UIImage *myimage = [[UIImage alloc] initWithData:image];
    
    
    cell.imageView.image = myimage;
    return cell;
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

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end
