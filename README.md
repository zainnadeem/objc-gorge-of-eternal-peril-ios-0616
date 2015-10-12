# The Gorge of Eternal Peril

## Objectives

1. Connect a series of view controllers with *show* segues.
2. Embed a stack of view controllers in a navigation controller.
3. Modally present a view controller.
4. Create an IBAction to dismiss the modal view controller.

## Segues

To allow your user to navigate between view controllers, a path between them called a **segue** (pronounced "seg-way") can be created in your storyboard. Of the segues in Interface Builder, the most commonly used are the *show* segue and the *present modally* segue.

Outside the context of a navigation controller, these two segues function identically -- they both present the destination view controller modally. A **modal** is a view that is presented at the very front of the user interface, thereby temporarily blocking interation with the rest of the app. [Apple's Human Interface Guidelines](https://developer.apple.com/library/ios/documentation/UserExperience/Conceptual/MobileHIG/Modal.html#//apple_ref/doc/uid/TP40006556-CH64-SW1) suggest that modals are only appropriate when getting the user's attention or completing a short, self-contained task.

For sections of your app or longer-lived tasks, iOS provides a few non-modal ways to link together view controllers. The simplest of those is a `UINavigationController`.

## `UINavigationController`

A navigation controller is special view controller that provides a navigation toolbar at the top of the screen and *contains and manages* a stack of view controllers. The navigation controller automatically provides a back button when there is more than one view controller in its stack.

In the context of a navigation controller, the *show* and *modal* segues act quite differently. A *show* segue adds the destination view controller to the top of the navigation stack, while a *modal* segue still presents the destination view controller modally, over all views in the navigation controller.

## Dismissing a Modally Presented View Controller

You will notice that when modally presenting a view controller, the destination view controller loads on top of the navigation controller, making its controls inaccessible. For this reason, you need to be careful to provide the user with an interface to dismiss the modally presented view controller. Otherwise your user will get stuck in that view controller until restarting your app!

Modally presented view controllers are typically reserved for interactions which require user input, such as filling out the information fields when adding a contact to the phone book. It's common practice to provide the user with two options for dismissing a modal, a "cancel" button which escapes the modally presented view controller without taking action, and a "submit" button which accepts the information given by the user.

Dismissing a view controller, however, **cannot be done entirely in the Storyboard**. An IBAction must be set up that provides the user with a button that calls the `dismissViewControllerAnimated:completion:` method on `self` (since `self` refers to the current view controller). This allows the user to escape the view controller. 

**Top-tip:** *A modally presented view controller with no option for escape will require the user to close and restart your application. Always provide an option to dismiss a view controller accessed through a* present modally *segue.*

## Instructions

Open the `objc-gorge-of-eternal-peril.xcworkspace` and navigate to the `Main.storyboard` file.

You should see a stack of view controllers already set up for you:

![](https://curriculum-content.s3.amazonaws.com/ios-segues-and-nav-controllers-unit/gorge_initial.png)

Run the program with `⌘` `R`. Notice that there's no way to get to the other view controllers from the initial one. How do we allow a user to move between them?

#### *Show* Segues

Go back to the storyboard. Add a show segue between the first two view controllers in the stack: select the button which reads `Ask me the questions, Bridgekeeper.` and `control`+`drag` a line to the second view controller containing the question `What is your name?`. Select *show* in the menu that pops up and a show segue will be created between this button and the next view controller.

![](https://curriculum-content.s3.amazonaws.com/ios-segues-and-nav-controllers-unit/gorge_show_segue.png)

Run the program again with `⌘` `R`. Once the simulator loads, click on the button that you just connected with a segue. It should take you to the second view controller which is now the end of the road.

Return to the storyboard. Connect the remaining buttons to the next view controller in the stack:

  * The `Sir Lancelot of Camelot.` button should **show** the `What is your quest?` view controller.
  * The `I seek the Holy Grail.` button should **show** the `What is your favourite colour?` view controller.
  * The `Blue.` button should **show** the `Go on. Off you go.` view controller.

![](https://curriculum-content.s3.amazonaws.com/ios-segues-and-nav-controllers-unit/gorge_vc_stack.png)

Run the program again with `⌘` `R`. Click through the whole stack of view controllers. Notice how there's no way to go backwards unless we were to specifically add a `back` button to every view controller. Surely there's an easier way!

#### Embed in Navigation Controller

Let's put our stack of view controllers into a navigation controller. In the storyboard, select the initial view controller which is left-most in the stack and symbolized with the arrow facing into the left side of the view controller. Then in the Xcode taskbar, open the `Editor` menu, hover over the `Embed in >` sub-menu and select the `Navigation Controller` option. 

![](https://curriculum-content.s3.amazonaws.com/ios-segues-and-nav-controllers-unit/gorge_xcode_embed_navcon_menu.png)

This will insert a new `UINavigationController` that will inherit the initial view controller status and segue to the view controller that was selected. You'll see the placeholder bar for the navigation controller appear at the top of all of the view controllers now in its stack.

![](https://curriculum-content.s3.amazonaws.com/ios-segues-and-nav-controllers-unit/gorge_embedded_navcon.png)

Run the program again with `⌘` `R`. Click through the whole stack of view controllers. Notice how the navigation controller's bar appears over the view controllers in the stack and provides a `back` button starting with the second view controller?

#### *Present Modally* Segue

Now, use the `Yellow.` button on the "What is your favourite colour?" view controller to **present modally** the `FISGorgeOfEternalPerilViewController` with the label reading `AUUUGGGHH!!!!!!` placed above.

![](https://curriculum-content.s3.amazonaws.com/ios-segues-and-nav-controllers-unit/gorge_present_modally_segue.png)

Run the program again with `⌘` `R`. Click through the stack of view controllers until you can select the `Yellow.` button.

Select the `Yellow.` button. The navigation controller will not appear on this view controller and you will have no way to dismiss it.

#### Providing A Way Out

In order to provide the user with a way to escape a modally presented view controller, we can create a button that calls the `dismissViewControllerAnimated:completion:` method.

Add a button to the `FISGorgeOfEternalPerilViewController` in the Storyboard whose title reads `Accept your fate.`. 

![](https://curriculum-content.s3.amazonaws.com/ios-segues-and-nav-controllers-unit/gorge_accept_your_fate.png)

Link it to an action in `FISGorgeOfEternalPerilViewController.m`. Call the linked method `acceptYourFateTapped:`. In the implementation of this method, add a call of `dismissViewControllerAnimated:completion:` on `self` with `YES` passed into the `animated` argument and `nil` passed into the `completion` argument:

```objc
- (IBAction)acceptYourFateTapped:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
```

![](https://curriculum-content.s3.amazonaws.com/ios-segues-and-nav-controllers-unit/gorge_connect_IBAction.png)

Run the program again with `⌘` `R`. Click through the stack of view controllers until you can select the `Yellow.` button. Now when the Gorge of Eternal Peril comes into view, you can escape the view controller by pressing the `Accept your fate.` button.

![](https://curriculum-content.s3.amazonaws.com/ios-segues-and-nav-controllers-unit/gorge_final.png)

Now you're a monarch of segues:

![](https://curriculum-content.s3.amazonaws.com/ios-segues-and-nav-controllers-unit/how_do_you_know_segues_meme.jpeg)



