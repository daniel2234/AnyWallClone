//
//  Post.m
//  AnyWallClone
//
//  Created by Daniel Kwiatkowski on 2015-05-13.
//  Copyright (c) 2015 Daniel Kwiatkowski. All rights reserved.
//

#import "Post.h"

#import "Constants.h"

@interface Post ()

@property (nonatomic,readwrite) CLLocationCoordinate2D coordinate;

@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *subtitle;

@property (nonatomic,strong) PFObject *object;
@property (nonatomic,strong) PFUser *user;

@end



@implementation Post

- (instancetype)initWithCoordinate:(CLLocationCoordinate2D)coordinate
                          andTitle:(NSString *)title
                       andSubtitle:(NSString *)subtitle {
    self = [super init];
    if (self) {
        self.coordinate = coordinate;
        self.title = title;
        self.subtitle = subtitle;
    }
    return self;
}


- (instancetype)initWithPFObject:(PFObject *)object{
    PFGeoPoint *geoPoint = object[ParsePostLocationKey];
    CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(geoPoint.latitude, geoPoint.longitude);
    NSString *title = object[ParsePostTextKey];
    NSString *subtitle = object[ParsePostTextKey][ParsePostUserKey]?: object[ParsePostUserKey][ParsePostUsernameKey];
    
    self = [self initWithCoordinate:coordinate andTitle:title andSubtitle:subtitle];
    if (self) {
        self.object = object;
        self.user = object[ParsePostUserKey];
    }
    return self;
}

-(BOOL)isEqual:(id)other{
    if (![other isKindOfClass:[Post class]]) {
        return NO;
    }
    //if the pfobject is the same as the post class
    Post *post = (Post*)other;
    
    if (post.object && self.object) {
    //We have a PFObject inside Post, use that instead
        return [post.object.objectId isEqualToString:self.object.objectId];
    }
    //fallback to properties
    return ([post.title isEqualToString:self.title] && [post.subtitle isEqualToString:self.subtitle] && post.coordinate.latitude == self.coordinate.latitude && post.coordinate.longitude == self.coordinate.longitude);
}


@end
