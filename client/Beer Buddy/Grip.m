//
//  Grip.m
//  Beer Buddy
//
//  Created by Paul Wagener on 21-07-12.
//  Copyright (c) 2012 Paul Wagener. All rights reserved.
//

#import "Grip.h"
#import "PreferencesViewController.h"

@implementation Grip


@synthesize But_MapList, But_Preferences, TitleImage; //TitleImage
//@synthesize contentDelegate;

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {

}

/**
 * Plaats grip & grafiek constant terwijl de gebruik aan het draggen is
 */
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:container];
    
    cover.frame = CGRectMake(cover.frame.origin.x, point.y-cover.frame.size.height, cover.frame.size.width, cover.frame.size.height);
    
    TitleImage.image = [UIImage imageNamed:@"goingout.png"];
}

/**
 * Plaats Grip & Grafiek op een juiste eindpositie na de drag van de gebruiker
 */
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    // Bepaal of grafiek zichtbaar moet worden of niet gebaseerd of gebruiker omhoog of omlaag aan het scrollen was
    UITouch *touch = [touches anyObject];
    const CGPoint location = [touch locationInView:self];
    const CGPoint previousLocation = [touch previousLocationInView:self];
    const CGFloat inertia = location.y - previousLocation.y;
    bool zichtbaar = inertia >= 0;
    CGFloat duration = 1.0/fabs(inertia);
    
    if(duration > 0.7)
        duration = 0.7;
    if(duration < 0.3)
        duration = 0.3;
    
    [UIView animateWithDuration:duration delay:0 options:UIViewAnimationCurveEaseOut animations:^ {
        cover.frame = CGRectMake(cover.frame.origin.x, zichtbaar ? 0 : self.frame.size.height - (cover.frame.size.height+50), cover.frame.size.width, cover.frame.size.height);
        
        if (cover.frame.origin.y < -50) {
            self.But_MapList.alpha = 1.0;
            self.But_Preferences.alpha = 1.0;
            
            TitleImage.image = [UIImage imageNamed:@"goinghome.png"];
        }else {
            self.But_MapList.alpha = 0.0;
            self.But_Preferences.alpha = 0.0;
            
            TitleImage.image = [UIImage imageNamed:@"goingout.png"];
        }
        
        
    } completion:nil];   
}


@end