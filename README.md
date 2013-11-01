#Vkontakte iOS SDK UIViewController for captcha example

UIViewController for working with VK captcha using Vkontakte iOS SDK. Earlier it could be realized via UIAlertView, but in iOS 7 adding subviews in UIAlertView was deprecated.

Vkontakte iOS SDK [repo](https://github.com/AndrewShmig/Vkontakte-iOS-SDK-LV).

#Code Example
RootViewController.h
<pre><code>
#import "VKCaptchaViewController.h"
@interface RootViewController : UIViewController &lt;VKConnectorDelegate, VKRequestDelegate, VKCaptchaVCProtocol&gt; {
	NSString *captchaSessionId;
}
</code></pre>

RootViewController.m

#pragma mark - VKConnectorDelegate
<pre><code>
- (void)VKRequest:(VKRequest *)request captchaSid:(NSString *)captchaSid captchaImage:(NSString *)captchaImage {
	
	if ( captchaSessionId == nil ) {
		captchaSessionId = captchaSid;
		[self getCaptchaWithUrl:captchaImage];
	}
}

- (void)getCaptchaWithUrl:(NSString *)captcha_img {
	
	VKCaptchaViewController *captchaView = [[VKCaptchaViewController alloc] init];
	captchaView.delegate = self;
		
	[self presentViewController:captchaView animated:YES completion:^() {
		captchaView.captchaImg.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:captcha_img]]];
	}];
}

- (void)captchaEnteredWithValue:(NSString *)captchaValue {
	/* your code, for example: */
	VKRequestManager *rm = [[VKRequestManager alloc] initWithDelegate:self user:[VKUser currentUser]];
	rm wallPost:@{
	   @"owner_id": @([VKUser currentUser].accessToken.userID),
	   @"message" : @"I wrestled this captcha!",
	   @"captcha_sid" : captchaSessionId,
	   @"captcha_key" : captchaText
	}];
}
</code></pre>

#Screenshot
![UIViewController for captcha example](http://arm1.ru/img/uploaded/vk-sdk-captcha-uiviewcontroller.png "Screenshot")


