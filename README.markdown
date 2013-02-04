# Photos

A sample iOS project for ADI DevFest 2013.

## Requirements

This project uses features only available in iOS 6+. Make sure you have the latest version of Xcode and the iOS SDK installed.

## Configuration

1. Register for a [Flickr API key](http://www.flickr.com/services/apps/create/).
2. Create a new file at Photos/CSPhotosAPIClientConstants.m with the following contents:
    
        #import "CSPhotosAPIClientConstants.h"
        NSString *const kCSPhotosAPIKey = @"<your API key here>";
3. Build and run!
