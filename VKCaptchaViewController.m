//
//  VKCaptchaViewController.m
//
//  Created by Sergey Armodin on 01.11.13.
//
//

#import "VKCaptchaViewController.h"

@interface VKCaptchaViewController ()

@end

@implementation VKCaptchaViewController
@synthesize captchaImg;

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
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)captchaEnteredWithValue:(NSString *)captchaValue {}


- (void)close {
	[self dismissViewControllerAnimated:YES completion:nil];
}

- (void)ok {
	
	[self dismissViewControllerAnimated:YES completion:^() {
		[self.delegate captchaEnteredWithValue:captchaTxt.text];
	}];
}

@end
