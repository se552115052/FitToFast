
#import "RegistrationController.h"
#import "LoginController.h"
@interface RegistrationController ()

@end

@implementation RegistrationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    
    
}

- (IBAction)saveUser:(id)sender {
    [self insertUser];
}

- (NSString *)insertUser{
    
    NSLog(@"ok" );
    NSInteger success = 0;
    NSString *re;
    @try {
        
            NSString *txtStatus = @"customer";
            
            NSLog(@"cusss %@",txtStatus);
            
            NSString *post =[[NSString alloc] initWithFormat:@"username=%@",[self->txtUsername text]];
            NSLog(@"PostData: %@",post);
            
            NSURL *url=[NSURL URLWithString:@"http://fittofast.mrrkh.com/checkUser.php"];
            
            NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
            
            NSString *postLength = [NSString stringWithFormat:@"%lu", (unsigned long)[postData length]];
            
            NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
            [request setURL:url];
            [request setHTTPMethod:@"POST"];
            [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
            [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
            [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
            [request setHTTPBody:postData];
            
            //[NSURLRequest setAllowsAnyHTTPSCertificate:YES forHost:[url host]];
            
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
                
                NSLog(@"result %@ ",result);
                
                if([result isEqualToString:@"notRepeat!!"]){
      //ckeck confirm password
                    if([[self->txtPassword text] isEqualToString: ([self->txtRePassword text]) ]) {
//insert
                        
                            NSString *txtStatus = @"customer";
                            
                            NSLog(@"cusss %@",txtStatus);
                            
                            NSString *post =[[NSString alloc] initWithFormat:@"username=%@&password=%@&fname=%@&lname=%@&status=%@",[self->txtUsername text],[self->txtPassword text],[self->txtFirstname text],[self->txtLastname text],txtStatus];
                            NSLog(@"PostData: %@",post);
                            
                            NSURL *url=[NSURL URLWithString:@"http://fittofast.mrrkh.com/insertRegis.php"];
                            
                            NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
                            
                            NSString *postLength = [NSString stringWithFormat:@"%lu", (unsigned long)[postData length]];
                            
                            NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
                            [request setURL:url];
                            [request setHTTPMethod:@"POST"];
                            [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
                            [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
                            [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
                            [request setHTTPBody:postData];
                            
                            //[NSURLRequest setAllowsAnyHTTPSCertificate:YES forHost:[url host]];
                            
                            NSError *error = [[NSError alloc] init];
                            NSHTTPURLResponse *response = nil;
                            NSData *urlData=[NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
                            
                            NSLog(@"Response code: %ld", (long)[response statusCode]);
                            
                            
                            LoginController *loginscene= [self.storyboard instantiateViewControllerWithIdentifier:@"loginscene"];
                            [self presentModalViewController:loginscene animated:NO];
                            
                            
                            if ([response statusCode] >= 200 && [response statusCode] < 300)
                            {
                                NSString *responseData = [[NSString alloc]initWithData:urlData encoding:NSUTF8StringEncoding];
                                NSLog(@"Response ==> %@", responseData);
                                
                                NSArray* foo = [responseData componentsSeparatedByString: @"&&"];
                                NSString* result = [foo objectAtIndex: 1];
                                
                                
                            }
                    
                    }
                    else{
                        [self alertStatus:@"Password doesn't match confirmation" :@"Form is invalid" :0];
                    }
                }
                else{
                    [self alertStatus:@"Username already exists " :@"Form is invalid" :0];
                }
                
            }
            
        }
    
    @catch (NSException * e) {
        NSLog(@"Exception: %@", e);
    }
    if (success) {
        [self performSegueWithIdentifier:@"login_success" sender:self];
    }
    
    return re;
    
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
