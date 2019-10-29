//
//  NativeRestService.m
//  LittleFilmWeb
//
//  Created by Piotr Rola on 24/10/2019.
//  Copyright © 2019 Piotr Rola. All rights reserved.
//

#import "NativeRestService.h"
#import "MovieDetails.h"

@implementation NativeRestService

-(void) searchWithQuery:(NSString *)searchQuery success:(void (^)(NSArray*))results failure:(void (^)(NSString*))failure {

    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithURL:[NSURL URLWithString: @"https://api.themoviedb.org/3/"]
            completionHandler:^(NSData *data,
                                NSURLResponse *response,
                                NSError *error) {
        if (error != nil) {
            NSString* errorDescription = [error description];
            failure(errorDescription);
        } else {

        }

    }] resume];

}
-(void) fetchMovie:(NSString *)movieId success:(void (^)(MovieDetails*))results failure:(void (^)(NSString*))failure {

    NSString* urlString = [[NSString alloc] initWithFormat:@"https://api.themoviedb.org/3/movie/%@", movieId];
    urlString = [urlString stringByAppendingString:@"?api_key=42fac1217ce98cc1cabcc54c3daf250e&language=en-US"];

    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithURL:[NSURL URLWithString:urlString]
            completionHandler:^(NSData *data,
                                NSURLResponse *response,
                                NSError *error) {
        if (error != nil) {
            NSString* errorDescription = [error description];
            failure(errorDescription);
        } else {

            NSError *jsonError;
            id allKeys = [NSJSONSerialization JSONObjectWithData:data options:NSJSONWritingPrettyPrinted error:&jsonError];

            MovieDetails* movieDetails = [[MovieDetails alloc] initWithName:allKeys[@"original_title"] shortDescription:allKeys[@"overview"] imageURL:[NSURL URLWithString:@"https://i0.wp.com/www.adventuresportsnetwork.com/wp-content/uploads/2013/09/cookiemonster.jpeg?w=620&ssl=1"] releaseDate:allKeys[@"release_date"] rating: allKeys[@"vote_average"] movieId: allKeys[@"id"]];
            results(movieDetails);
        }


    }] resume];

}

-(void) fetchMostPopularWithSuccess:(void (^)(NSArray*))results failure:(void (^)(NSString*))failure {

    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithURL:[NSURL URLWithString:@"https://api.themoviedb.org/3/movie/now_playing?api_key=42fac1217ce98cc1cabcc54c3daf250e&language=en-US&page=1"]
            completionHandler:^(NSData *data,
                                NSURLResponse *response,
                                NSError *error) {
        if (error != nil) {
            NSString* errorDescription = [error description];
            failure(errorDescription);
        } else {

            NSError *jsonError;
            id allKeys = [NSJSONSerialization JSONObjectWithData:data options:NSJSONWritingPrettyPrinted error:&jsonError];
            NSArray *arrayResult = allKeys[@"results"];
            NSMutableArray* popularMovies = [[NSMutableArray alloc] init];
            for (id movieJSON in arrayResult) {

                MovieDetails* movie = [[MovieDetails alloc] initWithName:[movieJSON  objectForKey:@"title"] shortDescription:[movieJSON  objectForKey:@"overview"] imageURL:[NSURL URLWithString:[movieJSON  objectForKey:@"poster_path"]] releaseDate:allKeys[@"release_date"] rating: [movieJSON  objectForKey:@"vote_average"] movieId: [movieJSON  objectForKey:@"id"]];
                [popularMovies addObject:movie];
            }

            results(popularMovies);

        }
    }] resume];

}

@end
