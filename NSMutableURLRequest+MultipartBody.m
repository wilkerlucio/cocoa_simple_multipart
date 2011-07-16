//
//  NSMutableURLRequest+MultipartBody.m
//  Subtitle Master
//
//  Created by Wilker Lúcio da Silva on 7/15/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "NSMutableURLRequest+MultipartBody.h"

@implementation NSMutableURLRequest (NSMutableURLRequest_MultipartBody)

- (void)addMultipartDataToBody:(NSData *)data fieldName:(NSString *)fieldName fileName:(NSString *)fileName contentType:(NSString *)contentType
{
    NSMutableString *header = [NSMutableString string];
    NSMutableString *footer = [NSMutableString string];
    NSMutableData *partData = [NSMutableData dataWithData:[self HTTPBody]];
    
    [header appendFormat:@"--%@\r\n", kDefaultBoundary];
    [header appendFormat:@"Content-Disposition: form-data; name=\"%@\"; filename=\"%@\"\r\n", fieldName, fileName];
    [header appendFormat:@"Content-Length: %d\r\n", (int) [data length]];
    [header appendFormat:@"Content-Type: %@\r\n", contentType];
    [header appendFormat:@"Content-Transfer-Encoding: binary\r\n"];
    [header appendString:@"\r\n"];
    
    [footer appendString:@"\r\n"];
    [footer appendFormat:@"--%@--\r\n\r\n", kDefaultBoundary];
    
    [partData appendData:[header dataUsingEncoding:NSASCIIStringEncoding]];
    [partData appendData:data];
    [partData appendData:[footer dataUsingEncoding:NSASCIIStringEncoding]];
    
    [self setHTTPBody:partData];
    
    // ensure multipart details
    NSString *requestContentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@", kDefaultBoundary];
    
    [self setHTTPMethod:@"POST"];
    [self setValue:requestContentType forHTTPHeaderField:@"Content-Type"];
    [self setValue:[NSString stringWithFormat:@"%d", (int) [partData length]] forHTTPHeaderField:@"Content-Length"];
}

@end
