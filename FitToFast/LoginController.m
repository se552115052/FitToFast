
#import "LoginController.h"
#import "ViewController.h"

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
    @try {
        
        if([username isEqualToString:@""] || [password isEqualToString:@""] ) {
            
            [self alertStatus:@"Sign in Failed." :@"Error!" :0];
            
        } else {
            
            

            NSString *post =[[NSString alloc] initWithFormat:@"username=%@&password=%@",username,password];
            NSLog(@"PostData: %@",post);
            
            NSURL *url=[NSURL URLWithString:@"http://fittofast.mrrkh.com/user.php"];
            
            NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
            
            NSString *postLength = [NSString stringWithFormat:@"%lu", (unsigned long)[postData length]];
            
            NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
            [request setURL:url];
            [request setHTTPMethod:@"POST"];
            [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
            [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
            [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
            [request setHTTPBody:postData];
            
            
            NSError *error = [[NSError alloc] init];
            NSHTTPURLResponse *response = nil;
            NSData *urlData=[NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
            
            NSLog(@"Response code: %ld", (long)[response statusCode]);
            
            if ([response statusCode] >= 200 && [response statusCode] < 300)
            {
                NSString *responseData = [[NSString alloc]initWithData:urlData encoding:NSUTF8StringEncoding];
                NSLog(@"Response ==> %@", responseData);
                
                NSArray* foo = [responseData componentsSeparatedByString: @"&&"];
                NSString* result = [foo objectAtIndex: 1];
                
                
                
                if([result isEqualToString:@"Correct"]){
                    NSLog(@"result %@",result);
                
                    //session
                    
                    NSLog(@"usrname post %@",username);
                    
                    NSUserDefaults *session = [NSUserDefaults standardUserDefaults];
                    [session setObject:username forKey:@"session_username"];
                    
                    NSLog(@"usrname session post %@",session);

                    
                    
                    return true;
                }else if([result isEqualToString:@"Incorrect!"]){
                    
                    return false;
                }
                
                
            }
            
         
            
        }
    }
    @catch (NSException * e) {
        NSLog(@"Exception: %@", e);
        [self alertStatus:@"Sign in Failed." :@"Error!" :0];
    }
    if (success) {
        [self performSegueWithIdentifier:@"login_success" sender:self];
    }
    return false;

}

- (IBAction)signininClicked:(id)sender {
    
    
    if([self login:[txtUsername text] password:[txtPassword text]]==true){
              ViewController *viewController= [self.storyboard instantiateViewControllerWithIdentifier:@"mainView"];
        [self presentModalViewController:viewController animated:NO];

    }else{
        [self alertStatus:@"Sign in Failed." :@"Error!" :0];
    }
    
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
