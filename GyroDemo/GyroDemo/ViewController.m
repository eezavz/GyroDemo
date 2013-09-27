//
//  ViewController.m
//  GyroDemo
//
//  Created by ManIkWeet on 27-09-13.
//  Copyright (c) 2013 Groep1. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize accelerationX;
@synthesize accelerationY;
@synthesize accelerationZ;
@synthesize rollLabel;
@synthesize pitchLabel;
@synthesize yawLabel;

#define degrees(x) (100 * x / M_PI)

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    motionManager = [[CMMotionManager alloc]init];
    motionManager.deviceMotionUpdateInterval = 1/60;
    [motionManager startDeviceMotionUpdates];
    
    timer = [NSTimer scheduledTimerWithTimeInterval:1/60 target:self selector:@selector(read) userInfo:nil repeats:YES];
    
    if([motionManager isGyroAvailable])
    {
        if([motionManager isGyroActive])
        {
            [motionManager setGyroUpdateInterval:.1];
            [motionManager startGyroUpdatesToQueue:[NSOperationQueue mainQueue] withHandler:^(CMGyroData * gyroData, NSError *error){
                NSString *x = [[NSString alloc]initWithFormat:@"%.02f", gyroData.rotationRate.x];
                accelerationX.text = x;
                
                NSString *y = [[NSString alloc]initWithFormat:@"%.02f", gyroData.rotationRate.y];
                accelerationY.text = y;
                
                NSString *z = [[NSString alloc]initWithFormat:@"%.02f", gyroData.rotationRate.z];
                accelerationZ.text = z;
            }];
        }
    }else{
        UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"NO GYRO" message:@"Get A GYRO" delegate:self cancelButtonTitle:@"DONE" otherButtonTitles:nil];
        [alert show];
    }
	// Do any additional setup after loading the view, typically from a nib.
}

-(void)read
{
    CMAttitude *attitude;
    CMDeviceMotion *motion = motionManager.deviceMotion;
    attitude = motion.attitude;
    
    NSString *yaw = [NSString stringWithFormat:@"YawL %f", degrees(attitude.yaw)];
    yawLabel.text = yaw;
    
    NSString *pitch = [NSString stringWithFormat:@"YawL %f", degrees(attitude.pitch)];
    pitchLabel.text = pitch;
    
    NSString *roll = [NSString stringWithFormat:@"YawL %f", degrees(attitude.roll)];
    rollLabel.text = roll;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
