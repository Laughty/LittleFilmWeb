//
//  MovieListTableViewController.h
//  LittleFilmWeb
//
//  Created by Piotr Rola on 25/10/2019.
//  Copyright © 2019 Piotr Rola. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MovieListViewModel.h"
#import "MovieItemTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface MovieListTableViewController : UITableViewController <UISearchBarDelegate, UISearchResultsUpdating, MovieListViewModelProtocol, MovieItemTableViewProtocol>

@property (nonatomic, strong) UISearchController *searchController;
@property (nonatomic, strong) MovieListViewModel *viewModel;

@end

NS_ASSUME_NONNULL_END
