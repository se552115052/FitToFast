

#import <UIKit/UIKit.h>
#import <SceneKit/SceneKit.h>

@interface HumanModelController : UIViewController<UITextFieldDelegate>{
   
    IBOutlet SCNView *sceneModel;
    IBOutlet UIButton *generateBtn;
    IBOutlet UILabel *modelLabel;
    IBOutlet UIButton *qrBtn;
    
    NSString * strShoulderSize;
    NSString * strBustSize;
    NSString * strHipSize;
    UIAlertView *alert;
    
    
    
    //check
    
    NSMutableArray *myObject;
    NSDictionary *dictionary;
    NSString *userId;
    NSString *username;
    NSString *genderModel;
    NSString *shoulderSizecheck;
    NSString *bustSizecheck;
    NSString *hipSizecheck;
    
    
    NSString *userid_data;
    NSString *username_data;
    NSString *gender_data;
    NSString *shoulderSize_data;
    NSString *bustSize_data;
    NSString *hipSize_data;
    }

- (IBAction)fitBtn:(id)sender;
- (IBAction)backgroundTap:(id)sender;


extern NSString *modelText;

-(int *)checkShoulderTextfield;
-(int *)checkBustTextfield;
-(int *)checkHipTextfield;
-(void)checkQrBtn;
-(NSString *)genderModel:(NSString *)genderText;
-(NSString *)generateHumanModel;
-(void)model:(NSString *)modelGen intS:(NSInteger *)intSh intH:(NSInteger *)intH;
-(void)createModelFromQR:(NSString *)modeldata;


@property (weak, nonatomic) IBOutlet UITextField *shoulderSize;
@property (weak, nonatomic) IBOutlet UITextField *bustSize;
@property (weak, nonatomic) IBOutlet UITextField *hipSize;

@property (nonatomic, assign) NSInteger intShoulder;
@property (nonatomic, assign) NSInteger intBust;
@property (nonatomic, assign) NSInteger intHip;

@property (strong, nonatomic) id resultQr;

@end

