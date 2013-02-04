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

## Ideas

Here are a couple of possible fun/educational ways one could modify this project:

* Add paginated results to the photo list view (by modifying CSPhotosAPIClient and CSPhotosViewController).
* Add the ability to search Flickr for a specific tag (or tags) using [UISearchDisplayController](http://developer.apple.com/library/ios/#documentation/uikit/reference/UISearchDisplayController_Class/Reference/Reference.html).
* Add more aggressive image caching for a better offline viewing experience.
* Add [Core Data](http://developer.apple.com/library/ios/#documentation/cocoa/Conceptual/CoreData/cdProgrammingGuide.html) for photo metadata persistence and background API response importing for improved UI performance.
* Display additional information about the photos, and about the users who posted them.
* Change the layout properties of the collection view in CSPhotosViewController (by subclassing [UICollectionViewLayout](http://developer.apple.com/library/ios/#documentation/uikit/reference/UICollectionViewLayout_class/Reference/Reference.html)).
* Use an entirely different photos API (like [Facebook](https://developers.facebook.com/docs/reference/api/photo/)).

## Links

<H3>Flickr</H3>
<ul>
<li><A HREF="http://www.flickr.com/services/apps/create/apply">Create an App</A></li>
<li><A HREF="http://www.flickr.com/services/api/">API Documentation</A></li>
<li><A HREF="http://www.flickr.com/services/apps/by/me">Apps by You</A></li>
</ul>
    
<H3>Code</H3>
<ul>
<li><strong><A HREF="https://github.com/cspickert/photos-ios">Photos</A> - this project</strong></li>
<li><A HREF="https://github.com/AFNetworking/AFNetworking">AFNetworking</A> - the most popular (and best) open source Objective-C HTTP library</li>
<li><A HREF="https://github.com/nothingmagical/cheddar-ios">Cheddar for iOS</A> - a commercial todo app that uses AFNetworking and Core Data</li>
<li><A HREF="https://github.com/soffes/sskeychain">SSKeychain</A> - an Objective-C wrapper for iOS and OS X keychain services</li>
<li><A HREF="https://github.com/ReactiveCocoa/ReactiveCocoa">ReactiveCocoa</A> - functional reactive programming for Objective-C</li>
<li><A HREF="https://github.com/Shopify/superdb">SuperDB</A> - a dynamic remote debugger for iOS apps</li>
<li><A HREF="https://github.com/square/PonyDebugger">PonyDebugger</A> - a remote debugger for iOS apps that uses the WebKit inspector</li>
<li><A HREF="https://github.com/gabriel/gh-unit">GHUnit</A> - additions to the standard unit testing frameworks</li>
<li><A HREF="https://github.com/jverkoey/nimbus">Nimbus</A> - a well-maintained kitchen sink library</li>
<li><A HREF="https://github.com/facebook/three20">Three20</A> - a poorly maintained kitchen sink library</li>
<li><A HREF="https://github.com/CocoaPods/CocoaPods">CocoaPods</A> - a package manager for third party iOS libraries and frameworks</li>
</ul>

<H3>Blogs &amp; Newsletters</H3>
<ul>

<li><H3>Objective-C</H3>
<ul>
	<li><A HREF="http://nshipster.com/">NSHipster</A> - informative and easy-to-read articles about Objective-C and Apple frameworks</li>
	<li><A HREF="http://www.mikeash.com/pyblog/">NSBlog</A> - weekly deep dives into the Objective-C runtime and reverse engineering Apple frameworks</li>
	<li><A HREF="http://www.cocoawithlove.com/">Cocoa with Love</A> - inactive, but a great archive of useful articles about iOS and Mac development</li>
	<li><A HREF="http://iosdevweekly.com/">iOS Dev Weekly</A> - well-curated weekly newsletter covering current events in iOS development</li>
	<li><A HREF="http://www.cimgf.com/">Cocoa Is My Girlfriend</A> - well-written how-to articles on iOS and Mac development</li>
	<li><A HREF="http://funwithobjc.tumblr.com/">Fun with Objective-C</A> - insightful articles on design patterns and frameworks by an Apple engineer</li>
	<li><A HREF="http://iosunittesting.com/">iOS Unit Testing</A> - a blog purely dedicated to unit testing on iOS</li>
</ul><br/></li>

<li><H3>People</H3>
<ul>
	<li><A HREF="http://inessential.com/">inessential</A> - Brent Simmons</li>
	<li><A HREF="http://www.marco.org/">Marco.org</A> - Marco Arment</li>
	<li><A HREF="http://daringfireball.net/">Daring Fireball</A> - John Gruber</li>
	<li><A HREF="http://shapeof.com/">The Shape of Everything</A> - Gus Mueller</li>
	<li><A HREF="http://kickingbear.com/blog/">kickingbear</A> - Guy English</li>
	<li><A HREF="http://mjtsai.com/blog/">Michael Tsai</A> - Michael Tsai</li>
	<li><A HREF="http://prog21.dadgum.com/">Programming in the 21st Century</A> - James Hague (not an iOS/Mac dev, but writes great essays)</li>
</ul></li>

</ul>
