
#import <UIKit/UIKit.h>

@interface LoginController : UIViewController <UITextFieldDelegate>

{
    
    NSString *usrname;
    NSString *password;
    
    NSMutableArray *myObject;
    NSDictionary *dictionary;
}

@property (weak, nonatomic) IBOutlet UITextField *txtUsername;
@property (weak, nonatomic) IBOutlet UITextField *txtPassword;

- (IBAction)signininClicked:(id)sender;
- (IBAction)backgroundTap:(id)sender;

-(BOOL)login:(NSString *)username password:(NSString *)password;

extern NSString *session_username;

@end
