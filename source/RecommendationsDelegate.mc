import Toybox.Lang;
import Toybox.WatchUi;

class RecommendationsDelegate extends WatchUi.BehaviorDelegate {

    function initialize() {
        BehaviorDelegate.initialize();
    }

    function onSwipe(swipeEvent) {
        System.println(swipeEvent.getDirection());
        if (swipeEvent.getDirection() == 3) {
            System.println("Swipe back detected, popping view");
            WatchUi.popView(WatchUi.SLIDE_DOWN);
        }
    }
}