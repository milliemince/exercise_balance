import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;

class AddActivityDelegate extends WatchUi.InputDelegate {

    function initialize() {
        InputDelegate.initialize();
    }

    function onTap(clickEvent) {
        var coordinate = clickEvent.getCoordinates(); // e.g. [36, 40]
        if (coordinate[1] >= 80 and coordinate[1] <= 160) {
            //push recommendations view
            System.println("Switching to Add Strength View");
            WatchUi.pushView(new AddStrengthView(), new AddStrengthDelegate(), WatchUi.SWIPE_LEFT);
        } else if (coordinate[1] >= 200 and coordinate[1] <= 280) {
            //push cardio view
            System.println("Switching to Add Cardio View");
            WatchUi.pushView(new AddCardioView(), new AddCardioDelegate(), WatchUi.SWIPE_LEFT);
        }
        return true;
    }

}