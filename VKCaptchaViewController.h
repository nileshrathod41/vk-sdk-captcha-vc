//
//  VKCaptchaViewController.h
//
//  Created by Sergey Armodin on 01.11.13.
//
//

#import <UIKit/UIKit.h>

@protocol VKCaptchaVCDelegate <NSObject>
- (void)captchaEnteredWithValue:(NSString *) captchaValue;
@end

@interface VKCaptchaViewController : UIViewController <VKCaptchaVCDelegate> {
	IBOutlet UIImageView *captchaImg;
	IBOutlet UITextField *captchaTxt;
}

@property (nonatomic, weak) id <VKCaptchaVCDelegate> delegate;
@property (nonatomic, strong) UIImageView *captchaImg;

- (IBAction)close;
- (IBAction)ok;

@end
