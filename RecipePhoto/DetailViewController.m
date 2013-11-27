//
//  DetailViewController.m
//  Coaster Viewer
//
//  Created by Don Browning on 11/16/13.
//  Copyright (c) 2013 Don Browning. All rights reserved.
//

#import "DetailViewController.h"
#import "constants.h";

@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *photoName;
@property (weak, nonatomic) IBOutlet UIImageView *photo;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIImageView *ipadImageView;

@end

@implementation DetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Device Orientation notifications
    [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(orientationChanged:) name:UIDeviceOrientationDidChangeNotification object:nil];
    
	// Do any additional setup after loading the view.
    
    self.photoName.text = self.selectedImage.name;
    self.photo.image = [UIImage imageNamed:self.selectedImage.filename];
    
}

- (void)orientationChanged:(NSNotification *)notification {
    UIInterfaceOrientation current = [UIApplication sharedApplication].statusBarOrientation;

 
    CGRect frame;
    if((current == UIDeviceOrientationLandscapeLeft) ||
       (current == UIDeviceOrientationLandscapeRight))
    {
        if(IS_IPHONE) {
            frame = self.imageView.frame;
            frame.origin.x = 190;
            frame.origin.y = 70;
            frame.size.height = 230;
            frame.size.width = 230;
            self.imageView.frame = frame;
        } else {
            frame = self.ipadImageView.frame;
            frame.origin.x = 200;
            frame.origin.y = 100;
            frame.size.width = 650;
            frame.size.height = 650;
            self.ipadImageView.frame = frame;
        }
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidDisappear:(BOOL)animated{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [[UIDevice currentDevice] endGeneratingDeviceOrientationNotifications];
}
@end
