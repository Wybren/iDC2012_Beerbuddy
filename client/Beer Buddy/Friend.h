//
//  Friend.h
//  Beer Buddy
//
//  Created by Paul Wagener on 21-07-12.
//  Copyright (c) 2012 Paul Wagener. All rights reserved.
//

#import <MapKit/MapKit.h>

@interface Friend : NSObject<MKAnnotation> {
    @public
    NSString *name;
    NSString *near;
}

- (id) initWithDictionary:(NSDictionary*)dictionary;
@end
