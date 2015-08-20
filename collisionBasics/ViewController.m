//
//  ViewController.m
//  collisionBasics
//
//  Created by Donald Fung on 7/21/15.
//  Copyright (c) 2015 Donald Fung. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self Behavior];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)Behavior {
    
    //add a push
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    self.pusher = [[UIPushBehavior alloc]initWithItems:@[self.ball1, self.ball2, self.ball3] mode:UIPushBehaviorModeContinuous];
    self.pusher.pushDirection = CGVectorMake(1.0, 1.0);
    self.pusher.active = YES;
    [self.animator addBehavior:self.pusher];
    
    //add collisions
    self.collision = [[UICollisionBehavior alloc] initWithItems:@[self.ball1, self.ball2, self.ball3, self.player]];
    self.collision.collisionDelegate = self;
    self.collision.collisionMode = UICollisionBehaviorModeEverything;
    self.collision.translatesReferenceBoundsIntoBoundary = YES;
    [self.animator addBehavior:self.collision];
    

    //remove rotation
    self.ballDynamicProperties = [[UIDynamicItemBehavior alloc] initWithItems:@[self.ball1, self.ball2, self.ball3]];
    self.ballDynamicProperties.allowsRotation = NO;
    // Better collisions, no friction
    self.ballDynamicProperties.elasticity = 1;
    self.ballDynamicProperties.friction = 0.0;
    self.ballDynamicProperties.resistance = 0.0;
    [self.animator addBehavior:self.ballDynamicProperties];
    
    
    self.playerDynamicProperties = [[UIDynamicItemBehavior alloc] initWithItems:@[self.player]];
    self.playerDynamicProperties.allowsRotation = NO;
    self.playerDynamicProperties.density = 100.0f;
    [self.animator addBehavior:self.playerDynamicProperties];
    
    //Move player
    self.attach =
    [[UIAttachmentBehavior alloc]
     initWithItem:self.player
     attachedToAnchor:CGPointMake(CGRectGetMidX(self.player.frame),
                                  CGRectGetMidY(self.player.frame))];
    
    [self.animator addBehavior:self.attach];

    
}

- (IBAction)displayGestureForTapRecognizer:(UITapGestureRecognizer *)recognizer {

    self.attach.anchorPoint = [recognizer locationInView:self.view];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
