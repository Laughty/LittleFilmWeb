//
//  MovieListViewModel.m
//  LittleFilmWeb
//
//  Created by Piotr Rola on 24/10/2019.
//  Copyright © 2019 Piotr Rola. All rights reserved.
//

#import "MovieListViewModel.h"

@interface MovieListViewModel ()
    @property (nonatomic, strong) NSArray* movies;
    @property (nonatomic, strong) NSArray* favorites;
    @property (nonatomic, weak) NSUserDefaults* userDefaults;
    @property (nonatomic, strong) NSIndexPath* selectedIndexPath;
@end

@implementation MovieListViewModel

- (instancetype)initWithService:(AbstractService *)service {
    self = [super init];
    if (!self) return nil;

    self.service = service;
    self.userDefaults = [NSUserDefaults standardUserDefaults];
    self.favorites = [self.userDefaults arrayForKey: kCURRENTUserDataKey];

    return self;
}

-(void) fetchPopularMovies {
    [_service fetchMostPopularWithSuccess:^(NSArray* movies) {
        self.movies = movies;
        [self.delegate showPopularMovies];
    } failure:^(NSString* error){
        [self.delegate showErrorMessage:error];
    }];
}

- (struct Movie)movieAtIndexPath:(NSIndexPath * _Nullable)indexPath {
    MovieDetails *movie;
    if (indexPath == nil) {
        movie = _movies[_selectedIndexPath.row];
    } else {
        movie = _movies[indexPath.row];
    }
    struct Movie movieItem;
    movieItem.isFavorite = NO;
    movieItem.movieId = movie.movieId;
    for( NSString* movieId in _favorites) {
        if (movieId == movie.movieId) {
            movieItem.isFavorite = YES;
        }
    }
    movieItem.title = movie.name;

    return movieItem;
};

- (NSUInteger)numberOfMoviesInSection:(NSInteger)section {
    return _movies.count;
};

- (void)setFavoriteStateForIndex:(NSIndexPath *)indexPath withState: (BOOL)isFavorite {
    MovieDetails* selectedMovie = [_movies objectAtIndex:indexPath.row];
    NSMutableArray* newFavoritesMovies = [[NSMutableArray alloc]
                                          initWithArray:[self.userDefaults
                                                         arrayForKey: kCURRENTUserDataKey]];
    if (isFavorite) {
        [newFavoritesMovies addObject:selectedMovie.movieId];
    } else {
        for (NSString* movieId in newFavoritesMovies) {
            if (movieId == selectedMovie.movieId && !isFavorite) {
                [newFavoritesMovies removeObject:movieId];
                break;
            }
        }
    }
    _favorites = [[NSArray alloc] initWithArray:newFavoritesMovies];
    [self.userDefaults setObject: self.favorites forKey: kCURRENTUserDataKey];

};

- (void)selectMovieAtIndexPath:(NSIndexPath *)indexPath {
    _selectedIndexPath = indexPath;
}



@end
