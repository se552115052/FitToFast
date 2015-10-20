

#import <UIKit/UIKit.h>

@interface RegistrationController : UIViewController<UITextFieldDelegate>
{
    
    IBOutlet UITextField *txtUsername;
    IBOutlet UITextField *txtPassword;
    IBOutlet UITextField *txtRePassword;
    IBOutlet UITextField *txtFirstname;
    IBOutlet UITextField *txtLastname;
    
    //ในดาต้าเบสมีช่อง status ถ้าregisในนี้จะบังคับให้เปน customer หมด
    // ในไฟล์ insert ไม่มี user id
    NSString *userStatus;
}
- (IBAction)backgroundTap:(id)sender;
- (NSString *)insertUser;
@property (weak, nonatomic) IBOutlet UIButton *saveUser;



@end
