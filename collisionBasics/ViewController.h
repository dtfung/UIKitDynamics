//
//  ViewController.h
//  collisionBasics
//
//  Created by Donald Fung on 7/21/15.
//  Copyright (c) 2015 Donald Fung. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UICollisionBehaviorDelegate, UIAlertViewDelegate>

@property (strong, nonatomic) IBOutlet UIImageView *ball1;
@property (strong, nonatomic) IBOutlet UIImageView *ball2;
@property (strong, nonatomic) IBOutlet UIImageView *ball3;

@property (strong, nonatomic) IBOutlet UIImageView *player;
@property (nonatomic, strong) UIPushBehavior *pusher;
@property (strong, nonatomic) UIDynamicAnimator *animator;
@property (nonatomic, strong) UICollisionBehavior *collision;
@property (nonatomic, strong) UICollisionBehavior *gameOver;
@property (nonatomic, strong) UIDynamicItemBehavior *ballDynamicProperties;
@property (nonatomic, strong) UIDynamicItemBehavior *playerDynamicProperties;
@property (nonatomic, strong) UIDynamicItemBehavior *rockDynamicProperties;
@property (nonatomic, strong) UIAttachmentBehavior *attach;



@end
