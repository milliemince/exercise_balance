import Toybox.Lang;
import Toybox.WatchUi;

class HomePageDelegate extends WatchUi.BehaviorDelegate {

    function initialize() {
        BehaviorDelegate.initialize();
    }

    //handles swipe to options screen
    function onSwipe(swipeEvent) {
        System.println(swipeEvent.getDirection());
        if (swipeEvent.getDirection() == 3) {
            WatchUi.pushView(new OptionsView(), new OptionsDelegate(), WatchUi.SLIDE_RIGHT);
        }
    }

    //handle tap to add activity screen
    function onTap(clickEvent) {
        var coordinate = clickEvent.getCoordinates(); // e.g. [36, 40]
        System.println(coordinate);
        if (coordinate[0] >= 300 and coordinate[1] >= 140 and coordinate[1] <= 240) {
            //push recommendations view
            System.println("Switching to Add Activity View");
            WatchUi.pushView(new AddActivityView(), new AddActivityDelegate(), WatchUi.SWIPE_LEFT);
        } 
        return true;
    }

}