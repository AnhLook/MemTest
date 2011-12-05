README for MemTest
Created by Anh Look (look@looksys.com)
Last edited: 12/5/11

This is a simple demo to show how to create a multi-view iOS app where you will switch from one view to another using UIButtons that are part of the root view instead of the usual UINavigationBar.

Reason:  There are certain apps where you may want buttons with custom graphics to match the theme and style of your app.  UINavigationBar does not look good for this type of app necessarily.  My own app 'Puppy Loves You' is a good example of this.  In fact, this basic design is what I used to create 'Puppy Loves You'.

In this sample code, I did not provide custom art for the 2 UIButtons labeled '1' and '2'.  You can supply your own artwork and use Interface Builder to map them onto the buttons.

I put in a lot of comments to show how memory management works with instance variables that have 'retain' property.  Also, note the comments around string processing in AppData.m and ImageFormViewController.m.

Have fun and send me feedback if you have any.










