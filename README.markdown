Cocoa Simple Multipart Post
===========================

This library provides a really simple implementation for Multipart Data for Cocoa `NSMutableURLRequest`.

Installation
------------

Just clone the repository and copy the files on your project.

Usage
-----

Here is a simple example on how to use this library:

```objc
#import "NSMutableURLRequest+MultipartBody.h"

NSData *fileData = [NSData dataWithContentsOfFile:@"myfile.jpg" options:NSDataReadingMapped | NSDataReadingUncached error:nil];
NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://some.site.com/upload"]];
[request addMultipartDataToBody:fileData fieldName:@"file" fileName:@"myfile.jpg" contentType:@"image/jpeg"]

NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
```
