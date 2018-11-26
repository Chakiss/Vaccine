//
//  AnnouceViewController.m
//  Vaccine
//
//  Created by CHAKRIT PANIAM on 4/9/2561 BE.
//  Copyright © 2561 Admire. All rights reserved.
//

#import "AnnouceViewController.h"
#import <AVFoundation/AVFoundation.h>
#import <AVKit/AVKit.h>

@interface AnnouceViewController ()

@end

@implementation AnnouceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showVideo:)];
    [self.view addGestureRecognizer:tapGesture];
}


- (void)showVideo:(id)sender {
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"video" ofType:@"m4v"];
    NSURL *videoURL = [NSURL fileURLWithPath:filePath];
    //filePath may be from the Bundle or from the Saved file Directory, it is just the path for the video
    AVPlayer *player = [AVPlayer playerWithURL:videoURL];
    AVPlayerViewController *playerViewController = [AVPlayerViewController new];
    playerViewController.player = player;
    //[playerViewController.player play];//Used to Play On start
    [self presentViewController:playerViewController animated:YES completion:nil];
}
-(NSString *)documentsDirectory{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    return documentsDirectory;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    
     //[self.customToolBar setWhiteButton];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleDefault;
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
