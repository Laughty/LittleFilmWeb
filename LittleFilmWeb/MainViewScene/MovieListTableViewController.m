//
//  MovieListTableViewController.m
//  LittleFilmWeb
//
//  Created by Piotr Rola on 25/10/2019.
//  Copyright © 2019 Piotr Rola. All rights reserved.
//

#import "MovieListTableViewController.h"
#import "MovieItemTableViewCell.h"
#import "MovieDetailsViewController.h"

@interface MovieListTableViewController ()

@end

@implementation MovieListTableViewController
NSString* const movieCellIdentifier = @"MovieCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Search controller
    self.searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
    self.searchController.searchResultsUpdater = self;
    self.searchController.searchBar.delegate = self;

    // Add the search bar
    self.tableView.tableHeaderView = self.searchController.searchBar;
    self.definesPresentationContext = YES;
    [self.searchController.searchBar sizeToFit];
    [self.tableView registerNib:[UINib nibWithNibName:@"MovieItemTableViewCell" bundle:nil] forCellReuseIdentifier:movieCellIdentifier];
    self.viewModel.delegate = self;
    [self.viewModel fetchPopularMovies];
    self.title = @"Super supreme movieS";
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_viewModel numberOfMoviesInSection:section];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MovieItemTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:movieCellIdentifier forIndexPath:indexPath];

    struct Movie movie = [_viewModel movieAtIndexPath: indexPath];

    cell.movieTitleLabel.text = movie.title;
    cell.switchButton.on = movie.isFavorite;
    cell.delegate = self;

    return cell;
}


 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return NO;
 }

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [_viewModel selectMovieAtIndexPath:indexPath];
    [self performSegueWithIdentifier:@"ToMovieDetails" sender:self];
    UITableViewCell* cell = [tableView cellForRowAtIndexPath:indexPath];
    [cell setSelected:NO];
}

- (void)stateChangeTo: (BOOL)isFavorite forCell: (UITableViewCell *)cell {
    NSIndexPath* cellIndexPath = [self.tableView indexPathForCell:cell];
    [_viewModel setFavoriteStateForIndex:cellIndexPath withState:isFavorite];
}

- (void)updateSearchResultsForSearchController:(nonnull UISearchController *)searchController {
   NSLog(@"%@", searchController.searchBar.text);
}

- (void)showErrorMessage:(nonnull NSString *)errorMessage {
    NSLog(@"errro occured");
}

- (void)showPopularMovies {
    dispatch_async(dispatch_get_main_queue(), ^{
      [self.tableView reloadData];
    });
}

- (void)showSearchResults {
    dispatch_async(dispatch_get_main_queue(), ^{
      [self.tableView reloadData];
    });
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    MovieDetailsViewController* destination = segue.destinationViewController;
    struct Movie movie = [_viewModel movieAtIndexPath:nil];
    MovieDetailsViewModel* viewModel = [[MovieDetailsViewModel alloc] initWithService:_viewModel.service movieId: movie.movieId];
    destination.viewModel = viewModel;
}

@end
