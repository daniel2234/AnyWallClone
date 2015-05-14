//
//  WallViewController.h
//  AnyWallClone
//
//  Created by Daniel Kwiatkowski on 2015-05-12.
//  Copyright (c) 2015 Daniel Kwiatkowski. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@class Post;

@interface WallViewController : UIViewController <MKMapViewDelegate,CLLocationManagerDelegate>


@end


@protocol WallViewControllerHighlight <NSObject>

- (void)highlightCellForPost:(Post *)post;
- (void)unhighlightCellForPost:(Post *)post;

@end