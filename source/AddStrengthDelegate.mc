import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;

class AddStrengthDelegate extends WatchUi.InputDelegate {

    function initialize() {
        InputDelegate.initialize();
    }

    function onTap(clickEvent) {
        var coordinate = clickEvent.getCoordinates(); // e.g. [36, 40]
        //System.println(coordinate);
        if (coordinate[1] <= 120) {
            System.println("Increment upper_body");
        } else if (coordinate[1] <= 240) {
            System.println("Increment lower_body");
        } else {
            System.println("Increment full_body");
        }
    }

}