//
//  Login.m
//  RoutesGP
//
//  Created by albert moreno vendrell on 04/06/14.
//  Copyright (c) 2014 RoutesGP. All rights reserved.
//

#import "Login.h"

@implementation Login

+ (void)loginWidthMail:(NSString*)mail andPassword:(NSString*)password
{
    NSURLSessionConfiguration *configuracionConexion =  [NSURLSessionConfiguration defaultSessionConfiguration];
    configuracionConexion.timeoutIntervalForRequest = 10.0;
    configuracionConexion.timeoutIntervalForResource = 10.0;
    
    NSURLSession *conexionSession = [NSURLSession sessionWithConfiguration:configuracionConexion];
    
    NSURL *url = [NSURL URLWithString:@"http://bitstudio.es/clase"];
    NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:url];
    NSString *parametros = [NSString stringWithFormat:@"email=%@&password=%@", mail, password];
    [urlRequest setHTTPMethod:@"POST"];
    [urlRequest setHTTPBody:[parametros dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSURLSessionDataTask *dataTask = [conexionSession dataTaskWithRequest:urlRequest completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        NSDictionary *respuestaDictionary = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
        
        if (!error) {
            if ([[respuestaDictionary objectForKey:@"code"] isEqualToString:@"KO"]) {
                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Usuario no existe" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [alertView show];
            }
            else
            {
                //[self performSegueWithIdentifier:@"" sender:self];
            }
        } else {
            NSLog(@"%@", error);
        }
        
    }];
    
    [dataTask resume];
}

@end
