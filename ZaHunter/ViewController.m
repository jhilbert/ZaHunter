//
//  ViewController.m
//  ZaHunter
//
//  Created by John Malloy on 1/22/14.
//  Copyright (c) 2014 Big Red INC. All rights reserved.
//

#import "ViewController.h"
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController () <MKMapViewDelegate,UITableViewDelegate,UITableViewDataSource>
{
    NSArray *pizzaPlaces;
}

@end

@implementation ViewController

- (void)viewDidLoad

{
    [super viewDidLoad];
    pizzaPlaces = [NSArray new];
    
    
    MKLocalSearchRequest * request = [MKLocalSearchRequest new];
    request.naturalLanguageQuery = @"Pizza";
    MKLocalSearch * search = [[MKLocalSearch alloc]initWithRequest:request];
    [search startWithCompletionHandler:^(MKLocalSearchResponse *response, NSError *error) {
      //  NSLog(@"%@",response);
        
        for (MKMapItem * item in response.mapItems) {
            NSLog(@"%@",item.name);
            
            NSLog(@"%f",item.placemark.location.coordinate.latitude);
        
        }
        
        
    }];
    
    
}


-(void)calculateDistance:(MKMapItem *)destinationItem
{
    MKDirectionsRequest * request = [MKDirectionsRequest new];
    request.source = [MKMapItem mapItemForCurrentLocation];
    request.destination = destinationItem;
    MKDirections * directions = [[MKDirections alloc]initWithRequest:request];
    [directions calculateDirectionsWithCompletionHandler:^(MKDirectionsResponse *response, NSError *error)
     {
         MKPolyline * polyline = [response.routes.firstObject polyline];
         int distance = 0;
         for (CLLocationCoordinate2D in polyline.points) {
             distance = distance + 
         }
     }];
}






-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return pizzaPlaces.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"PizzaCell"];
    NSDictionary * pizzaPlace = [pizzaPlaces objectAtIndex:indexPath.row];
    
    cell.textLabel.text = pizzaPlace[@"name"];
    
    return cell;
}

@end
