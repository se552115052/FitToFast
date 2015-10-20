
#import <UIKit/UIKit.h>
#import <sqlite3.h>

@interface ModelGenderController : UIViewController
{
    IBOutlet UIButton *btnMale;
    IBOutlet UIButton *btnFemale;
    
}
extern NSString *gender;

-(NSString *)getGenderModel;

@end
