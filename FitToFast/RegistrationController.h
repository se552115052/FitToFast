

#import <UIKit/UIKit.h>

@interface RegistrationController : UIViewController<UITextFieldDelegate>
{
    
    IBOutlet UITextField *txtUsername;
    IBOutlet UITextField *txtPassword;
    IBOutlet UITextField *txtRePassword;
    IBOutlet UITextField *txtFirstname;
    IBOutlet UITextField *txtLastname;
    
      NSString *userStatus;
}
- (IBAction)backgroundTap:(id)sender;
- (NSString *)insertUser;
@property (weak, nonatomic) IBOutlet UIButton *saveUser;



@end
