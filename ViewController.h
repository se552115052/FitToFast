

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{
    
    
    IBOutlet UIButton *logoutBtn;
    
    NSMutableArray *myObject;
    NSDictionary *dictionary;
    NSString *userId;
    NSString *username;
    NSString *gender;
    NSString *shoulderSize;
    NSString *bustSize;
    NSString *hipSize;
    
    
    NSString *userid_data;
    NSString *username_data;
    NSString *gender_data;
    NSString *shoulderSize_data;
    NSString *bustSize_data;
    NSString *hipSize_data;
    
  
}

@property (weak, nonatomic) IBOutlet UIButton *generateBtn;


@end
