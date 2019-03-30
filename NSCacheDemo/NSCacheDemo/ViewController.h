//
//  ViewController.h
//  NSCacheDemo
//
//  Created by FM-MAC5 on 13/03/19.
//  Copyright © 2019 FM-MAC5. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
+ (ViewController*)sharedInstance;
// set
- (void)cacheImage:(UIImage*)image forKey:(NSString*)key;
// get
- (UIImage*)getCachedImageForKey:(NSString*)key;

@end

