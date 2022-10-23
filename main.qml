import QtQuick
import QtQuick.VirtualKeyboard

Window {
    id: window
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

//    MultiPointTouchArea {
//        anchors.fill: parent
//        touchPoints: [
//            TouchPoint {id: tp1 },
//            TouchPoint {id: tp2 }
//        ]
//    }

//    Rectangle {
//        id: blueRect
//        anchors {
//            left: parent.left;  leftMargin:10
//            right: parent.right; rightMargin: 40
//            top: parent.top; topMargin: 50
//            bottom: parent.bottom; bottomMargin: 100

//        }
//        color: "blue"
//        x: tp1.x; y: tp1.y


//        Rectangle {
//            id: redRect
//            anchors.centerIn: blueRect
//            color:"red"
//            width: 150; height: 100
//            x: tp2.x; y: tp2.y
//        }
//    }

    Item {
        anchors.fill: parent
        TapHandler {
            acceptedButtons: Qt.LeftButton
            onTapped: {
//                blueRect.color = "red"
//                redRect.color = "blue"
                console.log("Left Button Clicked!")
            }
        }
    }

    Item {
        anchors.fill: parent
        TapHandler {
            acceptedButtons: Qt.RightButton
            onTapped: {
//                blueRect.color = "blue"
//                redRect.color = "red"
                console.log("Right Button Clicked!")
            }
        }
    }



    InputPanel {
        id: inputPanel
        z: 99
        x: 0
        y: window.height
        width: window.width

        states: State {
            name: "visible"
            when: inputPanel.active
            PropertyChanges {
                target: inputPanel
                y: window.height - inputPanel.height
            }
        }
        transitions: Transition {
            from: ""
            to: "visible"
            reversible: true
            ParallelAnimation {
                NumberAnimation {
                    properties: "y"
                    duration: 250
                    easing.type: Easing.InOutQuad
                }
            }
        }


    }
}
