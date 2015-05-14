//
//  Post.h
//  AnyWallClone
//
//  Created by Daniel Kwiatkowski on 2015-05-13.
//  Copyright (c) 2015 Daniel Kwiatkowski. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import <Parse/Parse.h>

@interface Post : NSObject <MKAnnotation>

@property (nonatomic,readonly) CLLocationCoordinate2D coordinate;

@property (nonatomic, copy, readonly) NSString *title;
@property (nonatomic, copy,readonly) NSString *subtitle;

//intializer methods for custom pfobject annotation views
-(instancetype)initWithCoordinate:(CLLocationCoordinate2D)coordinate andTitle:(NSString*)title andSubtitle:(NSString*)subtitle;
- (instancetype)initWithPFObject:(PFObject *)object;

@end

