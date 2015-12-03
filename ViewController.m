

#import "ViewController.h"
#import "LoginController.h"
#import "ModelGenderController.h"
#import "HumanController.h"
#import "SQLClient.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self alertLogin:@"You're now logged in." :@"Welcome!" :0];
    
    // session
    
    NSUserDefaults *get_session = [NSUserDefaults standardUserDefaults];
    session_username = [get_session stringForKey:@"session_username"];
    NSLog(@"username from login scene= %@",session_username);
    
}

- (IBAction)generateBtn:(id)sender {
    
    
    SQLClient* client = [SQLClient sharedInstance];
    client.delegate = self;
    
    [client connect:@"168.1.83.153:780" username:@"SukinoSenze_Athena" password:@"AthenaRanking!" database:@"SukinoSenze_Athena" completion:^(BOOL success) {
        
        if (success)
            
        {
            NSString *account = [NSString stringWithFormat:@"SELECT * FROM models  WHERE username = '%@'",session_username];
            
            NSLog(@" account %@",account);
            
            [client execute:account completion:^(NSArray* results) {
                     
                //มากกว่าคือ มี
                if([[results objectAtIndex:0] count]>0){
                    NSLog(@"not null ");
                    
                    HumanController *humanController= [self.storyboard instantiateViewControllerWithIdentifier:@"qrHuman"];
                    [self presentModalViewController:humanController animated:NO];
                    
                }else{
                    NSLog(@" null ");
                    ModelGenderController *modelGender= [self.storyboard instantiateViewControllerWithIdentifier:@"genderModel"];
                    [self presentModalViewController:modelGender animated:NO];
                  
                }
                
                
                
                [client disconnect];
                
            }];
            
        }else{
            
        }    [NSThread sleepForTimeInterval: 3];
        
        
    }];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)logoutBtn:(id)sender {
    
    [self alertLogout:@"You're now logged out." :@"" :0];
    
    

}


- (void) alertLogin:(NSString *)msg :(NSString *)title :(int) tag
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title
                                                        message:msg
                                                       delegate:self
                                              cancelButtonTitle:@"Ok"
                                              otherButtonTitles:nil, nil];
    
    
    alertView.tag = tag;
    [alertView show];
    
    
    
}


- (void) alertLogout:(NSString *)msg :(NSString *)title :(int) tag
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title
                                                        message:msg
                                                       delegate:self
                                              cancelButtonTitle:@"Ok"
                                              otherButtonTitles:nil, nil];
  
    LoginController *loginscene= [self.storyboard instantiateViewControllerWithIdentifier:@"loginscene"];
    [self presentModalViewController:loginscene animated:NO];
    
    
    alertView.tag = tag;
    [alertView show];
    
}

@end
