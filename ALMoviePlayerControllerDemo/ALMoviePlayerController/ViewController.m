//
//  ViewController.m
//  ALMoviePlayerController
//
//  Created by Anthony Lobianco on 10/8/13.
//  Copyright (c) 2013 Anthony Lobianco. All rights reserved.
//

#import "ViewController.h"
#import "ALMoviePlayerController.h"

@interface ViewController () <ALMoviePlayerControllerDelegate, ALMoviePlayerControlsDelegate>

@property (nonatomic, strong) ALMoviePlayerController *moviePlayer;

@end

@implementation ViewController

- (id)init {
    self = [super init];
    if (self) {
        self.title = NSLocalizedString(@"ALMoviePlayerController", @"ALMoviePlayerController");
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //create a player
    self.moviePlayer = [[ALMoviePlayerController alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    self.moviePlayer.view.alpha = 0.f;
    self.moviePlayer.delegate = self; //IMPORTANT!
    
    //create the controls
    ALMoviePlayerControls *movieControls = [[ALMoviePlayerControls alloc] initWithMoviePlayer:self.moviePlayer style:ALMoviePlayerControlsStyleDefault];

    [movieControls setBarColor:[UIColor colorWithWhite:0.5 alpha:0.2]];
    [movieControls setTimeRemainingDecrements:YES];
    [movieControls setBarHeight:100.f];
    
    [movieControls setDelegate:self];
    
   // [movieControls.cancelButton addTarget:self action:@selector(didCancel:) forControlEvents:UIControlEventTouchUpInside];
   // [movieControls.chooseButton addTarget:self action:@selector(didChoose:) forControlEvents:UIControlEventTouchUpInside];
    
    //assign controls
    [self.moviePlayer setControls:movieControls];
    
    //THEN set contentURL   
    [self remoteFile];
    
    [self.moviePlayer setFullscreen:YES];
}

//these files are in the public domain and no longer have property rights
- (void)localFile {
    [self.moviePlayer stop];
    [self.moviePlayer setContentURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"popeye" ofType:@"mp4"]]];
    [self.moviePlayer play];
}

- (void)remoteFile {
    [self.moviePlayer stop];
    [self.moviePlayer setContentURL:[NSURL URLWithString:@"http://archive.org/download/WaltDisneyCartoons-MickeyMouseMinnieMouseDonaldDuckGoofyAndPluto/WaltDisneyCartoons-MickeyMouseMinnieMouseDonaldDuckGoofyAndPluto-HawaiianHoliday1937-Video.mp4"]];
    [self.moviePlayer play];
}

- (void)movieTimedOut {
    NSLog(@"MOVIE TIMED OUT");
}

- (void)moviePlayerWillMoveFromWindow
{
    
}


- (void)didCancel
{
    NSLog(@"didCancel");
}

- (void)didChoose
{
    NSLog(@"didChoose");
}

@end
