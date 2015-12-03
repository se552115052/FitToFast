
#import "LoginController.h"
#import "ViewController.h"
#import "SQLClient.h"

@interface LoginController ()

@end
NSString *session_username = @"";
   
@implementation LoginController

@synthesize txtUsername;
@synthesize txtPassword;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if(session_username){
        //Session Do
        NSLog(@"username in login scene= %@",session_username);
        
    }else{
        //Empty Session
 }

    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(BOOL)login:(NSString *)username password:(NSString *)password{
    
    NSInteger success = 0;
    NSString *userInfoForMobile;
    
        if([username isEqualToString:@""] || [password isEqualToString:@""] ) {
            
            [self alertStatus:@"Sign in Failed." :@"Error!" :0];
            
        } else {
            
            
            SQLClient* client = [SQLClient sharedInstance];
            client.delegate = self;
            
            [client connect:@"168.1.83.153:780" username:@"SukinoSenze_Athena" password:@"AthenaRanking!" database:@"SukinoSenze_Athena" completion:^(BOOL success) {
                
                if (success)
                    
                {
                    NSString *account = [NSString stringWithFormat:@"SELECT * FROM AspNetUsers WHERE UserName = '%@'",username];
                    
                    [client execute:account completion:^(NSArray* results) {
                        
                        NSString *status;
                        
                        if([[results objectAtIndex:0] count]>0){
                            NSUserDefaults *session = [NSUserDefaults standardUserDefaults];
                            [session setObject:username forKey:@"session_username"];
                            
                            ViewController *viewController= [self.storyboard instantiateViewControllerWithIdentifier:@"mainView"];
                            [self presentModalViewController:viewController animated:NO];

                        }else{
                            [self checkForMobile:username password:password];
                        }
                        
                        
                        NSLog(@"userInfo %@",userInfoForMobile);
                        
                        [client disconnect];
                        
                    }];
                    
                }else{
                    [self alertStatus:@"Sign in Failed." :@"Error!" :0];
                    
                }    [NSThread sleepForTimeInterval: 3];
                
                
            }];
            
        }

    return false;

}
-(void)checkForMobile:(NSString *)username password:(NSString *)password{
    
    
    SQLClient* client = [SQLClient sharedInstance];
    client.delegate = self;
    
    [client connect:@"168.1.83.153:780" username:@"SukinoSenze_Athena" password:@"AthenaRanking!" database:@"SukinoSenze_Athena" completion:^(BOOL success) {
        
        if (success)
            
        {
            NSString *account = [NSString stringWithFormat:@"SELECT * FROM UsersForMobiles WHERE username = '%@'",username];
            
            NSLog(@" account %@",account);
            
            [client execute:account completion:^(NSArray* results) {
                
                NSString *status;
                
                if([[results objectAtIndex:0] count]>0){
                    NSUserDefaults *session = [NSUserDefaults standardUserDefaults];
                    [session setObject:username forKey:@"session_username"];
                    
                    ViewController *viewController= [self.storyboard instantiateViewControllerWithIdentifier:@"mainView"];
                    [self presentModalViewController:viewController animated:NO];
                    
                }else{
                    
                }
                
                
                
                [client disconnect];
                
            }];
            
        }else{
            [self alertStatus:@"Sign in Failed." :@"Error!" :0];
            
        }    [NSThread sleepForTimeInterval: 3];
        
        
    }];
    
}
- (IBAction)signininClicked:(id)sender {
    
    [self login:[txtUsername text] password:[txtPassword text]];
    
    }

- (void) alertStatus:(NSString *)msg :(NSString *)title :(int) tag
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title
                                                        message:msg
                                                       delegate:self
                                              cancelButtonTitle:@"Ok"
                                              otherButtonTitles:nil, nil];
    alertView.tag = tag;
    [alertView show];
}

- (IBAction)backgroundTap:(id)sender {
    [self.view endEditing:YES];
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return  YES;
}
@end
