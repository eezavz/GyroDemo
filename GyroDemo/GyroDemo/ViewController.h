//
//  ViewController.h
//  GyroDemo
//
//  Created by ManIkWeet on 27-09-13.
//  Copyright (c) 2013 Groep1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>

@interface ViewController : UIViewController
{
    CMMotionManager * motionManager;
    //NSOperationQueue * operationQue;
    NSTimer * timer;
}

@property (retain, nonatomic) IBOutlet UILabel *
    accelerationX;
@property (retain, nonatomic) IBOutlet UILabel *
    accelerationY;
@property (retain, nonatomic) IBOutlet UILabel *
    accelerationZ;
@property (retain, nonatomic) IBOutlet UILabel *rollLabel;
@property (retain, nonatomic) IBOutlet UILabel * pitchLabel;
@property (retain, nonatomic) IBOutlet UILabel * yawLabel;
@property (retain, nonatomic) IBOutlet UILabel *accXLabel;
@property (retain, nonatomic) IBOutlet UILabel *accYLabel;
@property (retain, nonatomic) IBOutlet UILabel *accZLabel;
@end
