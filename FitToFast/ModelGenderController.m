
#import "ModelGenderController.h"
#import "LoginController.h"

NSString *gender =@"";

@interface ModelGenderController ()

@end

@implementation ModelGenderController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"usrname signin = %@",session_username);

    
    }

- (IBAction)btnMale:(id)sender {
    gender = @"Male";
    [self getGenderModel];
    
}
- (IBAction)btnFemale:(id)sender {
    gender = @"Female";
    [self getGenderModel];
}

-(NSString *)getGenderModel{
    NSString *result;
    if([gender isEqualToString:@"Male"]){
        result = gender;
        NSLog(@"gender = %@",gender);
    }
    else if([gender isEqualToString:@"Female"]){
        result = gender;
        NSLog(@"gender = %@",gender);
    }
    return result;
}


@end
