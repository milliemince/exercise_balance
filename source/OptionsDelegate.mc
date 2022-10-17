import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;

class OptionsDelegate extends WatchUi.InputDelegate {

    function initialize() {
        InputDelegate.initialize();
    }

    function onTap(clickEvent) {
        var coordinate = clickEvent.getCoordinates(); // e.g. [36, 40]
        if (coordinate[1] >= 80 and coordinate[1] <= 160) {
            //push recommendations view
            System.println("Switching to Recommendations View");
            WatchUi.pushView(new RecommendationsView(), new RecommendationsDelegate(), WatchUi.SWIPE_LEFT);
        } else if (coordinate[1] >= 200 and coordinate[1] <= 280) {
            //push history view
            System.println("Switching to History View");
            WatchUi.pushView(new HistoryView(), new HistoryDelegate(), WatchUi.SWIPE_LEFT);
        }
        return true;
    }

}