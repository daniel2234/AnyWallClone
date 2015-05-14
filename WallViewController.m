//
//  WallViewController.m
//  AnyWallClone
//
//  Created by Daniel Kwiatkowski on 2015-05-12.
//  Copyright (c) 2015 Daniel Kwiatkowski. All rights reserved.
//

#import "WallViewController.h"
#import "Constants.h"
#import "Post.h"
#import "WallPostCreateViewController.h"
#import "WallPostTableViewController.h"


@interface WallViewController ()

@property (nonatomic,strong) CLLocationManager *locationManager;
@property (nonatomic,strong) CLLocation *currentLocation;

@end

@implementation WallViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




-(void) setCurrentLocation:(CLLocation *) currentLocation{
    if (self.currentLocation == currentLocation) {
        _currentLocation = currentLocation;
    }
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [[NSNotificationCenter defaultCenter]postNotificationName:CurrentLocationDuringChangeNotification object:nil userInfo:@{LocationKey:currentLocation}];
    });
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations{
    self.currentLocation = [locations lastObject];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
