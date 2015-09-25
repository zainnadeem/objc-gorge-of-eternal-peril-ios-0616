# Xcode: Segues
##### The Gorge of Eternal Peril

## Objectives

## Segues

To allow your user to navigate between view controllers, a path between them called a **segue** (pronounced "seg-way") can be created. There several kinds of segues that can be created. The most common types that we're going to discuss in the walkthrough are *show* segues and *present modally* segues.

**Note:** *These are the names for the adaptive segues used when size classes are enabled. The "push" and "modal" segues are conceptually the same but are deprecated because they predate size classes.* 

Outside the context of a navigation controller, these two segues appear to accomplish the same goal (presenting the next view controller to the user), however they work in different ways. A *show* segue adds the destination view controller to the top of the stack, while a *modal* segue presents the destination view controller at the very front of the user interface.

## `UINavigationController`

A navigation controller is special class the provides a navigation toolbar and *contains* a stack of view controllers that it manages. It handily provides a back button (along with a title label, subtitle label, and place for a `UIBarButtonItem`)

, the most common being the *show* segue which adds the next view controller on top of the one that links to it. When used in the context of a Navigation Controller, view controllers the accessed through show segues "stack up" under the Navigation Controller's jurisdiction.

## Instructions

Open the `objc-gorge-of-eternal-peril.xcworkspace` and navigate to the `Main.storyboard` file.

You should see a stack of view controllers already set up for you:

![] view controllers without a segue

Run the program with `⌘` `R`. Notice that there's no way to get to the other view controllers from the initial one. How do we allow a user to move between them?

#### *Show* Segues

Go back to the storyboard. Add a show segue between the first two view controllers in the stack: select the button which reads "Ask me the questions, Bridgekeeper." and drag a line to the second view controller containing the question "What is your name?". Select "show" in the menu that pops up and a show segue will be created between this button and the next view controller.

![] adds the first segue

Run the program again with `⌘` `R`. Once the simulator loads, click on the button that you just connected with a segue. It should take you to the second view controller which is now the end of the road.

Return to the storyboard. Connect the remaining buttons to the next view controller in the stack:

  * The `Sir Lancelot of Camelot.` button should **show** the `What is your quest?` view controller.
  * The `I seek the Holy Grail.` button should **show** the `What is your favourite colour?` view controller.
  * The `Blue.` button should **show** the `Go on. Off you go.` view controller.

Run the program again with `⌘` `R`. Click through the whole stack of view controllers. Notice how there's no way to go backwards unless were to specifically add a `back` button to every view controller. Surely there's an easier way!

#### Embed in Navigation Controller

Let's put our stack of view controllers into a navigation controller. In the storyboard, select the initial view controller which left-most in the stack. In then Xcode taskbar, open `Editor` menu, open the `Embed in >` sub-menu and select the `Navigation Controller` option. This will insert a new `UINavigationController` that becomes will inherit the initial view controller status and segue to the view controller that was selected. Select the new `UINavigationController` in the storyboard and change its size metric to match `iPhone 4.7-inch` to match the rest of the view controllers.

Run the program again with `⌘` `R`. Click through the whole stack of view controllers. Notice how the navigation controller appears over the view controllers in the stack and provides a `back` button starting with the second view controller?

#### *Present Modally* Segue

Now, use the `Yellow.` button (the incorrect answer to the third question) to **present modally** the `FISGorgeOfEternalPerilViewController` with the label reading `AUUUGGGHH!!!!!!` placed above. **Note:** *It is a convention to place modal view controllers* ***above*** *the stack they are associated with as a further indication that they are presented modally.*

