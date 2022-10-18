import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;

class AddCardioDelegate extends WatchUi.InputDelegate {

    function initialize() {
        InputDelegate.initialize();
    }

    function onTap(clickEvent) {
        var coordinate = clickEvent.getCoordinates(); // e.g. [36, 40]
        //System.println(coordinate);
        if (coordinate[0] <= 175) {
            if (coordinate[1] <= 175) {
                System.println("Increment run");
            } else {
                System.println("Increment bike");
            }
        } else {
            if (coordinate[1] <= 175) {
                System.println("Increment tennis");
            } else {
                System.println("Increment other");
            }
        }
    }

    // function onTap(clickEvent) {
    //     var coordinate = clickEvent.getCoordinates(); // e.g. [36, 40]
    //     if (coordinate[1] >= 80 and coordinate[1] <= 160) {
    //         //push recommendations view
    //         System.println("Switching to Add Strength View");
    //         WatchUi.pushView(new AddCardioView(), new AddCardioDelegate(), WatchUi.SWIPE_LEFT);
    //     } else if (coordinate[1] >= 200 and coordinate[1] <= 280) {
    //         //push history view
    //         System.println("Switching to Add Cardio View");
    //         WatchUi.pushView(new HistoryView(), new HistoryDelegate(), WatchUi.SWIPE_LEFT);
    //     }
    //     return true;
    // }

}