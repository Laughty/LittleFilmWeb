//
//  MovieListViewModel.h
//  LittleFilmWeb
//
//  Created by Piotr Rola on 24/10/2019.
//  Copyright © 2019 Piotr Rola. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "AbstractService.h"
#import "MovieDetails.h"
#import "Constans.h"

NS_ASSUME_NONNULL_BEGIN

@protocol MovieListViewModelProtocol <NSObject>

- (void)showPopularMovies;
- (void)showSearchResults;
- (void)showErrorMessage:(NSString *)errorMessage;

@end

struct Movie {
   NSString *title;
   NSString *movieId;
   BOOL isFavorite;
};


@interface MovieListViewModel : NSObject

@property (nonatomic, strong) AbstractService* service;
@property (nonatomic, weak) id <MovieListViewModelProtocol> delegate;

- (instancetype)initWithService:(AbstractService *)service;

- (NSUInteger)numberOfMoviesInSection:(NSInteger)section;
- (void)setFavoriteStateForIndex:(NSIndexPath *)indexPath withState: (BOOL)isFavorite;
- (struct Movie)movieAtIndexPath:(NSIndexPath * _Nullable)indexPath;
- (void)selectMovieAtIndexPath:(NSIndexPath *)indexPath;

-(void) fetchPopularMovies;

@end

NS_ASSUME_NONNULL_END
