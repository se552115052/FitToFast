
#import <UIKit/UIKit.h>
#import <SceneKit/SceneKit.h>

@interface HumanController : UIViewController
{
    
    IBOutlet SCNView *sceneHuman;
    IBOutlet UIButton *fitBtn;
    IBOutlet UILabel *modelLabel;
    
    
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
    
    int *intShoulder;
    int *intHip;
    NSString *model;
    
}
@property (strong, nonatomic) id resultQr;

-(void)createModelFromQR:(NSString *)modeldata;
-(void)createModelFromServer:(NSString *)modelGen intShoulder:(NSInteger *)intShoulder intHip:(NSInteger *)intHip;


@end
