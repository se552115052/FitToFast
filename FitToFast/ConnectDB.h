

#import <UIKit/UIKit.h>
#import "SQLClient.h"

@interface ConnectDB : UIViewController <SQLClientDelegate>
{
    
    NSArray *productInfo;
    NSString *userInfoForWeb;
    NSString *userInfoForMobile;
    NSString *insertUserInfoForMobile;
    NSArray *viewUserModel;
    NSString *insertUserModel;
    NSString *updateUserModel;

}

@property (retain, nonatomic) NSString *receiveUsername;

-(NSArray *)viewListProduct;
-(NSString *)viewUserForWeb:(NSString *)username password:(NSString *)password;
-(NSString *)viewUserForMobile:(NSString *)username password:(NSString *)password;
-(NSString *)insertUserForMobile:(NSString *)username password:(NSString *)password firstname:(NSString *)firstname lassname:(NSString *)lassname;
-(NSArray *)viewModel:(NSString *)username;
-(NSString *)insertModel:(NSString *)username gender:(NSString *)gender shoulderSize:(NSInteger *)shoulderSize bustSize:(NSInteger *)bustSize hipSize:(NSInteger *)hipSize;
-(NSString *)updateModel:(NSString *)username gender:(NSString *)gender shoulderSize:(NSInteger *)shoulderSize bustSize:(NSInteger *)bustSize hipSize:(NSInteger *)hipSize;


@end
