//
//  ViewController.m
//  NSCacheDemo
//
//  Created by FM-MAC5 on 13/03/19.
//  Copyright © 2019 FM-MAC5. All rights reserved.
//

#import "ViewController.h"
static ViewController *sharedInstance;
@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIImageView *imgView;

@property (nonatomic, strong) NSCache *imageCache;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _imageCache = [[NSCache alloc]init];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"googlelogo_color_272x92dp"]] ;
  
    [self cacheImage:imageView.image forKey:@"img"];
    _imgView.image = [self getCachedImageForKey:@"img"];
}

+ (ViewController*)sharedInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[ViewController alloc] init];
    });
    return sharedInstance;
}
- (instancetype)init {
    self = [super init];
    if (self) {
        self.imageCache = [[NSCache alloc] init];
    }
    return self;
}

- (void)cacheImage:(UIImage*)image forKey:(NSString*)key {
    [self.imageCache setObject:image forKey:key];
}

- (UIImage*)getCachedImageForKey:(NSString*)key {
    
    return [self.imageCache objectForKey:key];
    
}
@end

